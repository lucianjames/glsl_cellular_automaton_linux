#pragma once
#include <glad/gl.h>
#include <GLFW/glfw3.h>
#include "debugging.h"

void activebindtex(unsigned int tex, unsigned int texid, unsigned int unit);

void makeTextures(unsigned int* textures, unsigned int n, unsigned int res);
