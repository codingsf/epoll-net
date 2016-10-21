#ifndef EPOLL_H_KV1FMEXP
#define EPOLL_H_KV1FMEXP

#include "Socket.h"
#include <sys/epoll.h>

NAMESPACE_BEGIN

enum EPOLLEVENT {
	EPOLLIN = ::EPOLLIN,
	EPOLLPRI = ::EPOLLPRI,
	EPOLLOUT = ::EPOLLOUT,
	EPOLLHUP = ::EPOLLHUP,
	EPOLLERR = ::EPOLLERR,
	EPOLLET = ::EPOLLET,
};

#define EPOLL_ALL_EVENT (EPOLLIN | EPOLLET | EPOLLOUT | EPOLLPRI  | EPOLLHUP | EPOLLERR)

class Epoll
{
public:
	Epoll ();
	virtual ~Epoll ();

	bool create();
	bool setEvent(Socket* sock, DWORD event);
	void delEvent(Socket* sock, DWORD event);

	void doEpoll(Socket* servsock);

	void close();
private:
	void handleAccept(Socket* servsock);
	void handleInputBuffer(Socket* sock);
	void handleOutputBuffer(Socket* sock);
	void handleError(Socket* sock);

private:
	/* data */
	int epollfd = -1;
};

NAMESPACE_END

#endif /* end of include guard: EPOLL_H_KV1FMEXP */
