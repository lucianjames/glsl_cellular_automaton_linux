#include "IBO.h"

IBO::IBO(const unsigned int* data, unsigned int size) : m_Size(size) {
    GLCall(glGenBuffers(1, &m_ID));
    GLCall(glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_ID));
    GLCall(glBufferData(GL_ELEMENT_ARRAY_BUFFER, size, data, GL_STATIC_DRAW));
}

IBO::~IBO() {
    GLCall(glDeleteBuffers(1, &m_ID));
}

void IBO::bind() const {
    GLCall(glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, m_ID));
}
