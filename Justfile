set shell := ["bash", "-cu"]

default:
    @just --list

fmt:
    find src tools -type f \( -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) -print0 | xargs -0 clang-format -i

compile:
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -S . -B build

build:
    ninja -C build
