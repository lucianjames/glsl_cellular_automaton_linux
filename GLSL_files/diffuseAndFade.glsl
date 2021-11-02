#version 460

layout(local_size_x = 1, local_size_y = 1) in;
layout(rgba32f, binding = 0) uniform image2D img;

uniform float pixelMult;
uniform float newPixelMult;

uniform int texSize;

void main(){
	ivec2 pixel_coords = ivec2(gl_GlobalInvocationID.xy);

	int xMinus = -1;
	int xPlus = 1;
	int yMinus = -1;
	int yPlus = 1;
	
	if (pixel_coords[0] <= texSize){
		xPlus = 0-(texSize-pixel_coords[0]);
	}
	if (pixel_coords[0] >= 0){
		xMinus = texSize-1;
	}
	if (pixel_coords[1] <= texSize){
		yPlus = 0-(texSize-pixel_coords[1]);
	}
	if (pixel_coords[1] >= 0){
		yMinus = texSize-1;
	}
		
	vec4 pixel = imageLoad(img, pixel_coords);
	vec4 newPixel = vec4(0.0f);
	newPixel += pixel;
	newPixel += imageLoad(img, pixel_coords + ivec2(xPlus,0));
	newPixel += imageLoad(img, pixel_coords + ivec2(xMinus,0));
	newPixel += imageLoad(img, pixel_coords + ivec2(0,yMinus));
	newPixel += imageLoad(img, pixel_coords + ivec2(0,yPlus));
	newPixel /= 5;

	// Change strength of diffusion
	// And slowly fade the image by making sure the sums of the two numbers being used for multiplication is < 1
	newPixel = (pixel*pixelMult + newPixel*newPixelMult);

	imageStore(img, pixel_coords, newPixel);
}
