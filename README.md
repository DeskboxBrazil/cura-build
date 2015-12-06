# cura-build

This repository contains build scripts used to build Cura and all dependencies from scratch.

**You'll probably want to build a specific release. There is a branch for every release, and the master branch is behind them. The current release for Deskbox is the [15.06](https://github.com/DeskboxBrazil/cura-build/tree/15.06) branch. So, it is recommended to work on it.**

## OS X

1. Install CMake (available via [homebrew](http://brew.sh/) or [cmake.org](http://www.cmake.org/))
2. Install latest version of Xcode.
3. Run these commands:
```shell
git clone git@github.com:Ultimaker/cura-build.git
cd cura-build
mkdir build
cd build
cmake ..
make
```

If you get an error on `Protobuf` compilation, add this to `build/Protobuf-prefix/src/Protobuf/CMakeLists.txt`:
```cmake
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "${CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS} -undefined dynamic_lookup")
endif()
```

If you get an error on `unittest_proto3_arena.proto`, replace `build/Protobuf-prefix/src/Protobuf/src/google/protobuf/unittest_proto3_arena.proto` and `build/Protobuf-python-prefix/src/Protobuf-python/src/google/protobuf/unittest_proto3_arena.proto` with [this one](https://raw.githubusercontent.com/google/protobuf/master/src/google/protobuf/unittest_proto3_arena.proto).


## Ubuntu

See [ubuntu-15.04-build-script.sh](ubuntu-15.04-build-script.sh) for building under Ubuntu 15.04.
