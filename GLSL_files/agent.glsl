#version 460 core

layout(local_size_x = 1, local_size_y = 1) in;
layout(rgba32f, binding = 0) uniform image2D img;
layout(location = 3) uniform int size;
layout(location = 4) uniform float sensorDistance;
layout(location = 5) uniform float angleChange;
layout(location = 6) uniform float turnSpeed;

layout (std430, binding=2) buffer shader_data
{ 
  float xPos[100000];
  float yPos[100000];
  float angle[100000];
};

// This behaves kind of like a hash function
float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

vec4 getPixel(float angle, float dist, uint agentID){
	vec2 location = vec2(xPos[agentID], yPos[agentID]) + vec2(cos(angle), sin(angle))*dist;

	if (location[0] >= size){
		location[0] = location[0]-size;
	}
	if (location[1] >= size){
		location[1] = location[1]-size;
	}
	if (location[0] <= 0){
		location[0] = size+location[0];
	}
	if (location[1] <= 0){
		location[1] = size+location[1];
	}
	
	return imageLoad(img, ivec2(int(location[0]), int(location[1])));
}

void loopBounds(inout vec2 pos){
	if(pos[0] >= size){ pos[0] = 1; }
	if(pos[1] >= size){ pos[1] = 1; }
	if(pos[0] <= 0){ pos[0] = size-1; }
	if(pos[1] <= 0){ pos[1] = size-1; }
}

void main(){
	uint agentID = gl_GlobalInvocationID.x;

	float random = rand(vec2(xPos[agentID], yPos[agentID]));
	
	// Change agent angle
	float leftSensor = getPixel(angle[agentID]+angleChange, sensorDistance, agentID).w; // Uses alpha channel
	float rightSensor = getPixel(angle[agentID]-angleChange, sensorDistance, agentID).w;
	angle[agentID] += leftSensor*turnSpeed;
	angle[agentID] -= rightSensor*turnSpeed;

	// Update location of agent
	vec2 direction = vec2(cos(angle[agentID]), sin(angle[agentID]));
	vec2 newpos = vec2(xPos[agentID], yPos[agentID]) + (direction);
	
	// If at boundary, loop around to the other side
	loopBounds(newpos);
	
	// Set agent position
	xPos[agentID] = newpos[0]; yPos[agentID] = newpos[1];

	// Draw a pixel at the agents location
	imageStore(img, ivec2(int(xPos[agentID]), int(yPos[agentID])), vec4(0.0f, 1.0f, (direction[0]+direction[1]+2)/4, 1.0f));
}
