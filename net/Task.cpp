#include "Task.h"
#include "Utils.h"


NAMESPACE_BEGIN

Task::Task() {
	this->init(0, 0, (QWORD)-1, nullptr);
}
Task::Task (DWORD executeTimes, DWORD interval) {
	this->init(executeTimes, interval, (QWORD)-1, nullptr);
}

Task::Task (DWORD executeTimes, DWORD interval, std::function<DoRunFunc> doRunFunc) {
	this->init(executeTimes, interval, (QWORD)-1, doRunFunc);
}

Task::Task (DWORD executeTimes, DWORD interval, QWORD finalTime) {
	this->init(executeTimes, interval, finalTime, nullptr);
}

Task::Task (DWORD executeTimes, DWORD interval, QWORD finalTime, std::function<DoRunFunc> doRunFunc) {
	this->init(executeTimes, interval, finalTime, doRunFunc);
}

void Task::init(DWORD executeTimes, DWORD interval, QWORD finalTime, std::function<DoRunFunc> doRunFunc) {
	this->executeTimes = executeTimes;
	this->interval = interval;
	this->finalTime = finalTime;
	this->doRunFunc = doRunFunc;
}

Task::~Task() {
}

bool Task::isRunnable() {
	if (this->isInfinate()) {
		return true;
	}
	if (executedTimes >= executeTimes) {
		return false;
	}
	QWORD now = Utils::getMillionTimeStamp();
	if (lastExecuteTime != 0 && now < lastExecuteTime + interval) {
		return false;	
	}
	if (now > finalTime) {
		return false;	
	}
	return true;
}

void Task::run() {
	doRun();
	executedTimes++;
	QWORD now = Utils::getMillionTimeStamp();
	lastExecuteTime = now;
}

void Task::doRun() {
	if (doRunFunc != nullptr) {
		doRunFunc();
	}
}

void Task::final() {

}

bool Task::isFinished() {
	if (this->isInfinate()) {
		return false;
	}
	if (executedTimes >= executeTimes) {
		return true;
	}
	QWORD now = Utils::getMillionTimeStamp();
	if (now > finalTime) {
		return true;	
	}
	return false;
}

NAMESPACE_END

