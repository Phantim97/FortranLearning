! Created by Timothy Coelho on 9/7/24.

module test_module
    use, intrinsic :: iso_c_binding, only: c_int, c_double; ! !include the C bindings necessary for this
    implicit none;

    contains
        subroutine add_numbers(a, b, result) bind(C, name="add_numbers")
            integer(c_int), intent(in) :: a, b;
            integer(c_int), intent(out) ::result;

            result = a + b;
        end subroutine add_numbers

        subroutine print_invoke(a) bind(C, name="print_invoke")
            integer(c_int) :: a;
            print *, "This is: ", a;
        end subroutine print_invoke

        subroutine print_array(arr, sz) bind(C, name="print_array")
            integer(c_int), intent(in) :: sz;
            real(c_double), intent(in) :: arr(sz); ! Initialize with the size afterwards

            integer :: i = 1;

            do while (i <= sz)
                print *, "Index: ", i, " Value: ", arr(i);
                i = i + 1;
            end do
        end subroutine print_array
end module test_module