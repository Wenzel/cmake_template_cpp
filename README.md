CMake C++ Project Template
==============

A simple C++ project template based on CMake to help you to stay focused
on the code !

Features
--------

- easy change your project settings, like switch **compiler**, **build type**,
or **install prefix** with a dialog based interface.
- `ccache` enabled by default for every target in the project
- generate the documentation and understand the relationship between the classes of your projects,
thanks to `doxygen` call graph generation and UML representation
- improve the quality of your source code with `ccc-analyzer` static analysis
- compiler sanitizer integration with `address`, `thread`, `memory` and `undefined` !


Requirements
------------

- `ccache` is now included by default !
- `doxygen` and `dot` will be needed if you want to generate the documentation
- `ccc-analyzer` is required to run a static analysis of your source code

Setup
-----

clone the repo

    git clone https://github.com/Mathux/cmake_template_cpp my_cpp_project

add your sources in `src/`

Edit `src/CMakeLists.txt` to create your executable / library

Edit `CMakeLists.txt` to setup your project dependencies (Qt, Boost, ...)

Usage
-----

use `./configure.sh` to setup a default configuration for your project, then run `make`

run `./configure.sh -c` to change the compiler (`g++` | `clang++`)

run `./configure.sh -p` to change the install prefix (`/usr/local`)

run `./configure.sh -b` to change the build type (`Debug` | `Release`)

run `./configure.sh -s` to change the sanitizer (none `address` | `thread` | `memory` | `undefined`)

Default Targets Available
-------------------------

### doc

If you have `doxygen` installed, you can use `make doc` to generate the
source code documentation, like caller and callee graphs or UML diagrams.
(you can install `dot` to generate nicer graphs)

Then open `_build/doc/html/index.html` with your favorite browser

### static\_analysis

if you have installed `clang`, you can use `make static_analysis` to
scan your source code for programming errors with `ccc-analyzer` (if installed !).
