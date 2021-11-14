#pragma once
#include <string>
#include <fstream>
#include <sstream>
#include <iostream>
#include <glad/glad.h>

class shaderClass {
public:
    unsigned int ID;

    unsigned int compileShader(unsigned int type, const std::string& source);
    shaderClass(const char* vertexPath, const char* fragmentPath);
    void use() const;
    void setUniform4f(const std::string& name, float x, float y, float z, float w) const;
    void setUniform3f(const std::string& name, float x, float y, float z) const;
    void setUniform2f(const std::string& name, float x, float y) const;
    void setUniform1f(const std::string& name, float x) const;

    void setUniform4i(const std::string& name, int x, int y, int z, int w) const;
    void setUniform3i(const std::string& name, int x, int y, int z) const;
    void setUniform2i(const std::string& name, int x, int y) const;
    void setUniform1i(const std::string& name, int x) const;
};
