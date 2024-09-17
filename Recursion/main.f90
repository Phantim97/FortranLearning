! Created by Timothy Coelho on 9/16/24.

program main
    implicit none;

    print *, fibonacci(12);

    contains
        recursive function fibonacci(number) result(fib)
            integer, intent(in) :: number;
            integer :: fib;

            if (number <= 2) then
                fib = 1;
            else
                fib = fibonacci(number-1) + fibonacci(number-2);
            end if
        end function fibonacci
end program main