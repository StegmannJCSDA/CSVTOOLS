program test_rows
    use csv_data_io, only: count_csv_rows
    implicit none
    integer :: rows

    rows = count_csv_rows("data.csv")
    print *, "Number of rows:", rows
end program test_rows

