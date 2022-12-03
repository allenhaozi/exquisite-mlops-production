mkdir build
cd build

ROBOCOPY %RECIPE_DIR%\libsolv %VCPKG_ROOT%\ports\libsolv

@rem Looks like the .vcpkg-root file is missing in vcpkg package
TYPE NUL > %VCPKG_ROOT%\.vcpkg-root

SET VCPKG_BUILD_TYPE=release
vcpkg install libsolv[conda] --triplet x64-windows-static
vcpkg install "libarchive[bzip2,lz4,lzma,lzo,openssl,zstd]" --triplet x64-windows-static
vcpkg install curl --triplet x64-windows-static
vcpkg install yaml-cpp --triplet x64-windows-static
vcpkg install reproc --triplet x64-windows-static

SET "CXXFLAGS=%CXXFLAGS% /showIncludes"
set CMAKE_PREFIX_PATH=%VCPKG_ROOT%\installed\x64-windows-static\;%CMAKE_PREFIX_PATH%

cmake .. ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH="%VCPKG_ROOT%\installed\x64-windows-static\;%CMAKE_PREFIX_PATH%" ^
    -D CMAKE_BUILD_TYPE="Release" ^
    -D BUILD_LIBMAMBA=ON ^
    -D BUILD_STATIC_DEPS=ON ^
    -D BUILD_MICROMAMBA=ON ^
    -D MICROMAMBA_LINKAGE=FULL_STATIC ^
    -G "Ninja"

ninja install --verbose
