program derived
    ! basically #include or like ts, must come before implicit declaration
    use person_module; ! Access for the person class

    implicit none;

    type(Person) :: p;

    ! Member access is defined by %
    p%name = "Timothy";
    p%age = 27;
    p%height = 5.583;

    print *, p%get_name() // " is ", p%get_age(), " years old.";

    call p%modify_name("Tim"); ! Don't forget "call" to invoke the function

    print *, "Updated name: " // p%get_name();

end program derived