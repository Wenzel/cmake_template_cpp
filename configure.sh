#!/bin/sh

# absolute path to current dir
cur_dir=`dirname \`readlink -f $0\``

# remove old build
rm -rf "$cur_dir/_build"

# create build dir
mkdir -p "$cur_dir/_build"

# compilers
compilers=(g++ clang++)

dialog --backtitle "Compiler selection" \
    --radiolist "Choose your compiler" 0 0 10 \
    1 "${compilers[0]}" on\
    2 "${compilers[1]}" off\
    2> /tmp/$$_dialog.ans

answer=$(cat /tmp/$$_dialog.ans)
if [ "$answer" -eq 0 ]; then
    echo "Cancelled by user"
    exit 1
fi

export CXX="/usr/bin/${compilers[$(($answer - 1 ))]}"

# cmake
cd "$cur_dir/_build" && cmake .. $*
