cmake_minimum_required(VERSION 3.29)
project(FortranLearning LANGUAGES Fortran)

set(CMAKE_Fortran_STANDARD 90)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

find_package(OpenMP REQUIRED)

add_executable(parallel_reduction main.f90)

target_link_libraries(parallel_reduction PUBLIC OpenMP::OpenMP_Fortran)

add_custom_target(run_mp COMMAND parallel_reduction DEPENDS parallel_reduction COMMENT "Running Fortran Program...")