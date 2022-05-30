message(STATUS "Using arm64 toolchain")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "")

set(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "aarch64-linux-gnu-g++")

# Affects pkg-config
set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS TRUE)
# Used by pkg-config on Debian
set(CMAKE_LIBRARY_ARCHITECTURE aarch64-linux-gnu)
# Silly hack required to get the pkg-config path code to activate
list(APPEND CMAKE_PREFIX_PATH /usr)

# Find where 32-bit CMake modules are stored
find_path(DIR NAMES cmake PATHS /usr/lib32 /usr/lib/aarch64-linux-gnu NO_DEFAULT_PATH)

if(DIR)
    message(STATUS "Using arm64 libraries from ${DIR}")
    # Read CMake modules from 32-bit packages
    # set(CMAKE_FIND_ROOT_PATH ${DIR})
    # set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    # set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    # set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)
endif()