cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES Fortran)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

add_executable(recurse main.f90)

add_custom_target(run_recurse COMMAND recurse DEPENDS recurse COMMENT "Running Fortran Program...")