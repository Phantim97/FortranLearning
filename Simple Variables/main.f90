program vars
    implicit none
    integer, parameter :: x = 5
    integer :: y = 0
    integer :: status = 0

    ! Loop to validate input
    do
        print *, "Get a number to add to 5"
        read(*, *, iostat=status) y
        if (status == 0) then
            exit
        else
            print *, "Error, invalid number"
        end if
    end do

    print *, "Result " // "is: ", x + y ! // For concatenate, ',' for diff types

end program vars