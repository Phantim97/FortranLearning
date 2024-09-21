module reducer
    implicit none;

    type, abstract :: accumulator_t
        contains
        procedure(combiner), deferred, nopass ::combine
    end type accumulator_t

    abstract interface
        pure function combiner(x, y) result(z)
            integer, intent(in) :: x;
            integer, intent(in) :: y;
            integer :: z;
        end function combiner
    end interface
    contains
        pure recursive function reduce(values, accumulator, init) result(combined)
            integer, intent(in) :: values(:);
            class(accumulator_t), intent(in) :: accumulator;
            integer, intent(in) :: init;
            integer :: combined;

            if (size(values) == 1) then
                combined = accumulator%combine(init, values(1));
            else
                combined = reduce(values(2:), accumulator, accumulator%combine(init, values(1)));
            end if
        end function reduce
end module reducer

module multiplier
    use reducer, only : accumulator_t;
    implicit none;

    type, extends(accumulator_t) :: multiplier_t
        contains
            procedure, nopass :: combine => multiply;
    end type multiplier_t

    contains
    pure function multiply(x, y) result(z)
        integer, intent(in) :: x;
        integer, intent(in) :: y;
        integer :: z;

        z = x * y;
    end function multiply
end module multiplier

program interfaces
    use multiplier, only : multiplier_t;
    use reducer, only : reduce;

    print *, reduce([1,2,3,4], multiplier_t(), 1);
end program interfaces