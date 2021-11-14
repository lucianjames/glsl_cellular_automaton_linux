#include "VBO_layout.h"

void VBO_layout::pushFloat(unsigned int count) {
    m_elements.push_back({ GL_FLOAT, count, GL_FALSE });
    m_stride += VBO_element::getSizeOfType(GL_FLOAT) * count;
}

void VBO_layout::pushInt(unsigned int count) {
    m_elements.push_back({ GL_UNSIGNED_INT, count, GL_FALSE });
    m_stride += VBO_element::getSizeOfType(GL_UNSIGNED_INT) * count;
}

void VBO_layout::pushChar(unsigned int count) {
    m_elements.push_back({ GL_UNSIGNED_BYTE, count, GL_FALSE });
    m_stride += VBO_element::getSizeOfType(GL_UNSIGNED_BYTE) * count;
}

const std::vector<VBO_element> VBO_layout::getElements() const {
    return m_elements;
}

unsigned int VBO_layout::getStride() const {
    return m_stride;
}
