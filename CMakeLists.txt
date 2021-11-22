cmake_minimum_required(VERSION 3.8)
project(glsl_cellular_automaton_linux)

# set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")

set(OpenGL_GL_PREFERENCE "GLVND")

find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)

include_directories(${OPENGL_INCLUDE_DIR})
include_directories(${GLFW3_INCLUDE_DIR})
# include_directories(${PROJECT_SOURCE_DIR}/glad)

add_executable(main main.cpp glad/glad.c headers/IBO.cpp headers/SSBO.cpp headers/VAO.cpp headers/VBO.cpp headers/VBO_layout.cpp headers/computeShaderClass.cpp headers/renderer.cpp headers/shaderClass.cpp headers/texture.cpp)
target_link_libraries(main OpenGL::GL glfw)
