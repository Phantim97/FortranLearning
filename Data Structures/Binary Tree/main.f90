module BinaryTree
    implicit none;

    type :: TreeNode
        integer :: data;
        type(TreeNode), pointer :: left => null();
        type(TreeNode), pointer :: right => null();
    end type TreeNode

contains

    recursive subroutine insert(root, value)
        type(TreeNode), pointer :: root;
        integer :: value;
        type(TreeNode), pointer :: newNode;

        if (.not. associated(root)) then
            allocate(root);
            root%data = value;
            root%left => null();
            root%right => null();
        else if (value < root%data) then
            call insert(root%left, value);
        else
            call insert(root%right, value);
        end if
    end subroutine insert

    recursive subroutine inorder_traversal(root)
        type(TreeNode), pointer :: root;

        if (associated(root)) then
            call inorder_traversal(root%left);
            print *, root%data;
            call inorder_traversal(root%right);
        end if
    end subroutine inorder_traversal

end module BinaryTree

program main
    use BinaryTree;
    implicit none;

    type(TreeNode), pointer :: root => null();

    call insert(root, 50);
    call insert(root, 30);
    call insert(root, 70);
    call insert(root, 20);
    call insert(root, 40);
    call insert(root, 60);
    call insert(root, 80);

    print *, "Inorder Traversal:";
    call inorder_traversal(root);
end program main
