#include "renderer.h"

void renderer::draw(const VAO& vao, const IBO& ibo, const shaderClass& shader) const {
    shader.use();
    vao.bind();
    ibo.bind();
    GLCall(glDrawElements(GL_TRIANGLES, ibo.getSize(), GL_UNSIGNED_INT, nullptr));
}
