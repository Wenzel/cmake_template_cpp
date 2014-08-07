CMake C++ Project Template
==============

A simple C++ project template based on CMake to help you to stay focused
on the code !

Setup
=====

clone the repo

    git clone https://github.com/Mathux/cmake_template_cpp my_cpp_project

add your sources in `src/`

Edit `src/CMakeLists.txt` to create your executable / library

Edit `CMakeLists.txt` to setup your project dependencies (Qt, Boost, ...)

Usage
=====

use `./configure.sh` to setup a default configuration for your project, then run `make`

run `./configure.sh -c` to setup the compiler (`g++` | `clang++`)

run `./configure.sh -p` to setup the install prefix 

run `./configure.sh -b` to setup the build type (`Debug` | `Release`)

Default Targets Available
=====

doc
-----

if you have installed `doxygen`, you can use `make doc` to generate the
source code documentation (call graphs, UML, etc).

The open `_build/doc/html/index.html` with your favorite browser

static\_analysis
---------------

if you have installed `clang`, you can use `make static_analysis` to
scan your source code for programming errors with ccc-analyzer.
