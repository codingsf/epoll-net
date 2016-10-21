#ifndef RUNNABLE_H_PYQF8C25
#define RUNNABLE_H_PYQF8C25

#include "Base.h"

NAMESPACE_BEGIN

class Runnable {
public:
	virtual ~Runnable(){}
	virtual void run() = 0;
};

NAMESPACE_END

#endif /* end of include guard: RUNNABLE_H_PYQF8C25 */
