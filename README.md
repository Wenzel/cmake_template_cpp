CMake C++ Project Template
==============

A simple C++ project template based on CMake to help you to stay focused
on the code!

Setup
=====

clone the repo

    git clone https://github.com/Mathux/cmake_template_cpp my_cpp_project

add your sources in `src/`

Edit `src/CMakeLists.txt` to create your executable/lib

Edit `CMakeLists.txt` to setup your project dependencies (Qt, Boost, ...)

Usage
=====

use `./configure.sh` to configure your project, then run `make`

run `./configure.sh -c` to setup the compiler (`g++` | `clang++`)

run `./configure.sh -p` to setup the install prefix 

run `./configure.sh -b` to setup the build type (`Release` | `Debug`)
