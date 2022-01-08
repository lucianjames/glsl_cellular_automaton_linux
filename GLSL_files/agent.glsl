#version 460 core

#define AGENT_N 50000

layout(local_size_x = 1, local_size_y = 1) in;
layout(rgba32f, binding = 0) uniform image2D img;
layout(location = 3) uniform int size;
layout(location = 4) uniform float sensorDistance;
layout(location = 5) uniform float angleChange;
layout(location = 6) uniform float turnSpeed;

layout (std430, binding=2) buffer shader_data
{ 
  float xPos[AGENT_N];
  float yPos[AGENT_N];
  float angle[AGENT_N];
};

vec4 getPixel(float angle, float dist, uint agentID){
	vec2 location = vec2(xPos[agentID], yPos[agentID]) + vec2(cos(angle), sin(angle))*dist;
	ivec2 intLoc = ivec2(int(location[0]), int(location[1]));
	if (intLoc[0] >= size){ intLoc[0] -= size-1; }
	if (intLoc[0] <= 0){ intLoc [0] += size+1; }	
	if (intLoc[1] >= size){ intLoc[1] -= size-1; }
	if (intLoc[1] <= 0){ intLoc[1] += size+1; }
	return imageLoad(img, intLoc);
}

void loopBounds(inout vec2 pos){
	if(pos[0] >= size){ pos[0] -= size; }
	if(pos[1] >= size){ pos[1] -= size; }
	if(pos[0] <= 0){ pos[0] += size; }
	if(pos[1] <= 0){ pos[1] += size; }
}

void main(){
	uint agentID = gl_GlobalInvocationID.x;
	
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
	imageStore(img, ivec2(int(xPos[agentID]), int(yPos[agentID])), vec4(0.0f, 1.0f, (direction[1]+1)/2, 1.0f));
}
