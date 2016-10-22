#include "Socket.h"
#include "Protocal.h"
#include "Epoll.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

namespace net {

Socket::Socket() {
	this->init(IPPROTO_TCP, nullptr);
}

Socket::Socket (IPPROTO ipproto) {
	this->init(ipproto, nullptr);
}
	
Socket::Socket (Epoll* epoll) {
	this->init(IPPROTO_TCP, epoll);
}

Socket::Socket (IPPROTO ipproto, Epoll* epoll) {
	this->init(ipproto, epoll);
}
	
void Socket::init(IPPROTO ipproto, Epoll* epoll) {
	this->ipproto = ipproto;
	this->epoll = epoll;
	sendBuff = new BasicByteBuff(1024);
	recvBuff = new BasicByteBuff(1024);
	createSocket();
}

Socket::~Socket() {
	delete sendBuff;
	delete recvBuff;
}

bool Socket::createSocket() {
	if ( (sock = socket(AF_INET, SOCK_STREAM, ipproto)) == -1) {
		printf("create socket fail: %s(errno: %d)\n", strerror(errno), errno);
		return false;
	}
	return true;
}

bool Socket::makeNonBlocking() {
	int flags, s;
	flags = fcntl (sock, F_GETFL, 0); 
	if (flags == -1) {   
		printf("fcntl get sock flags error: %s(errno:)\n", strerror(errno), errno);
		return false; 
	}   

	flags |= O_NONBLOCK;
	s = fcntl (sock, F_SETFL, flags);
	if (s == -1) 
	{   
		printf("fcntl set sock flags error: %s(errno:)\n", strerror(errno), errno);
		return false; 
	}   
	return true;
}

bool Socket::bind(int port) {
	return bind(INADDR_ANY, port);
}

bool Socket::bind(std::string host, int port) {
	struct in_addr addr;
	inet_pton(AF_INET, host.c_str(), &addr);
	return bind(addr.s_addr, port);
}

bool Socket::bind(int host, int port) {
	struct sockaddr_in addr;
	memset(&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = htonl(host);
	addr.sin_port = htons(port);

	if (::bind(sock, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
		printf("bind socket error: %s(errno:%d)\n", strerror(errno), errno);
		return false;
	}
	return true;
}

bool Socket::connect(std::string servhost, int port) {
	struct sockaddr_in servaddr;
	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(port);
	if (inet_pton(AF_INET, servhost.c_str(), &servaddr.sin_addr) < 0) {
		printf("inet_pton fail, error:%s (errno:%d)\n", strerror(errno), errno);
		return false;;
	}

	if (::connect(sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
		printf("connect fail, error: %s(errno: %d)", strerror(errno), errno);
		return false;
	}
	return true;
}

bool Socket::listen() {
	if (::listen(sock, SOMAXCONN) == -1) {
		printf("listen fail, error: %s(errno:%d)\n", strerror(errno), errno);
		return false;
	}
	return true;
}

Socket* Socket::accept() {
	int client_sock = ::accept(sock, (struct sockaddr*)NULL, NULL);
	if (client_sock == -1) {
		if (errno == EAGAIN || errno == EWOULDBLOCK || errno == ECONNABORTED || errno == EPROTO ) {
			return NULL;
		}
		printf("accept fail, error: %s(errno:%d)\n", strerror(errno), errno);	
		return NULL;
	}
	Socket* clisock = new Socket();
	clisock->sock = client_sock;
	return clisock;
}

void Socket::close() {
	if (epoll != nullptr) {
		epoll->delEvent(this, EPOLL_ALL_EVENT);
	}
	::close(sock);
	if (listener != nullptr) {
		listener->onSocketClosed(this);
	}
}
	
int Socket::send(BYTE* buf, DWORD size) {
	return sendInternal(buf, size);
	//if (buf == nullptr || size == 0) {
		//return 0;
	//}

	//int ret = write(sock, buf, size);
	//if (ret != size && (errno == EAGAIN || errno == EWOULDBLOCK)) {
		//ret = sendToBuf(buf+ret, size - ret);
		//ret = sendToBuf(buf, size);
	//} else if (ret == -1) {
		//close();
	//}
	//return ret;
}

int Socket::sendToBuf(BYTE* buf, DWORD size) {
	return sendBuff->write(buf, size);
}

int Socket::flush() {
	BYTE buff[1024];
	int sendSize = 0;
	while(sendBuff->getDataSize() > 0) {
		int size = sendBuff->read(buff, 1024);
		int ret = sendInternal(buff, size);
		if (ret == size) {
			if (errno == EAGAIN || errno == EWOULDBLOCK) {
				break;
			}
		}
		if (ret <= 0) {
			break;
		}
		sendSize += ret;
	}
	if (sendSize > 0) {
		sendBuff->freeSpace();
	}
	return sendSize;
}

int Socket::recv(BYTE* buf, DWORD size) {
	int ret = recvBuff->read(buf, size);
	if (ret > 0) {
		recvBuff->freeSpace();
	}
	return ret;
}

int Socket::recvToBuf() {
	BYTE buf[1024];
	int bufferedSize = 0;
	while(1) {
		int ret = recvInternal(buf, 1024);
		if (ret == -1) {
			if (errno == EAGAIN || errno == EWOULDBLOCK) {
				break;
			}
		}
		if (ret == 0) {
			break;
		}
		int bufret = recvBuff->write(buf, ret);
		if (ret != bufret) {
			printf("[WARN] recvToBuf, write to buf size != recv size\n");
		}
		bufferedSize += bufret;
	};
	return bufferedSize;
}

int Socket::sendInternal(BYTE* buf, DWORD size) {
	int ret = write(sock, buf, size);
	if (ret == -1) {
		if (errno != EAGAIN && errno != EWOULDBLOCK) {
			printf("send fail, close socket\n");
			close();	
		}
	}
	return ret;
}
	
int Socket::recvInternal(BYTE* buf, DWORD size) {
	int ret = read(sock, buf, size);
	if (ret == -1) {
		if (errno != EAGAIN && errno != EWOULDBLOCK) {
			printf("recv fail, close socket\n");
			close();	
		}
	}
	return ret;
}

}

