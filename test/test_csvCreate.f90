program test_columns
    use csv_data_define, only: csv_data
    implicit none
    integer, parameter :: cols = 3
    integer, parameter :: rows = 5
    type(csv_data) :: testcsv 
    call testcsv%csv_data_create(cols,rows)
    !call testcsv%csv_data_destroy()
    return 
end program test_columns