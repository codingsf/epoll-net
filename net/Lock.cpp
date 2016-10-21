#include "Lock.h"

NAMESPACE_BEGIN

//---------
//Lock
//---------
Lock::Lock() {
	mutex = PTHREAD_MUTEX_INITIALIZER;
}

Lock::~Lock() {
	pthread_mutex_destroy(&mutex);
}

bool Lock::tryLock() {
	int ret = pthread_mutex_trylock(&mutex);
	return ret == 0;
}
void Lock::lock() {
	pthread_mutex_lock(&mutex);
}

void Lock::unlock() {
	pthread_mutex_unlock(&mutex);
}


//------------
//RWLock
//------------

RWLock::RWLock() {
	lock = PTHREAD_RWLOCK_INITIALIZER;
}

RWLock::~RWLock() {
	pthread_rwlock_destroy(&lock);
}

bool RWLock::tryRLock() {
	return 0 == pthread_rwlock_tryrdlock(&lock);
}

bool RWLock::tryWLock() {
	return 0 == pthread_rwlock_trywrlock(&lock);
}

void RWLock::rlock() {
	pthread_rwlock_rdlock(&lock);
}

void RWLock::wlock() {
	pthread_rwlock_wrlock(&lock);
}

void RWLock::unlock() {
	pthread_rwlock_unlock(&lock);
}


//------------
//AutoLock
//------------

AutoLock::AutoLock(Lock& lock) : lock(lock){
	lock.lock();
}

AutoLock::~AutoLock() {
	lock.unlock();
}


//------------
//AutoRLock
//------------

AutoRLock::AutoRLock(RWLock& lock): lock(lock) {
	lock.rlock();
}

AutoRLock::~AutoRLock() {
	lock.unlock();
}


//------------
//AutoWLock
//------------

AutoWLock::AutoWLock(RWLock& lock): lock(lock) {
	lock.rlock();
}

AutoWLock::~AutoWLock() {
	lock.unlock();
}
NAMESPACE_END

