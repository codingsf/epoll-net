#ifndef TASKEXECUTOR_H_NIH9WJOT
#define TASKEXECUTOR_H_NIH9WJOT

#include "Base.h"
#include "Runnable.h"
#include "Condition.h"
#include <stdio.h>
#include <vector>
#include <pthread.h>

NAMESPACE_BEGIN

class Task;
class TaskExecutor : public Runnable
{
public:
	TaskExecutor ();
	virtual ~TaskExecutor ();

	virtual void execute(Task* task);

	virtual void run();

	inline bool isFinished() { return finished; }
	void finish();

private:
	/* data */
	std::vector<Task*> tasks;

	volatile bool finished;

	Condition cond;
};

NAMESPACE_END


#endif /* end of include guard: TASKEXECUTOR_H_NIH9WJOT */
