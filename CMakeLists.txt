cmake_minimum_required(VERSION 3.28)

# Project name and languages ( this makes cuda avaliable )
project(nvFlexDop LANGUAGES CXX CUDA)

# Locate Houdini's libraries and header files.
find_package( Houdini REQUIRED )

# Define the sources
file(GLOB SOURCES "nvFlexDop/*.cpp")

# Include directories
include_directories(${NVFLEX_DIR}/include)

# Library directories
link_directories(${NVFLEX_DIR}/lib/win64)

# Define the executable
add_library(${PROJECT_NAME} SHARED ${SOURCES})

# Link the libraries
target_link_libraries(${PROJECT_NAME}
    NvFlexReleaseCUDA_x64.lib
    NvFlexDeviceRelease_x64.lib
    NvFlexExtReleaseCUDA_x64.lib
    cuda
    cudart_static
    Houdini 
)

# Set the output directory for the built library
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_CURRENT_SOURCE_DIR}/package/NvFlexDop/dso/Release_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}/
)

# Set Houdini version to be part of the output name:
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_NAME "nvFlexDop_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}"
)

# Configure several common target properties, such as its output directory.
#houdini_configure_target( ${PROJECT_NAME} )