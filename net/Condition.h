#ifndef CONDITION_H_RYV0MILB
#define CONDITION_H_RYV0MILB

#include "Base.h"
#include "Lock.h"
#include <pthread.h>


NAMESPACE_BEGIN

class Condition
{
public:
	Condition ();
	virtual ~Condition ();

	void lock();
	void unlock();

	bool isWait();
	void wait();
	void notify();
	void notifyAll();

private:
	/* data */
	Lock lck;
	volatile bool waiting;
	pthread_cond_t condition;
};


NAMESPACE_END

#endif /* end of include guard: CONDITION_H_RYV0MILB */
