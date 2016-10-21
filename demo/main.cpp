#include "ByteBuff.h"
#include "Thread.h"
#include "Runnable.h"
#include "TaskExecutor.h"
#include "Task.h"
#include "Server.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>

using namespace net;

void printByteBuffStatus(ByteBuff* bytebuff) {
	printf("readpos(%d), writepos(%d), buffersize(%d), datasize(%d)\n"
			, bytebuff->getReadPos()
			, bytebuff->getWritePos()
			, bytebuff->getBufferSize()
			, bytebuff->getDataSize());
}

void basicByteBuffTest() {
	BasicByteBuff * bytebuf = new BasicByteBuff(8);
	BYTE buf[16];
	memset(buf, 0, sizeof(buf));
	bytebuf->write((const BYTE*)"12345", 6);
	bytebuf->read(buf, 16);
	bytebuf->freeSpace();
	printf("%s\n", buf);
	printByteBuffStatus(bytebuf);

	memset(buf, 0, sizeof(buf));
	bytebuf->write((const BYTE*)"67890", 6);
	bytebuf->read(buf, 16);
	printf("%s\n", buf);
	bytebuf->freeSpace();
	printByteBuffStatus(bytebuf);

	memset(buf, 0, sizeof(buf));
	bytebuf->write((const BYTE*)"1234567890", 11);
	bytebuf->read(buf, 16);
	printf("%s\n", buf);
	bytebuf->freeSpace();
	printByteBuffStatus(bytebuf);
}

class ThreadTestRunable: public Runnable {
public:
	virtual void run() {
		while (1) {
			sleep(1);
			printf("in ThreadTest Runable\n");
			Thread::exit();
		}
	}
};

void threadTest() {
	Thread* t = new Thread("", new ThreadTestRunable(), true);
	t->start();
	printf("in main thread\n");
	t->join();
	printf("thread test end\n");
	delete t;
}

void taskTest() {
	class Task1 : public Task {
	public:
		Task1() {
			executeTimes = 10;
			interval = 50;
		}
		virtual ~Task1() {}

		virtual void doRun() {
			printf("in task1\n");
		}
	};

	class Task2: public Task {
	public:
		Task2() {
			executeTimes = 6;
			interval = 100;
		}

		virtual ~Task2() { }

		virtual void doRun() {
			printf("in task2\n");
		}
	};

	TaskExecutor* executor = new TaskExecutor();
	Task1* t1 = new Task1();
	Task2* t2 = new Task2();
	Task* t3 = new Task(3, 50, [](){printf("in task3\n");});
	Thread* thread = new Thread(executor);
	executor->execute(t1);
	executor->execute(t2);
	executor->execute(t3);
	thread->start();
	sleep(5);
	executor->finish();
	thread->join();
}

void serverTest() {
	Server* server = new Server(9998);
	if (!server->init()) {
		printf("init server fail\n");
	}
	
	if (!server->start()) {
		printf("start server fail\n");
	}

	while(!server->isFinished())
		sleep(1);
	//server->finish();
	//printf("server finished\n");
}

int main() {
	//basicByteBuffTest();

	//threadTest();

	//taskTest();

	serverTest();
	return 0;
}










