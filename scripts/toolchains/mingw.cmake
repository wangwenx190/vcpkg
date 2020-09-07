if(NOT _VCPKG_MINGW_TOOLCHAIN)
set(_VCPKG_MINGW_TOOLCHAIN 1)
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    set(CMAKE_CROSSCOMPILING OFF CACHE BOOL "")
endif()

# Need to override MinGW from VCPKG_CMAKE_SYSTEM_NAME
set(CMAKE_SYSTEM_NAME Windows CACHE STRING "" FORCE)

if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
   set(CMAKE_SYSTEM_PROCESSOR i686 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
   set(CMAKE_SYSTEM_PROCESSOR x86_64 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
   set(CMAKE_SYSTEM_PROCESSOR armv7 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
   set(CMAKE_SYSTEM_PROCESSOR aarch64 CACHE STRING "")
endif()

foreach(lang C CXX)
  set(CMAKE_${lang}_COMPILER_TARGET "${CMAKE_SYSTEM_PROCESSOR}-windows-gnu" CACHE STRING "")
endforeach()

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(NOT _CMAKE_IN_TRY_COMPILE)
    string(APPEND CMAKE_C_FLAGS_INIT " ${VCPKG_C_FLAGS} ")
    string(APPEND CMAKE_CXX_FLAGS_INIT " ${VCPKG_CXX_FLAGS} ")
    string(APPEND CMAKE_C_FLAGS_DEBUG_INIT " ${VCPKG_C_FLAGS_DEBUG} ")
    string(APPEND CMAKE_CXX_FLAGS_DEBUG_INIT " ${VCPKG_CXX_FLAGS_DEBUG} ")
    string(APPEND CMAKE_C_FLAGS_RELEASE_INIT " ${VCPKG_C_FLAGS_RELEASE} ")
    string(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT " ${VCPKG_CXX_FLAGS_RELEASE} ")

    string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${VCPKG_LINKER_FLAGS} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${VCPKG_LINKER_FLAGS} ")
    if(VCPKG_CRT_LINKAGE STREQUAL "static")
        string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT "-static ")
        string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT "-static ")
    endif()
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT " ${VCPKG_LINKER_FLAGS_RELEASE} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT " ${VCPKG_LINKER_FLAGS_RELEASE} ")
endif()
endif()
