cmake_minimum_required(VERSION 4.1)

file(STRINGS "VERSION" PROJECT_VERSION)
project("viz" VERSION ${PROJECT_VERSION})

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CPP_SOURCES src/main.cc)
add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE ${CPP_SOURCES})

set(PROJECT_COMPILER_FLAGS -Wall -Wextra -Werror -Wconversion -Wshadow
                           -Wpedantic)
target_compile_options(${PROJECT_NAME} PRIVATE ${PROJECT_COMPILER_FLAGS})
