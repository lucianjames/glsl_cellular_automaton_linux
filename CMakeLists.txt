include(FetchContent)
cmake_minimum_required(VERSION 3.8)

project(glsl_cellular_automaton_linux)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")

set(BUILD_SHARED_LIBS OFF)
FetchContent_Declare(
        imgui-glfw-glad-glm
        GIT_REPOSITORY https://github.com/LJ3D/imgui-glfw-glad-glm
)
FetchContent_MakeAvailable(imgui-glfw-glad-glm)

# Add all the .cpp files in ./headers/
file(GLOB_RECURSE HEADERS "headers/*.cpp")

add_executable(cellularAutomaton main.cpp ${HEADERS})

target_link_libraries(
        cellularAutomaton
        imgui
        glm
)

# Copy GLSL_files to the build directory
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/GLSL_files DESTINATION ${CMAKE_CURRENT_BINARY_DIR})