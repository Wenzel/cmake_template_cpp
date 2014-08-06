#-----------------------------------------------------------------------------
#                               STATIC ANALYSIS
#-----------------------------------------------------------------------------
# ccc-analyzer ? (Clang)

if (CMAKE_BUILD_TYPE STREQUAL "ANALYSIS")
    message("HERE")
    # set C and CXX compiler
    set(CMAKE_C_COMPILER "ccc-analyzer")
    set(CMAKE_CXX_COMPILER "c++-analyzer")
endif()
