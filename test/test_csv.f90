program test_csv
    implicit none
    real, allocatable :: A(:,:)
    integer :: rows, cols

    rows = 5
    cols = 3

    A = read_csv_real("data.csv", rows, cols)

    print *, "Data read:"
    print *, A
end program test_csv

