#include "Thread.h"
#include "Runnable.h"

NAMESPACE_BEGIN

Thread::Thread() {
	this->init("", nullptr, true);
}

Thread::Thread(std::string name) {
	this->init(name, nullptr, true);
}

Thread::Thread (Runnable* runnable) {
	this->init("", runnable, true);
}

Thread::Thread(std::string name, Runnable* runnable) {
	this->init(name, runnable, true);
}

Thread::Thread(std::string name, Runnable* runnable, bool joinable) {
	this->init(name, runnable, joinable);
}

Thread::~Thread() {
	if (runnable != nullptr) {
		delete runnable;
	}
}

void* pthread_run(void* data) {
	Thread* t = (Thread*)data;
	t->run();
	return nullptr;
}

void Thread::init(std::string name, Runnable* runnable, bool joinable) {
	this->name = name;
	this->runnable = runnable;
	this->joinable = joinable;
}

void Thread::start() {
	pthread_attr_t attr;
	pthread_attr_init(&attr);
	if (joinable) {
		pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE); 
	} else {
		pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
	}

	pthread_create(&tid, &attr, pthread_run, this);

	pthread_attr_destroy(&attr);
}

void Thread::join() {
	if (joinable) {
		pthread_join(tid, NULL);
	} else {
		printf("[WARN] trying to join an unjoinable thread.\n");
	}
}

void Thread::detach() {
	if (joinable) {
		pthread_detach(tid);
		joinable = false;
	}
}
	
void Thread::exit() {
	pthread_exit(NULL);
}

void Thread::run() {
	if (runnable != nullptr) {
		runnable->run();
	} else {
		printf("no operation in thread %s\n", name.c_str());
	}
}

QWORD Thread::getCurrentThreadId() {
	return pthread_self();
}

NAMESPACE_END
