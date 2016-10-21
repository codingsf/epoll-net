#include "Server.h"
#include "TaskExecutorGroup.h"
#include "TCPTask.h"
#include "Epoll.h"
#include "Task.h"

NAMESPACE_BEGIN


Server::Server(DWORD port) {
	this->port = port;
	this->teg = new TaskExecutorGroup();
}

Server::Server(DWORD port, TaskExecutorGroup* teg) {
	this->port = port;
	this->teg = teg;
}

Server::~Server() {
	if (teg != nullptr) {
		delete teg;	
	}

	if (epollteg != nullptr) {
		delete epollteg;
	}

	if (servsock != nullptr) {
		delete servsock;	
	}

	if (epoll != nullptr) {
		delete epoll;
	}
}

bool Server::init() {
	this->epoll = new Epoll();
	if(this->epoll == nullptr || !this->epoll->create()) {
		return false;
	}

	this->servsock = new Socket();
	if (this->servsock == nullptr) {
		this->epoll->close();
		return false;
	}

	if (!this->servsock->bind(this->port)) {
		this->epoll->close();
		this->servsock->close();
		return false;
	}

	if (!this->servsock->makeNonBlocking()) {
		this->epoll->close();
		this->servsock->close();
		return false;	
	}

	this->servsock->setListener(this);
	this->servsock->setEpoll(this->epoll);
	this->epoll->setEvent(this->servsock, EPOLL_ALL_EVENT );

	return true;
}

bool Server::start() {
	if(!this->servsock->listen())
		return false;

	this->epollteg = new TaskExecutorGroup(1);
	if (epollteg == nullptr) {
		return false;
	}
	Task* epolltask = new Task(1, 0, [this]() {
			while (!this->finished) {
				this->epoll->doEpoll(this->servsock);
			}
	});
	if (epolltask == nullptr) {
		return false;
	}
	epollteg->execute(epolltask);
	//while (!this->finished) {
		//this->epoll->doEpoll(this->servsock);
	//}
	return true;
}

void Server::finish() {
	finished = true;
	teg->finish();
	servsock->close();
	epoll->close();
	epollteg->finish();
}

void Server::onNewConnection(Socket* sock) {
	TCPTask* task = new TCPTask(sock);
	teg->execute(task);
}

void Server::onInputBuffer(Socket* sock) {

}

void Server::onOutputBuffer(Socket* sock) {

}

void Server::onSocketClosed(Socket* sock) {

}

bool Server::msgParse(BYTE* buf, DWORD size) {
	return true;
}

NAMESPACE_END


