! Created by Timothy Coelho on 9/16/24.

program main
    implicit none;

    integer, dimension(6) :: arr = (/ 1,2,3,4,5,6 /);
    integer, dimension(6) :: new_arr;

    new_arr = mul_by_3(arr);
    print *, "Array example: ", new_arr;

    print *, "Singular Example: ", mul_by_3(5);

    contains
        ! elemental does operations per element with scalar values on an array
        elemental function mul_by_3(number) result (res)
            integer, intent(in) :: number;
            integer :: res;

            res = number * 3;
        end function mul_by_3
end program main