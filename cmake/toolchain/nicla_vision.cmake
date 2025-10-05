####
# nicla_vision.cmake:
#
# Arduino Nicla Vision support.
#
# NOTE: This toolchain file is currently NON-FUNCTIONAL due to a limitation
# in the arduino-cli-cmake-wrapper (v0.2.0a1). Mbed-based Arduino boards
# (like Nicla Vision) use @file syntax for compiler flags, which causes the
# wrapper to fail when parsing compilation output at stage 3 (COMPILATION).
#
# Error: "MissingStageException: Failed to find any output for build stage: 3"
#
# This will require an update to arduino-cli-cmake-wrapper to properly handle
# Mbed board compilation patterns before this toolchain can be used.
####

cmake_minimum_required(VERSION 3.26)

set(CMAKE_CXX_STANDARD 17)
add_compile_options(-std=c++17 -std=gnu++17) # Force C++17 standard

set(CMAKE_SYSTEM_NAME "Generic")
set(CMAKE_SYSTEM_PROCESSOR "arm")
set(CMAKE_CROSSCOMPILING 1)

set(FPRIME_PLATFORM "ArduinoFw")
set(FPRIME_USE_BAREMETAL_SCHEDULER ON)

# Workaround for Mbed-based boards: Set build properties to handle @ file syntax
set(ARDUINO_BUILD_PROPERTIES "compiler.mbed.cxx.flags=none")

# Prevent test program compiling
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

# Fully Qualified Board Name for Nicla Vision (Arduino Mbed OS Nano)
set(ARDUINO_FQBN "arduino:mbed_nicla:nicla_vision")

add_compile_options(
    -D_BOARD_NICLA_VISION
    -DVARIANT_H=\"variant_NICLA_VISION.h\"
    # You can add more preprocessor definitions as needed
)

# Run the base Arduino setup
include("${CMAKE_CURRENT_LIST_DIR}/support/arduino-support.cmake")

