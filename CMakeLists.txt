cmake_minimum_required(VERSION 3.28)

# Project name and version
project(nvFlexDop LANGUAGES CXX CUDA)

# Locate Houdini's libraries and header files.
# Registers an imported library target named 'Houdini'.
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

# Configure several common target properties, such as its output directory.
#houdini_configure_target( ${PROJECT_NAME} )

# Set the output directory for the built library
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_CURRENT_SOURCE_DIR}/x64/Release_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}/
    #LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/x64/Release_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}
    #ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/x64/Release_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}
)

# Optionally, if you have a specific version for Houdini that needs to be part of the output name:
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_NAME "nvFlexDop_${Houdini_VERSION_MAJOR}${Houdini_VERSION_MINOR}"
)