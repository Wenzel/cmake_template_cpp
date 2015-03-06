#!/bin/bash


#------------------------------------------------------------------------------
#                               QUALITY
#------------------------------------------------------------------------------
set -o errexit
set -o pipefail
# set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file_path="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__file="$(basename $__file_path)"

#------------------------------------------------------------------------------
#                               USAGE
#------------------------------------------------------------------------------
usage ()
{
    echo "./$__file [-h] [-c] [-p] [-b]"
    echo
    echo "  -h      Display help"
    echo "  -c      Change compiler (g++)"
    echo "  -p      Change install prefix (/usr/local)"
    echo "  -b      Change build type (DEBUG)"
    exit 1
}
#------------------------------------------------------------------------------
#                               SCRIPT LOGIC
#------------------------------------------------------------------------------

# create build dir
mkdir -p "$__dir/_build"

# parsing option
OPTIND=1
compilers=(g++ clang++)
build_types=(Debug Release)

# default values
compiler_answer=1 
prefix_answer="/usr/local"
build_type_answer=1
# getopt loop
while getopts ":hcpb" opt ; do
    case $opt in
        "c")
            dialog --backtitle "Compiler configuration" \
                --radiolist "Choose your compiler" 0 0 10 \
                1 "${compilers[0]}" on \
                2 "${compilers[1]}" off \
                2>/tmp/$$_dialog.ans

            compiler_answer=$(cat /tmp/$$_dialog.ans && rm -f /tmp/$$_dialog.ans)
            if [ "$compiler_answer" -eq 0 ]; then
                echo "Project Configuration Cancelled."
                exit 1
            else
                # better to remove the build dir and recreate it
                # when changing the compiler
                rm -rf "$__dir/_build"
                mkdir -p "$__dir/_build"
            fi
            ;;
        "p")
            dialog --backtitle "Installation prefix configuration" \
                --inputbox "Set the install prefix" 0 0 \
                "/usr/local"
                2>/tmp/$$_dialog.ans

            prefix_answer=$(cat /tmp/$$_dialog.ans && rm -f /tmp/$$_dialog.ans)
            if [ "$prefix_answer" -eq 0 ]; then
                echo "Project Configuration Cancelled."
                exit 1
            fi
            ;;
        "b")
            dialog --backtitle "Build type configuration" \
                --radiolist "Set the build type" 0 0 10 \
                1 "${build_types[0]}" on \
                2 "${build_types[1]}" off \
                2>/tmp/$$_dialog.ans

            build_type_answer=$(cat /tmp/$$_dialog.ans && rm -f /tmp/$$_dialog.ans)
            if [ "$build_type_answer" -eq 0 ]; then
                echo "Project Configuration Cancelled."
                exit 1
            fi
            ;;
        "h")
            usage
            ;;
    esac
done

# CMAKE
#################
cd "$__dir/_build" && \
    cmake .. \
    -DCMAKE_CXX_COMPILER="/usr/bin/${compilers[$(($compiler_answer - 1 ))]}" \
    -DCMAKE_BUILD_TYPE="`echo ${build_types[$(( $build_type_answer - 1 ))]} | tr '[a-z]' '[A-Z]'`" \
    -DCMAKE_INSTALL_PREFIX="$prefix_answer"
