#ifndef LOCK_H_Q4SWOSNT
#define LOCK_H_Q4SWOSNT

#include "Base.h"
#include <pthread.h>

NAMESPACE_BEGIN


class Lock
{
public:
	Lock ();
	virtual ~Lock ();

	bool tryLock();
	void lock();
	void unlock();

private:
	/* data */
	pthread_mutex_t mutex;

friend class Condition;
};

class RWLock
{
public:
	RWLock();
	virtual ~RWLock();

	bool tryRLock();
	bool tryWLock();
	void rlock();
	void wlock();
	void unlock();
private:
	pthread_rwlock_t lock;
};

class AutoLock {
public:
	AutoLock(Lock& lock);
	~AutoLock();

private:
	Lock& lock;
};

class AutoRLock {
public:
	AutoRLock(RWLock& lock);
	~AutoRLock();
private:
	RWLock& lock;
};

class AutoWLock {
public:
	AutoWLock(RWLock& lock);
	~AutoWLock();
private:
	RWLock& lock;
};

NAMESPACE_END

#endif /* end of include guard: LOCK_H_Q4SWOSNT */
