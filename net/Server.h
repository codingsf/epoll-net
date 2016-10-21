#ifndef SERVER_H_AKKXTQEN
#define SERVER_H_AKKXTQEN

#include "Base.h"
#include "Socket.h"

NAMESPACE_BEGIN

class TaskExecutorGroup;
class Epoll;
class Server : public SocketEventListener
{
public:
	Server (DWORD port);
	Server (DWORD port, TaskExecutorGroup* teg);
	virtual ~Server ();

	bool init();
	bool start();

	virtual void onNewConnection(Socket* sock);
	virtual void onInputBuffer(Socket* sock);
	virtual void onOutputBuffer(Socket* sock);
	virtual void onSocketClosed(Socket* sock);

	void send(BYTE* buf, DWORD size);

	bool isFinished() {return finished;}
	void finish(); 
protected:
	virtual bool msgParse(BYTE* buf, DWORD size);

private:
	/* data */
	TaskExecutorGroup* teg;
	TaskExecutorGroup* epollteg;
	Socket* servsock;
	Epoll* epoll;
	DWORD port;
	volatile bool finished;
};

NAMESPACE_END

#endif /* end of include guard: SERVER_H_AKKXTQEN */
