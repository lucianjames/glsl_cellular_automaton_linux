#version 460 core

out vec2 v_texCoord;

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord;
layout(location = 2) uniform float zoom;
layout(location = 3) uniform vec2 offset;
layout(location = 4) uniform float ratio;

void main(){
	gl_Position = position; // * vec4(1.0f,ratio,1.0f,zoom) + vec4(offset,0.0f,0.0f);
	v_texCoord = texCoord + offset;
	v_texCoord -= 0.5f + offset;
	v_texCoord *= zoom;
	v_texCoord += 0.5f - offset;
	v_texCoord *= vec2(ratio, 1.0f);
}
