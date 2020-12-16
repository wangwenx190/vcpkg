# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/parameter_python
    REF boost-1.74.0
    SHA512 a8661adbb4f89e41e1676574e15582135a5fdae3be303cee93c2ce55cc01a6fe18a8b5040c4328cae69e188195f94e0821e47f59a0ca0b3641b2cd58563ef5eb
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
