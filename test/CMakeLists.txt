########################################
# Set up how to compile the source files
########################################

# Add the source files
SET(TEST_row ${SRCTEST}/test_columns.f90)
SET(TEST_col ${SRCTEST}/test_rows.f90)
SET(TEST_con ${SRCTEST}/test_csvCreate.f90)
SET(TEST_read ${SRCTEST}/test_readcsv.f90)

# Define the executable in terms of the source files
ADD_EXECUTABLE(${TESTROWEXE} ${TEST_row})
ADD_EXECUTABLE(${TESTCOLEXE} ${TEST_col})
ADD_EXECUTABLE(${TESTCONEXE} ${TEST_con})
ADD_EXECUTABLE(${TESTREADEXE} ${TEST_read})

#####################################################
# Add the needed libraries and special compiler flags
#####################################################

# This links TESTEXE to the CSVTOOLSLIB library
TARGET_LINK_LIBRARIES(${TESTROWEXE} ${CSVTOOLS})
TARGET_LINK_LIBRARIES(${TESTCOLEXE} ${CSVTOOLS})
TARGET_LINK_LIBRARIES(${TESTCONEXE} ${CSVTOOLS})
TARGET_LINK_LIBRARIES(${TESTREADEXE} ${CSVTOOLS})

ADD_TEST(NAME RowIOTest COMMAND ${TESTROWEXE})
ADD_TEST(NAME ColIOTest COMMAND ${TESTCOLEXE})
ADD_TEST(NAME ConstructorTest COMMAND ${TESTCONEXE})
ADD_TEST(NAME ReadTest COMMAND ${TESTREADEXE} WORKING_DIRECTORY ${SRCTEST})