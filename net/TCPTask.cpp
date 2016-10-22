#include "TCPTask.h"
#include "Protocal.h"
#include "Thread.h"
#include "Utils.h"
#include <string.h>


NAMESPACE_BEGIN

TCPTask::TCPTask() {
	this->init(nullptr);
}

TCPTask::TCPTask(Socket* sock) {
	this->init(sock);
}

TCPTask::~TCPTask() {
	if (sock != nullptr) {
		sock->close();
		delete sock;
	}
}

bool TCPTask::init(Socket* sock) {
	this->sock = sock;
	if (this->sock != nullptr) {
		this->sock->setListener(this);
	}
	return true;
}
	
void TCPTask::onInputBuffer(Socket* sock) {
	canRead = true;
}

void TCPTask::onOutputBuffer(Socket* sock) {
}

void TCPTask::onSocketClosed(Socket* sock) {
}

void TCPTask::doRun() {
	if (canRead) {
		canRead = false;

		//TODO change to protobuf
		BYTE buf[1024];
		while(1) {
			memset(buf, 0, sizeof(buf));
			int size = Protocal::recv(sock, buf, 1024);
			if (size <= 0) {
				break;
			}
			msgParse(buf, size);
		}
	}
}

bool TCPTask::send(BYTE* buf, DWORD size) {
	int ret = Protocal::send(sock, buf, size);
	return ret == size;
}

bool TCPTask::msgParse(BYTE* buf, DWORD size) {
	//printf("thread(%llu):%s\n", Thread::getCurrentThreadId(), buf);
	return true;
}

NAMESPACE_END

