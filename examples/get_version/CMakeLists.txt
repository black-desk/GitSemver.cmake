cmake_minimum_required(VERSION 3.12)

project(
  get_version
  VERSION 0.1.0
  LANGUAGES CXX)

include(../../GitSemver.cmake)

set(SEMVER ${PROJECT_VERSION})
gitsemver(SEMVER)

configure_file(src/configure.hpp.in src/configure.hpp @ONLY)

add_executable(get_version src/main.cpp
                           ${CMAKE_CURRENT_BINARY_DIR}/src/configure.hpp)

target_include_directories(
  get_version
  PRIVATE
  ${CMAKE_CURRENT_BINARY_DIR}/src
  )
