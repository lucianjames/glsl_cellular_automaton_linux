#include <iostream>
#include <glad/glad.h>
#include <GLFW/glfw3.h>

int main(){

	GLFWwindow* window;

	// Init glfw

	// Use openGL 4.3, core profile
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFLE, GLFW_OPENGL_CORE_PROFILE);

	// Create a window
	window = glfwCreateWindow(1024,1024,"Window", nullptr, nullptr);
	if (!window) {glfwTerminate(); return -1;}
	
	
	return 0;
}
