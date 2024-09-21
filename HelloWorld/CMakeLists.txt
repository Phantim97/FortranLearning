cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES Fortran)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

add_executable(hello_world main.f90)

add_custom_target(run_hello COMMAND hello_world DEPENDS hello_world COMMENT "Running Fortran Program...")