#pragma once
#include <string>
#include <fstream>
#include <sstream>
#include <iostream>
#include "debugging.h"

class computeShaderClass {
public:
    unsigned int ID;

    computeShaderClass(const char* path);
    void use() const;
};
