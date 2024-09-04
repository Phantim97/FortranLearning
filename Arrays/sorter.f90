! Created by Timothy Coelho on 9/3/24.

module sorter
    implicit none;

    private; ! All functions are private
    public :: merge_sort; ! Merge sort is made public, alternative to impossible nested contains

contains
    recursive subroutine merge_sort(arr)
        integer, allocatable, dimension(:), intent(inout) :: arr;
        integer :: middle = 0;
        integer, allocatable, dimension(:) :: left_half;
        integer, allocatable, dimension(:) :: right_half;
        integer :: len = 0;

        len = size(arr);

        if (len > 1) then
            middle = len / 2;

            allocate(left_half(middle));
            allocate(right_half(len - middle));

            left_half = arr(1:middle);
            right_half = arr(middle + 1:len);

            call merge_sort(left_half);
            call merge_sort(right_half);

            arr = merge(left_half, right_half);

            ! Deallocate arrays
            deallocate(left_half);
            deallocate(right_half);
        end if
    end subroutine merge_sort

    function merge(left, right) result(merged_array)
        integer, allocatable, dimension(:), intent(in) :: left;
        integer, allocatable, dimension(:), intent(in) :: right;
        integer, allocatable, dimension(:) :: merged_array;

        ! An unfortunate artifact of Fortan and the initialization phase is that this is the way to do it else fails,
        integer :: left_size, right_size, merged_size;
        integer :: i, j, k; ! Initialization phase is probably the problem, should be just these declarations.

        left_size = size(left);
        right_size = size(right);
        merged_size = left_size + right_size;

        allocate(merged_array(merged_size));

        ! As tempting as it is to do all inline initialization before the alloc the compiler apparently needs this here.
        i = 1;
        j = 1;
        k = 1;

        do while (i <= left_size .and. j <= right_size)
            if (left(i) <= right(j)) then
                merged_array(k) = left(i);
                i = i + 1;
            else
                merged_array(k) = right(j);
                j = j + 1;
            end if
            k = k + 1;
        end do

        do while (i <= left_size)
            merged_array(k) = left(i);
            i = i + 1;
            k = k + 1;
        end do

        do while (j <= right_size)
            merged_array(k) = right(j);
            j = j + 1;
            k = k + 1;
        end do
    end function merge
end module sorter