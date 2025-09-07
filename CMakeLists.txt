cmake_minimum_required(VERSION 3.28)

file(STRINGS "VERSION" PROJECT_VERSION)
project("viz" VERSION ${PROJECT_VERSION})

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_definitions("VIZ_DEBUG=$<CONFIG:Debug>")

# add_subdirectory(libs)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE src/main.cc)

# target_link_libraries(${PROJECT_NAME} PRIVATE viz-core)

target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Werror
                                               -Wconversion -Wshadow -Wpedantic)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)

set(CPACK_GENERATOR DEB)
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_PACKAGE_CONTACT example@example.com)

include(CPack)
