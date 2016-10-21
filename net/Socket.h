#ifndef SOCKET_H_WHURO4M7
#define SOCKET_H_WHURO4M7

#include <string>
#include <netinet/in.h>
#include "Base.h"
#include "ByteBuff.h"

NAMESPACE_BEGIN

enum IPPROTO {
	IPPROTO_TCP = ::IPPROTO_TCP,
	IPPROTO_UDP = ::IPPROTO_UDP,
};

class Socket;
class SocketEventListener {
public:
	virtual void onNewConnection(Socket* sock){};
	virtual void onInputBuffer(Socket* sock) = 0;
	virtual void onOutputBuffer(Socket* sock) = 0;
	virtual void onSocketClosed(Socket* sock){};
};

class Epoll;
class Socket
{
public:
	Socket ();
	Socket (IPPROTO ipproto);
	Socket (Epoll* epoll);
	Socket (IPPROTO ipproto, Epoll* epoll);

	virtual ~Socket ();

	bool makeNonBlocking();
	bool bind(int port);
	bool bind(std::string host, int port);
	bool connect(std::string servhost, int port);
	bool listen();
	Socket* accept();
	void close();

	int send(BYTE* buf, DWORD size);
	int sendToBuf(BYTE* buf, DWORD size);
	int flush();

	int recv(BYTE* buf, DWORD size);
	int recvToBuf();

	inline BasicByteBuff* getSendBuff() { return sendBuff; }
	inline BasicByteBuff* getRecvBuff() { return recvBuff; }
	inline SocketEventListener* getListener() { return listener; }
	inline void setListener(SocketEventListener* listener) { this->listener = listener; }
	inline int getSocketfd() { return sock; }
	inline void setEpoll(Epoll* epoll) { this->epoll = epoll; }
	
private:
	void init(IPPROTO ipproto, Epoll* epoll);
	bool createSocket();
	bool bind(int host, int port);


	int sendInternal(BYTE* buf, DWORD size);
	int recvInternal(BYTE* buf, DWORD size);

private:
	/* data */
	int sock;

	DWORD ipproto;

	BasicByteBuff* sendBuff = nullptr;
	BasicByteBuff* recvBuff = nullptr;

	Epoll *epoll;
	SocketEventListener *listener;
};


NAMESPACE_END

#endif /* end of include guard: SOCKET_H_WHURO4M7 */
