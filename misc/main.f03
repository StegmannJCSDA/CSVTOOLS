program test_csv
    implicit none
    real, allocatable :: A(:,:)
    integer :: rows, cols

    rows = 5
    cols = 3

    A = read_csv_real("data.csv", rows, cols)

    print *, "Data read:"
    print *, A

    deallocate(A)

    contains

function read_csv_real(filename, nrows, ncols) result(data)
    implicit none
    character(len=*), intent(in) :: filename
    integer, intent(in) :: nrows, ncols
    real, allocatable :: data(:,:)

    integer :: unit, ios, i, j
    character(len=4096) :: line
    character(len=64)   :: field
    integer :: p1, p2, col

    ! Allocate output array
    allocate(data(nrows, ncols))
    data = 0.0

    ! Choose a free unit number
    inquire(file=filename, number=unit)
    if (unit == 0) unit = 21

    ! Open file
    open(unit=unit, file=filename, status='old', action='read', iostat=ios)
    if (ios /= 0) stop "Error: cannot open file."

    ! Read row-by-row
    do i = 1, nrows
        read(unit, '(A)', iostat=ios) line
        if (ios /= 0) stop "Error: unexpected end of file."

        p1 = 1
        do j = 1, ncols
            ! Find next comma (or end of string)
            p2 = index(line(p1:), ',')
            if (p2 == 0) then
                field = adjustl(trim(line(p1:)))
            else
                field = adjustl(trim(line(p1:p1+p2-2)))
            end if

            read(field, *, iostat=ios) data(i,j)
            if (ios /= 0) stop "Error converting field to real."

            ! Advance pointer to next field
            if (p2 == 0) then
                p1 = len_trim(line) + 1
            else
                p1 = p1 + p2
            end if
        end do
    end do

    close(unit)
end function read_csv_real

end program test_csv

