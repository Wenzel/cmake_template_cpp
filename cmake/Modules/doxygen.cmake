#-----------------------------------------------------------------------------
#                               DOXYGEN ?
#-----------------------------------------------------------------------------
find_package(Doxygen)
if(DOXYGEN_FOUND)
    configure_file(
        "${CMAKE_SOURCE_DIR}/doc/Doxyfile.in.cmake"
        "${CMAKE_SOURCE_DIR}/doc/Doxyfile"
        @ONLY
    )
    add_custom_target(
        doc         # NAME
        COMMAND doxygen ${CMAKE_SOURCE_DIR}/doc/Doxyfile
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT Doxygen is generating the documentation...
        VERBATIM
    )
else(DOXYGEN_FOUND)
    message(WARNING "Doxygen not found. Target doc will not be available")
endif(DOXYGEN_FOUND)

