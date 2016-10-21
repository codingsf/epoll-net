#include "Socket.h"
#include "Protocal.h"
#include "Thread.h"
#include "Lock.h"
#include "Runnable.h"
#include "Utils.h"
#include <stdio.h>
#include <string.h>

using namespace net;

class CreateClient : public Runnable {
public:
	void run() {

		Socket* sock = new Socket();

		if (!sock->connect("localhost", 9998)) {
			printf("connect fail\n");
		}

		for (int i = 0; i < 100000; ++i) {
			char buf[10];
			snprintf(buf, 10, "%d", i);
			int ret = Protocal::send(sock, (BYTE*)buf, sizeof(i));
			if (ret <=0 ) {
				printf("send fail\n");
			}
		}

		sock->close();
	}
};

int main() {

	printf("%lu, %lu, %lu\n", sizeof(unsigned int), sizeof(unsigned long int), sizeof(unsigned long long));
	printf("%lu\n", Utils::getMillionTimeStamp());

	Thread* thread[10];
	for (int i = 0; i < 10; ++i) {
		thread[i] = new Thread(new CreateClient());
		thread[i]->start();
	}

	for (int i = 0; i < 10; ++i) {
		thread[i]->join();
	}

	printf("%lu\n", Utils::getMillionTimeStamp());
	//Socket* sock = new Socket();
	//if (!sock->connect("localhost", 9998)) {
		//printf("connect fail\n");
	//}

	//Protocal::send(sock, (BYTE*)"END", 4);
	//sock->close();

	return 0;
}


