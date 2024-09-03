! Created by Timothy Coelho on 9/3/24.

module person_module
    implicit none;

    type :: Person
        character(len=20) :: name
        integer :: age
        real :: height

        ! Forward declare our procedures
        contains
            procedure :: get_age;
            procedure :: get_name;
            procedure :: increment_age;
            procedure :: modify_name;
    end type Person

    contains ! Necessary here to isolate these functions
        function get_name(this) result(name)
            class (Person), intent(inout) :: this; ! Notice how we create out own this ptr
            character(len=20) :: name;
            name = this%name;
        end function get_name

        function get_age(this) result(age)
            class(Person), intent(inout) :: this;
            integer :: age;
            age = this%age;
        end function get_age

        subroutine increment_age(this, years)
            class(Person), intent(inout) :: this;
            integer, intent(in) :: years;
            this%age = this%age + years;
        end subroutine increment_age

        subroutine modify_name(this, new_name)
            class (Person), intent(inout) :: this;
            character(len=*), intent(in) :: new_name;  ! gives a wildcard length so there's no garbage in arr
            this%name = new_name;
        end subroutine modify_name

end module person_module