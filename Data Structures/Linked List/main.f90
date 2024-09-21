module LinkedList
    implicit none;

    type :: Node
        integer :: data;
        type(Node), pointer :: next => null();
    end type Node

contains

    subroutine insert(head, value)
        type(Node), pointer :: head;
        integer :: value;
        type(Node), pointer :: temp, new_node;

        allocate(new_node);
        new_node%data = value;
        new_node%next => null();

        if (associated(head)) then
            temp => head;
            do while (associated(temp%next))
                temp => temp%next;
            end do
            temp%next => new_node;
        else
            head => new_node;
        end if
    end subroutine insert

    subroutine print_list(head)
        type(Node), pointer :: head;
        type(Node), pointer :: temp;

        temp => head;
        do while (associated(temp))
            print *, temp%data;
            temp => temp%next;
        end do
    end subroutine print_list

end module LinkedList

program main
    use LinkedList;
    implicit none;

    type(Node), pointer :: head => null();

    call insert(head, 10);
    call insert(head, 20);
    call insert(head, 30);

    call print_list(head);
end program main
