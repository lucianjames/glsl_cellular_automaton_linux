#version 460

layout(local_size_x = 1, local_size_y = 1) in;
layout(rgba32f, binding = 0) uniform image2D img;

void main(){
	ivec2 pixel_coords = ivec2(gl_GlobalInvocationID.xy);

	vec4 pixel = imageLoad(img, pixel_coords);
	vec4 newPixel = vec4(0.0f);
	newPixel += pixel;
	newPixel += imageLoad(img, pixel_coords + ivec2(1,0));
	newPixel += imageLoad(img, pixel_coords + ivec2(-1,0));
	newPixel += imageLoad(img, pixel_coords + ivec2(0,-1));
	newPixel += imageLoad(img, pixel_coords + ivec2(0,1));
	newPixel /= 5;

	// Change strength of diffusion
	// And slowly fade the image by making sure the sums of the two numbers being used for multiplication is < 1
	newPixel = (pixel*0.49 + newPixel*0.5);

	imageStore(img, pixel_coords, newPixel);
}
