#include "Epoll.h"
#include <unistd.h>
#include <errno.h>
#include <string.h>

NAMESPACE_BEGIN

Epoll::Epoll() 
{}

Epoll::~Epoll() 
{}


bool Epoll::create() {
	epollfd = epoll_create(10000);
	return true;
}

bool Epoll::setEvent(Socket* sock, DWORD event) {
	struct epoll_event ev;
	ev.events = event;
	ev.data.ptr = sock;
	epoll_ctl(epollfd, EPOLL_CTL_ADD, sock->getSocketfd(), &ev);
	return true;
}

void Epoll::delEvent(Socket* sock, DWORD event) {
	struct epoll_event ev;
	ev.events = event;
	ev.data.ptr = sock;
	epoll_ctl(epollfd, EPOLL_CTL_DEL, sock->getSocketfd(), &ev);

}

void Epoll::doEpoll(Socket* servsock) {
	struct epoll_event events[1024];
	int num = epoll_wait(epollfd, events, 1024, -1);
	if (errno != 0 && errno != EAGAIN && errno != EWOULDBLOCK) {
		printf("%s\n", strerror(errno));
	}
	for (int i = 0; i < num; ++i) {
		Socket* sock = (Socket*)events[i].data.ptr;
		if (sock == servsock && (events[i].events & EPOLLIN)) {
			handleAccept(servsock);	
		} 
		else if (isSetFlag(events[i].events, EPOLLIN | EPOLLPRI)) 
		{
			//printf("input\n");
			handleInputBuffer(sock);
		} 
		else if (isSetFlag(events[i].events, EPOLLOUT)) 
		{
			//printf("output\n");
			handleOutputBuffer(sock);
		}
		else if (isSetFlag(events[i].events, EPOLLERR | EPOLLHUP)) 
		{
			//printf("error\n");
			handleError(sock);
		} 
		else
		{
			//printf("unknown\n");
		}
	}
}
	
void Epoll::handleAccept(Socket* servsock) {
	while (1) {
		Socket* cliSock = servsock->accept();
		if (cliSock != NULL) {
			cliSock->makeNonBlocking();
			cliSock->setEpoll(this);
			setEvent(cliSock, EPOLL_ALL_EVENT);
			if (servsock->getListener() != nullptr) {
				servsock->getListener()->onNewConnection(cliSock);
			}
		} else {
			break;
		}
	}
}
	
void Epoll::handleInputBuffer(Socket* sock) {
	sock->recvToBuf();
	if (sock->getListener() != nullptr) {
		sock->getListener()->onInputBuffer(sock);	
	}
}

void Epoll::handleOutputBuffer(Socket* sock) {
	sock->flush();
	if (sock->getListener() != nullptr) {
		sock->getListener()->onOutputBuffer(sock);	
	}
}

void Epoll::handleError(Socket* sock) {
	sock->close();
}

void Epoll::close() {
	::close(epollfd);
}


NAMESPACE_END


