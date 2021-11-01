#pragma once
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include "debugging.h"

void activebindtex(unsigned int tex, unsigned int texid, unsigned int unit);

void makeTextures(unsigned int* textures, unsigned int n, unsigned int res);
