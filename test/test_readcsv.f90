program test_readcsv
    use csv_data_define, only: csv_data
    use csv_data_io, only: read_csv
    implicit none

    type(csv_data) :: csv
    integer :: stat

    csv%rows = 5
    csv%columns = 3
    call csv%csv_data_create(csv%columns,csv%rows)

    stat = read_csv("data.csv", csv)

    if (stat /= 0) then
        print *, "Error reading CSV, status=", stat
    else
        print *, "CSV loaded successfully"
        print *, TRANSPOSE(csv%data)
    end if
end program test_readcsv
