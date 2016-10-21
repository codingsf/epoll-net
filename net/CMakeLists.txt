cmake_minimum_required(VERSION 2.8)

set(LIB_SRC 
	Socket.cpp
	Epoll.cpp
	ByteBuff.cpp
	Protocal.cpp
	Thread.cpp
	Task.cpp
	TaskExecutor.cpp
	TaskExecutorGroup.cpp
	Lock.cpp
	Condition.cpp
	TCPTask.cpp
	Server.cpp
	)
add_library(libnet ${LIB_SRC})
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
set_target_properties(libnet PROPERTIES OUTPUT_NAME "libnet")
