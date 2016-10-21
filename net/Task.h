#ifndef TASK_H_TEZNWPQL
#define TASK_H_TEZNWPQL

#include "Base.h"
#include "Runnable.h"

#include <functional>

NAMESPACE_BEGIN

class Task : public Runnable
{
public:
	typedef void (DoRunFunc)(void);

	Task ();
	Task (DWORD executeTimes, DWORD interval);
	Task (DWORD executeTimes, DWORD interval, std::function<DoRunFunc> doRunFunc);
	Task (DWORD executeTimes, DWORD interval, QWORD finalTime);
	Task (DWORD executeTimes, DWORD interval, QWORD finalTime, std::function<DoRunFunc> doRunFunc);
	virtual ~Task ();

	virtual bool isRunnable();
	virtual bool isFinished();
	virtual void run();
	virtual void final();

	virtual void doRun();

	inline DWORD getExecuteTimes() { return executeTimes; }
	inline bool isInfinate() { return executeTimes == 0; }
	inline bool getExecutedTimes() { return executedTimes; }
	inline QWORD getFinalTime() { return finalTime; }
	inline DWORD getInterval() { return interval; }
	inline DWORD getLastExecuteTime() { return lastExecuteTime; }

protected:
	void init(DWORD executeTimes, DWORD interval, QWORD finalTime, std::function<DoRunFunc> doRunFunc);

protected:
	/* data */
	DWORD executeTimes;	// 0 infinate
	DWORD executedTimes;
	QWORD finalTime;		// ms
	DWORD interval;		// interval in ms
	QWORD lastExecuteTime;
	std::function<DoRunFunc> doRunFunc;
};

NAMESPACE_END

#endif /* end of include guard: TASK_H_TEZNWPQL */
