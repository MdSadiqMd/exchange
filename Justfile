set shell := ["bash", "-cu"]

default:
    @just --list

compile:
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -S . -B build

build:
    ninja -C build

format:
    clang-format -i src/*.cpp tools/*.cpp