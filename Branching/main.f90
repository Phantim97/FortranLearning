program branching
    implicit none;

    integer :: x = 5;

    select case (x)
        case (5)
            print *, "5"
        case default
            print *, "Other"
    end select
end program branching