#include "Condition.h"


NAMESPACE_BEGIN

Condition::Condition(){
	condition = PTHREAD_COND_INITIALIZER;
	waiting = false;
}

Condition::~Condition() {
	pthread_cond_destroy(&condition);
}

void Condition::lock() {
	lck.lock();
}

void Condition::unlock() {
	lck.unlock();
}

void Condition::wait() {
	waiting = true;
	pthread_cond_wait(&condition, &(lck.mutex));
}

void Condition::notify() {
	if (waiting) {
		waiting = false;
		pthread_cond_signal(&condition);
	}
}

void Condition::notifyAll() {
	if (waiting) {
		waiting = false;
		pthread_cond_broadcast(&condition);
	}
}

NAMESPACE_END
