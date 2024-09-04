! Created by Timothy Coelho on 9/3/24.

module sorter
    implicit none;

    private; ! All functions are private
    public :: merge_sort; ! Merge sort is made public, alternative to impossible nested contains

contains
    subroutine merge_sort(arr)
        integer, allocatable, dimension(:), intent(inout) :: arr;
        integer :: middle = 0;
        integer, allocatable, dimension(:) :: left_half;
        integer, allocatable, dimension(:) :: right_half;
        integer :: len = 0;

        len = size(arr);

        if (len > 1) then
            middle = len / 2;

            allocate(left_half(middle))! Think malloc but only taking size
            allocate(right_half(len - middle)); ! Remainder of the array

            left_half = arr(1:middle);
            right_half = arr(middle + 1:len); ! Exclusive tail slice

            arr = merge(left_half, right_half);
        else
            print *, "Array too small"
        end if
    end subroutine merge_sort

    ! We cannot have contains in a contains so we make the function external function
    function merge(left, right) result(merged_array)
        ! Declared Arrays
        integer, allocatable, dimension(:), intent(in) :: left
        integer, allocatable, dimension(:), intent(in) :: right
        integer, allocatable, dimension(:) :: merged_array

        ! Subarray Utilities
        integer :: left_size, right_size, merged_size
        integer :: i, j, k

        ! Set array sizes
        left_size = size(left)
        right_size = size(right)
        merged_size = left_size + right_size

        ! Allocate the merged array
        allocate(merged_array(merged_size))

        ! Initialize iterators
        i = 1
        j = 1
        k = 1

        ! Merge left and right arrays
        do while (i <= left_size .and. j <= right_size)
            if (left(i) <= right(j)) then
                merged_array(k) = left(i)
                i = i + 1
            else
                merged_array(k) = right(j)
                j = j + 1
            end if
            k = k + 1
        end do

        ! Append all remaining left elements
        do while (i <= left_size)
            merged_array(k) = left(i)
            i = i + 1
            k = k + 1
        end do

        ! Append all remaining right elements
        do while (j <= right_size)
            merged_array(k) = right(j)
            j = j + 1
            k = k + 1
        end do

        ! Verify final merged array size
        if (k - 1 /= merged_size) then
            print *, "Error: Merged array size mismatch!"
        endif

        print *, "Merged Array: ", merged_array

    end function merge


end module sorter