program fileio
    implicit none;

    ! Semicolons are optional but can be nice for readability

    ! Base Person characteristics
    character(len=20) :: name = "";
    integer :: age = 0;
    character(len=20) :: state = "";

    integer :: unit = 0; ! for file IO

    ! Add data to file
    call write_to_file;

    ! Pull data
    call read_from_file(name, age, state);

    ! Print data
    call print_data(name, age, state);

    ! Think of contains like a private part of a program that can't be used by other modules
    ! Subroutine is equivalent to void
    contains
        subroutine read_from_file(name_, age_, state_)
            ! We have to declare the intent of the Parameters
            character(len=20) , intent(out) :: name_, state_;
            integer, intent(out) :: age_;
            integer :: fstatus = 0;

            ! Unit for File IO
            integer :: unit = 0;

            open(newunit=unit, file="file.txt", status="OLD");

            read(unit, *, iostat=fstatus) name_, age_, state_;

            if (fstatus .NE. 0) then ! .NE. being !=,
                print *, "Error reading file";
            end if

            close(unit);
        end subroutine read_from_file

        subroutine write_to_file()
            integer :: unit = 0;

            open(newunit=unit, file="file.txt", status="REPLACE");

            write(unit, *) "Tim," // " 27," // " NY" ! the // here is just for concat muscle memory

            close(unit)
        end subroutine write_to_file

        subroutine print_data(name_, age_, state_)
            character(len=20), intent(in) :: name_, state_;
            integer, intent(in) :: age_;
            print *, "Name: " // name_ // " Age: ", age_, " State: " // state_;
        end subroutine print_data
end program fileio