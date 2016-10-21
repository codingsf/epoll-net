#ifndef THREAD_H_EOYQCVRL
#define THREAD_H_EOYQCVRL

#include "Base.h"
#include <pthread.h>
#include <string>

NAMESPACE_BEGIN

class Runnable;
class Thread
{
public:
	Thread();
	Thread(std::string name);
	Thread (Runnable* runnable);
	Thread(std::string name, Runnable* runnable);
	Thread(std::string name, Runnable* runnable, bool joinable);
	virtual ~Thread ();

	virtual void start();
	void join();
	void detach();
	static void exit();

	virtual void run();

	static QWORD getCurrentThreadId();
	inline QWORD getThreadId() { return tid; }	
	inline std::string getThreadName() { return name; }
	inline bool isJoinable() { return joinable; }
	inline Runnable* getRunnable() { return runnable; }

private:
	void init(std::string name, Runnable* runnable, bool joinable);

private:
	/* data */
	pthread_t tid;
	Runnable* runnable;
	std::string name;
	volatile bool joinable;
};


NAMESPACE_END
#endif /* end of include guard: THREAD_H_EOYQCVRL */
