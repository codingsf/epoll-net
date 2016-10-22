#include "Socket.h"
#include "Protocal.h"
#include "Thread.h"
#include "Lock.h"
#include "Runnable.h"
#include "Utils.h"
#include <stdio.h>
#include <string.h>
#include <memory.h>
#include <malloc.h>

using namespace net;

class CreateClient : public Runnable {
public:
	void run() {

		Socket* sock = new Socket();

		if (!sock->connect("localhost", 9998)) {
			printf("connect fail\n");
		}

		int sendSize = 0;
		int i=0;
		while(1) {
			char buf[10] = {0};
			snprintf(buf, 10, "%d", i++);
			int ret = Protocal::send(sock, (BYTE*)buf, strlen(buf) + 1);
			if (ret <=0 ) {
				printf("send fail\n");
			}
			sendSize += 12 + strlen(buf) + 1;
		}

		sock->close();
	}
};

int main() {

	//char* buf = (char*)malloc(65536);
	//memmove(buf, buf+12, 65524);
	//buf = (char*)realloc(buf, 65536*2);
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

	return 0;
}


