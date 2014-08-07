#!/bin/sh

# absolute path to current dir
cur_dir=`dirname \`readlink -f $0\``

# create build dir
mkdir -p "$cur_dir/_build"

# COMPILERS
##################
compilers=(g++ clang++)
dialog --backtitle "Compiler selection" \
    --radiolist "Choose your compiler" 0 0 10 \
    1 "${compilers[0]}" on \
    2 "${compilers[1]}" off \
    2> /tmp/$$_dialog.ans

compiler_answer=$(cat /tmp/$$_dialog.ans && rm -f /tmp/$$_dialog.ans)
if [ "$compiler_answer" = "" ] || [ "$compiler_answer" -eq 0 ]; then
    echo "Project Configuration Cancelled."
    exit 1
fi

# CMAKE
#################
cd "$cur_dir/_build" && \
    cmake .. \
    -DCMAKE_CXX_COMPILER="/usr/bin/${compilers[$(($compiler_answer - 1 ))]}" \
    $* # rest
