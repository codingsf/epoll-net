#include "TaskExecutorGroup.h"
#include "Thread.h"
#include "TaskExecutor.h"

NAMESPACE_BEGIN

TaskExecutorGroup::TaskExecutorGroup() {
	this->init(8);
}

TaskExecutorGroup::TaskExecutorGroup(WORD threadNum) {
	this->init(threadNum);
}

TaskExecutorGroup::~TaskExecutorGroup() {
	if (!this->finished) {
		this->finish();
		for (auto t : threads) {
			t->join();
			delete t;
		}	
	}
}

bool TaskExecutorGroup::init(WORD threadNum) {
	for (int i = 0; i < threadNum; ++i) {
		TaskExecutor* executor = new TaskExecutor();
		Thread* t = new Thread(executor);	
		threads.push_back(t);
		t->start();
	}
	return true;
}

bool TaskExecutorGroup::execute(Task* task) {
	TaskExecutor* executor = (TaskExecutor*)threads[curThread]->getRunnable();
	if (executor != nullptr) {
		executor->execute(task);
	} else {
		return false;
	}
	curThread++;
	if (curThread >= threads.size()) {
		curThread = 0;
	}
	return true;
}

void TaskExecutorGroup::finish() {
	for (auto thread : threads) {
		TaskExecutor* executor = (TaskExecutor*)thread->getRunnable();
		executor->finish();
	}
}

NAMESPACE_END

