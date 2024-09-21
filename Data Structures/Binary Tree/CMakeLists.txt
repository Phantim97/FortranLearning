cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES Fortran)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

add_executable(binary_tree main.f90)

add_custom_target(run_binary_tree COMMAND binary_tree DEPENDS binary_tree COMMENT "Running Fortran Program...")