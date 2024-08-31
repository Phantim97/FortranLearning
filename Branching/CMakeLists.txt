cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES Fortran)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

add_executable(branching main.f90)

add_custom_target(run COMMAND branching DEPENDS branching COMMENT "Running Fortran Program...")