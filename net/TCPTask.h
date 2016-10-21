#ifndef TCPTASK_H_PFWLZSO1
#define TCPTASK_H_PFWLZSO1

#include "Base.h"
#include "Task.h"
#include "Socket.h"

NAMESPACE_BEGIN

class TCPTask : public Task, SocketEventListener
{
public:
	TCPTask ();
	TCPTask (Socket* sock);
	virtual ~TCPTask ();

	virtual void onInputBuffer(Socket* sock);
	virtual void onOutputBuffer(Socket* sock);
	virtual void onSocketClosed(Socket* sock);

	virtual void doRun();

	virtual bool send(BYTE* buf, DWORD size);

protected:
	virtual bool init(Socket* sock);
	// override me
	virtual bool msgParse(BYTE* buf, DWORD size);

private:
	/* data */
	Socket* sock;
	volatile bool canRead = false;
};

NAMESPACE_END

#endif /* end of include guard: TCPTASK_H_PFWLZSO1 */
