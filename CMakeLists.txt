cmake_minimum_required(VERSION 3.24)

project(exchange LANGUAGES CXX)

include(FetchContent)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Header-only interface target that all binaries share
add_library(exchange_project INTERFACE)

target_include_directories(
    exchange_project
    INTERFACE
        "${CMAKE_CURRENT_SOURCE_DIR}/src"
)

target_compile_features(exchange_project INTERFACE cxx_std_20)

target_compile_options(
    exchange_project
    INTERFACE
        -Wall
        -Wextra
        -Wpedantic
        -fno-exceptions
)


# Main matching-engine binary
add_executable(
    exchange
    src/main.cpp
)

target_link_libraries(
    exchange
    PRIVATE
        exchange_project
)

set_target_properties(
    exchange
    PROPERTIES
        OUTPUT_NAME "exchange"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/src"
)
