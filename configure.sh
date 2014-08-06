#!/bin/sh

# absolute path to current dir
cur_dir=`dirname \`readlink -f $0\``

if [ "$1" = "-r" ]; then
    # remove previous build
    rm -rf "$cur_dir/_build"
    shift
fi

# create build dir
mkdir -p "$cur_dir/_build"

# cmake
cd "$cur_dir/_build" && cmake .. $*
