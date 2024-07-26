cd ./build
set HOUDINI_PATH=C:\Program Files\Side Effects Software\Houdini 20.5.278\toolkit\cmake
set NVFLEX_DIR=F:\ENVIRONMENTS\FLEX_LIB\flex_1.1

cmake -DCMAKE_PREFIX_PATH="%HOUDINI_PATH%" -DNVFLEX_DIR="%NVFLEX_DIR%" -G "Visual Studio 16 2019" -A x64 ..
cmake --build . --config Release
cd ..