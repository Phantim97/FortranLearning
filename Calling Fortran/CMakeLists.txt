cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES CXX Fortran)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_STANDARD_REQUIRED True)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

add_executable(extern_fortran main.cpp test_module.f90)