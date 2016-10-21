#ifndef TASKEXECUTORGROUP_H_YH2LUCNU
#define TASKEXECUTORGROUP_H_YH2LUCNU

#include "Base.h"
#include <vector>

NAMESPACE_BEGIN

class Task;
class Thread;
/**
 *thread safe
 **/
class TaskExecutorGroup
{
public:
	TaskExecutorGroup ();
	TaskExecutorGroup(WORD threadNum);
	virtual ~TaskExecutorGroup ();

	virtual bool execute(Task* task);

	virtual void finish();
	inline bool isFinished() { return finished; }

protected:
	bool init(WORD threadNum);

private:
	/* data */
	std::vector<Thread*> threads;

	volatile bool finished = false;
	int curThread = 0;
};

NAMESPACE_END


#endif /* end of include guard: TASKEXECUTORGROUP_H_YH2LUCNU */
