program arrays
    use sorter;
    implicit none;

    ! Since the algos use an undefined size for the array as an in we allocate our array here
    integer, allocatable, dimension(:) :: mixed_arr;

    allocate(mixed_arr(6));

    mixed_arr = (/ 5, 8, 2, 3, 12, 6 /);


    print *, "Simple Array Example:"
    call simple_array;

    print *, "Before Merge:";
    call print_array(mixed_arr);

    call merge_sort(mixed_arr);

    print *, "Sorted:", mixed_arr;

    contains
        subroutine simple_array()
            integer, dimension(5) :: my_arr = (/ 10,20,30,40,50 /); !Note the / in the array notation

            integer :: i = 1;

            do while (i <= 5)
                print *, "Index: ", i, my_arr(i);
                i = i + 1;
            end do
        end

        subroutine print_array(arr)
            integer, dimension(:), intent(in) :: arr
            integer :: i = 1

            do while (i <= size(arr))
                print *, "Index: ", i, " Value: ", arr(i)
                i = i + 1  ! Increment index to avoid infinite loop
            end do

        end subroutine print_array


end program arrays