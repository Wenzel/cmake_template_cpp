# to add an include path
# include_directories()

# create your executable with
add_executable(my_executable main.cc)

# create a library with
# add_library(my_lib SHARED ${SOURCES})

# you can link both with
# target_link_libraries(my_executable my_lib)


#-----------------------------------------------------------------------------
#                           	PACKAGING
#-----------------------------------------------------------------------------
# package your installation with the install command
# see cmake documentation for further explanation
# edit cmake/modules/packaging to setup package name, dependencies ...

# install(
# 	FILES <file1> <file2> ...
# 	DESTINATION <dir>
# 	PERMISSIONS OWNER_READ OWNER_WRITE ...
# )
# OR
# install(PROGRAMS myexecutable DESTINATION <dir>)
