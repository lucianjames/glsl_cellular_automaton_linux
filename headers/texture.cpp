#include "texture.h"
#include <iostream>

void activebindtex(unsigned int tex, unsigned int texid, unsigned int unit){
    GLCall(glActiveTexture(GL_TEXTURE0 + texid));
    GLCall(glBindTextureUnit(unit, tex));
    GLCall(glBindImageTexture(unit, tex, 0, GL_FALSE, 0, GL_READ_WRITE, GL_RGBA32F));
}

void makeTextures(unsigned int* textures, unsigned int n, unsigned int res){
    glGenTextures(n, textures);
    for (int i = 0; i < n; i++) {
        glActiveTexture(GL_TEXTURE0 + i);
        glBindTexture(GL_TEXTURE_2D, textures[i]);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F, res, res, 0, GL_RGBA, GL_FLOAT, NULL);
    }
}
