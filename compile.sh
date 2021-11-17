#!/bin/bash
cd headers
g++ -O3 -c *.cpp
cd ..
g++ -O3 main.cpp /usr/include/glad/glad.c headers/*.o -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl -lglfw3 -o main
