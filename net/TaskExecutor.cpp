#include "TaskExecutor.h"
#include "Task.h"
#include <stdio.h>
#include <unistd.h>

NAMESPACE_BEGIN

TaskExecutor::TaskExecutor() {
	finished = false;
}

TaskExecutor::~TaskExecutor() {
	if (!this->finished) {
		this->finish();
	}	
}

void TaskExecutor::execute(Task* task) {
	cond.lock();
	
	tasks.push_back(task);
	cond.notify();
	cond.unlock();
}

void TaskExecutor::run() {
	while(!this->finished) {
		cond.lock();
		if (tasks.empty()) {
			cond.wait();
			//printf("wake up in TaskExecutor\n");
		}

		for (auto it_task = tasks.begin(); it_task != tasks.end(); ) {
			Task* task = *it_task;
			if (task == nullptr) {
				printf("[WARN] get an null task in task executor\n");
				it_task = tasks.erase(it_task);
				continue;
			}
			if (task->isRunnable()) {
				task->run();
			}
			if (task->isFinished()) {
				it_task = tasks.erase(it_task);
				delete task;
			} else {
				it_task++;
			}
		}
		cond.unlock();
	}

	//printf("do clean job\n");
	// clean
	cond.lock();
	for (auto it_task = tasks.begin(); it_task != tasks.end(); ) {
		Task* task = *it_task;
		if (task == nullptr) {
			it_task = tasks.erase(it_task);
			continue;
		}
		task->final();
		it_task = tasks.erase(it_task);
		delete task;
	}
	cond.unlock();
}

void TaskExecutor::finish() {
	finished = true;
	cond.lock();
	cond.notify();
	cond.unlock();
}

NAMESPACE_END

