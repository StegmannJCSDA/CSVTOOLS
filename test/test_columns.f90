program test_columns
    use csv_data_io, only: count_csv_columns
    implicit none
    integer :: cols

    cols = count_csv_columns("data.csv")
    print *, "Number of columns:", cols
end program test_columns

