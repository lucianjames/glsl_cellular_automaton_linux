#!/bin/bash
cd headers
g++ -c *.cpp
cd ..
g++ main.cpp glad.c headers/*.o -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl -lglfw3 -o main
