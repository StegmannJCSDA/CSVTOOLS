# bar library
SET(CSVTOOLS_src ${SRCCSVTOOLS}/csv_data_define.f90
                 ${SRCCSVTOOLS}/csv_data_io.f90
                 )
ADD_LIBRARY(${CSVTOOLS} STATIC ${CSVTOOLS_src})
# Add dependencies
#TARGET_LINK_LIBRARIES(${CSVTOOLSLIB} netCDF::netcdf HDF5::HDF5)
