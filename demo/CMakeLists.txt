cmake_minimum_required(VERSION 2.8)

include_directories(${PROJECT_SOURCE_DIR}/net)
link_directories(${PROJECT_BINARY_DIR}/lib)

set(APP_SRC main.cpp)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
add_executable(demo ${APP_SRC})
target_link_libraries(demo libnet)

