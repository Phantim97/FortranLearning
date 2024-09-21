module reducer
    implicit none

    type, abstract :: accumulator_t
    contains
        procedure(combiner), deferred, nopass :: combine
    end type accumulator_t

    abstract interface
        function combiner(x, y) result(z)
            integer, intent(in) :: x
            integer, intent(in) :: y
            integer :: z
        end function combiner
    end interface

contains
    function reduce(values, accumulator, init) result(combined)
        integer, intent(in) :: values(:)
        class(accumulator_t), intent(in) :: accumulator
        integer, intent(in) :: init
        integer :: combined
        integer :: i
        integer :: local_init

        local_init = init

        ! OpenMP parallelization
        !$omp parallel do default(shared) private(i) reduction(*:local_init)
        do i = 1, size(values)
            local_init = accumulator%combine(local_init, values(i))
        end do
        !$omp end parallel do

        combined = local_init
    end function reduce

end module reducer

module multiplier
    use reducer, only : accumulator_t
    implicit none

    type, extends(accumulator_t) :: multiplier_t
    contains
        procedure, nopass :: combine => multiply
    end type multiplier_t

contains
    function multiply(x, y) result(z)
        integer, intent(in) :: x
        integer, intent(in) :: y
        integer :: z

        z = x * y
    end function multiply
end module multiplier

program interfaces
    use multiplier, only : multiplier_t
    use reducer, only : reduce
    implicit none

    integer :: result

    result = reduce([1, 2, 3, 4], multiplier_t(), 1)
    print *, "Result:", result
end program interfaces
