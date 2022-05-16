#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <iostream>


#include <GL/glew.h>
#include "Model.h"
#include <filesystem>
#include <glfw3.h>

#include <GLM.hpp>
#include <gtc/matrix_transform.hpp>
#include <gtc/type_ptr.hpp>
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include "Camera.h"

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#include <iostream>
#include "Shader.h"

#pragma comment (lib, "OpenGL32.lib")
#pragma comment (lib, "glew32.lib")
#pragma comment (lib, "glfw3dll.lib")

#include<filesystem>

namespace fs = std::filesystem;

const unsigned int SCR_WIDTH = 1280;
const unsigned int SCR_HEIGHT = 720;
const unsigned int SHADOW_WIDTH = 4096;
const unsigned int SHADOW_HEIGHT = 4096;

const char* fragmentShaderSource = "#version 330 core\n"
"out vec4 FragColor;\n"
"in vec3 ourColor;\n"
"in vec2 TexCoord;\n"
"uniform sampler2D ourTexture;\n"
"void main()\n"
"{\n"
"FragColor = texture(ourTexture, TexCoord);\n"
"}\0";

const char* vertexShaderSource = "#version 330 core\n"
"layout (location = 0) in vec3 aPos;\n"
"layout (location = 1) in vec3 aColor;\n"
"layout (location = 2) in vec2 aTexCoord;\n"
"out vec3 ourColor;\n"
"out vec2 TexCoord;\n"
"uniform mat4 model;\n"
"uniform mat4 view;\n"
"uniform mat4 projection;\n"
"void main()\n"
"{\n"
"   gl_Position = projection * view * model * vec4(aPos, 1.0);\n"
"   ourColor = aColor;\n"
"   TexCoord = vec2(aTexCoord.x, aTexCoord.y);\n"
"}\0";

//Camera* pCamera = new Camera(SCR_WIDTH, SCR_HEIGHT, glm::vec3(0.0, 0.0, 3.0));
Camera camera(glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f), 0.0f, 0.0f); //DE MODIFICATTT PT CUB
float lastX = SCR_WIDTH / 2.0f;
float lastY = SCR_HEIGHT / 2.0f;
bool firstMouse = true;
bool cameraLock = false;

float deltaTime = 0.0f;
float lastFrame = 0.0f;

void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void mouse_callback(GLFWwindow* window, double xpos, double ypos);
void scroll_callback(GLFWwindow* window, double xoffset, double yoffset);
void processInput(GLFWwindow* window);

unsigned int loadCubemap(std::vector<std::string> faces);
void setFaces(std::vector<std::string>& faces, std::string& textureFolder, unsigned int& cubemapTexture);


bool InitializeWindow(GLFWwindow*& window) {
	// glfw: initialize and configure
	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// glfw window creation
	window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "Submarine", NULL, NULL);
	if (window == NULL) {
		std::cout << "Failed to create GLFW window" << std::endl;
		glfwTerminate();
		return false;
	}

	glfwMakeContextCurrent(window);
	glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
	glfwSetCursorPosCallback(window, mouse_callback);
	glfwSetScrollCallback(window, scroll_callback);

	// tell GLFW to capture our mouse
	glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);

	glewInit();

	// configure global opengl state
	glEnable(GL_DEPTH_TEST);

	return true;
} 

bool BuildDepthMapVBO(unsigned int& depthMap, unsigned int& depthMapFBO) {

	// configure depth map FBO
	glGenFramebuffers(1, &depthMapFBO);
	// create depth texture

	glGenTextures(1, &depthMap);
	glBindTexture(GL_TEXTURE_2D, depthMap);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT, SHADOW_WIDTH, SHADOW_HEIGHT, 0, GL_DEPTH_COMPONENT, GL_FLOAT, NULL);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_BORDER);
	float borderColor[] = { 1.0, 1.0, 1.0, 1.0 };
	glTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BORDER_COLOR, borderColor);
	// attach depth texture as FBO's depth buffer
	glBindFramebuffer(GL_FRAMEBUFFER, depthMapFBO);
	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, depthMap, 0);
	glDrawBuffer(GL_NONE);
	glReadBuffer(GL_NONE);
	glBindFramebuffer(GL_FRAMEBUFFER, 0);

	return true;
}

int main(int argc, char** argv) {
	
	GLFWwindow* window;
	InitializeWindow(window);
	glfwSwapInterval(1);

	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glEnable(GL_BLEND);

	Shader shaderSkybox("skybox.vs", "skybox.fs");
	Shader shadowMappingShader("ShadowMapping.vs", "ShadowMapping.fs");
	Shader shadowMappingDepthShader("ShadowMappingDepth.vs","ShadowMappingDepth.fs");
	Shader shaderModel("modelLoading.vs","modelLoading.frag");
	Shader shaderWater("water.vs", "water.fs");
	
	fs::path localPath = std::filesystem::current_path();
	std::string pathToSkybox = localPath.string() + "/Resources";
	//Model oceanFloorModel(localPath.string() + "/Resources/BlueWreck/MaviWreck.obj");
	Model waterModel(localPath.string() + "/Resources/Water/water.obj");
	Model underwaterModel(localPath.string() + "/Resources/Underwater Scene/Underwater Scene.obj");

	unsigned int depthMap;
	unsigned int depthMapFBO;
	BuildDepthMapVBO(depthMap, depthMapFBO);

	// shader configuration
	shadowMappingShader.use();
	shadowMappingShader.setInt("diffuseTexture", 0);
	shadowMappingShader.setInt("shadowMap", 1);

	// lighting info
	glm::vec3 lightPos(-2.0f, 4.0f, -1.0f);
	glEnable(GL_CULL_FACE);

	glm::mat4 projection = glm::perspective(glm::radians(camera.Zoom), (float)SCR_WIDTH / (float)SCR_HEIGHT, 0.1f, 100.0f);

	float skyboxVertices[] = {
		// positions          
		-1.0f,  1.0f, -1.0f,
		-1.0f, -1.0f, -1.0f,
		 1.0f, -1.0f, -1.0f,
		 1.0f, -1.0f, -1.0f,
		 1.0f,  1.0f, -1.0f,
		-1.0f,  1.0f, -1.0f,

		-1.0f, -1.0f,  1.0f,
		-1.0f, -1.0f, -1.0f,
		-1.0f,  1.0f, -1.0f,
		-1.0f,  1.0f, -1.0f,
		-1.0f,  1.0f,  1.0f,
		-1.0f, -1.0f,  1.0f,

		 1.0f, -1.0f, -1.0f,
		 1.0f, -1.0f,  1.0f,
		 1.0f,  1.0f,  1.0f,
		 1.0f,  1.0f,  1.0f,
		 1.0f,  1.0f, -1.0f,
		 1.0f, -1.0f, -1.0f,

		-1.0f, -1.0f,  1.0f,
		-1.0f,  1.0f,  1.0f,
		 1.0f,  1.0f,  1.0f,
		 1.0f,  1.0f,  1.0f,
		 1.0f, -1.0f,  1.0f,
		-1.0f, -1.0f,  1.0f,

		-1.0f,  1.0f, -1.0f,
		 1.0f,  1.0f, -1.0f,
		 1.0f,  1.0f,  1.0f,
		 1.0f,  1.0f,  1.0f,
		-1.0f,  1.0f,  1.0f,
		-1.0f,  1.0f, -1.0f,

		-1.0f, -1.0f, -1.0f,
		-1.0f, -1.0f,  1.0f,
		 1.0f, -1.0f, -1.0f,
		 1.0f, -1.0f, -1.0f,
		-1.0f, -1.0f,  1.0f,
		 1.0f, -1.0f,  1.0f
	};


	// skybox VAO*/
	unsigned int skyboxVAO, skyboxVBO;
	glGenVertexArrays(1, &skyboxVAO);
	glGenBuffers(1, &skyboxVBO);
	glBindVertexArray(skyboxVAO);
	glBindBuffer(GL_ARRAY_BUFFER, skyboxVBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(skyboxVertices), &skyboxVertices, GL_STATIC_DRAW);
	glEnableVertexAttribArray(0);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);



	std::vector<std::string> faces
	{
		pathToSkybox + "/right.jpg",
		pathToSkybox + "/left.jpg",
		pathToSkybox + "/up.jpg",
		pathToSkybox + "/bottom.jpg",
		pathToSkybox + "/front.jpg",
		pathToSkybox + "/back.jpg",
	};

	

	unsigned int cubemapTexture = loadCubemap(faces);

	shaderSkybox.use();
	shaderSkybox.setInt("skybox", 0);


	// ** RENDER LOOP **
	unsigned int vertexShader;
	vertexShader = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
	glCompileShader(vertexShader);

	unsigned int fragmentShader;
	fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
	glCompileShader(fragmentShader);

	//works for multiple objects
	unsigned int shaderProgram;
	shaderProgram = glCreateProgram();
	glAttachShader(shaderProgram, vertexShader);
	glAttachShader(shaderProgram, fragmentShader);
	glLinkProgram(shaderProgram);


	glDeleteShader(vertexShader);
	glDeleteShader(fragmentShader);



	while (!glfwWindowShouldClose(window)) {

		// per-frame time logic
		float currentFrame = static_cast<float>(glfwGetTime());
		deltaTime = currentFrame - lastFrame;
		lastFrame = currentFrame;

		/*if (RotateLight) {
			lightPos.x = sin(currentFrame);
			lightPos.z = cos(currentFrame);
		}*/

		// input
		processInput(window);

		glClearColor(0.1f, 0.1f, 0.1f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		glm::mat4 view = glm::mat4(glm::mat3(camera.GetViewMatrix()));
		

		// draw scene as normal
		//shaderCubeMaps.use();
		//glm::mat4 model = glm::mat4(1.0f);

		// draw skybox as last
		glDepthFunc(GL_LEQUAL);  // change depth function so depth test passes when values are equal to depth buffer's content
		shaderSkybox.use();
		//view = glm::mat4(glm::mat3(pCamera->GetViewMatrix())); // remove translation from the view matrix
		shaderSkybox.setMat4("view", view);
		shaderSkybox.setMat4("projection", projection);
		// skybox cube
		glBindVertexArray(skyboxVAO);
		glActiveTexture(GL_TEXTURE0);
		glBindTexture(GL_TEXTURE_CUBE_MAP, cubemapTexture);
		glDrawArrays(GL_TRIANGLES, 0, 36);
		glBindVertexArray(0);
		glDepthFunc(GL_LESS); // set depth function back to default
		
		view = camera.GetViewMatrix();

		glUseProgram(shaderProgram);

		unsigned int viewLoc = glGetUniformLocation(shaderProgram, "view");
		unsigned int projLoc = glGetUniformLocation(shaderProgram, "projection");
		unsigned int modelLoc = glGetUniformLocation(shaderProgram, "model");
		// pass them to the shaders (3 different ways)
		glUniformMatrix4fv(viewLoc, 1, GL_FALSE, &view[0][0]);
		glUniformMatrix4fv(projLoc, 1, GL_FALSE, glm::value_ptr(projection));


		/*glm::mat4 modelOceanfloor = glm::mat4(1.0f);
		modelOceanfloor = glm::rotate(modelOceanfloor, (float)glm::radians(90.0f), glm::vec3(-50.0f, 50.0f, 60.0));
		modelOceanfloor = glm::translate(modelOceanfloor, glm::vec3(0.0f, 0.0f, 0.0f)); 
		modelOceanfloor = glm::scale(modelOceanfloor, glm::vec3(0.05f, 0.05f, 0.05f));	
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(modelOceanfloor));
		oceanFloorModel.Draw(shaderProgram);

		glm::mat4 modelWater = glm::mat4(1.0f);
		modelWater = glm::translate(modelWater, glm::vec3(-2.0f, -2.0f, 0.0f));
		modelWater = glm::scale(modelWater, glm::vec3(0.2f, 0.2f, 0.2f));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(modelWater));
		waterModel.Draw(shaderProgram);*/

		glm::mat4 modelUnderwater = glm::mat4(1.0f);
		modelUnderwater = glm::translate(modelUnderwater, glm::vec3(0.0f, 0.0f, 0.0f));
		modelUnderwater = glm::scale(modelUnderwater, glm::vec3(0.5f, 0.5f, 0.5f));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(modelUnderwater));
		underwaterModel.Draw(shaderProgram);






	
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	glDeleteVertexArrays(1, &skyboxVAO);
	glDeleteBuffers(1, &skyboxVBO);

	glfwTerminate();
	return 0;
	
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {	// glfw: whenever the window size changed (by OS or user resize) this callback function executes
	// make sure the viewport matches the new window dimensions; note that width and 
	// height will be significantly larger than specified on retina displays.
	//camera.Reshape(width, height);
	glViewport(0, 0, width, height);
}

void mouse_callback(GLFWwindow* window, double xpos, double ypos) {

	if (firstMouse)
	{
		lastX = xpos;
		lastY = ypos;
		firstMouse = false;
	}

	float xoffset = xpos - lastX;
	float yoffset = lastY - ypos;

	lastX = xpos;
	lastY = ypos;

	camera.ProcessMouseMovement(xoffset, yoffset);
}

void scroll_callback(GLFWwindow* window, double xoffset, double yOffset) {
	camera.ProcessMouseScroll(static_cast<float>(yOffset));
}

void processInput(GLFWwindow* window) {	// process all input: query GLFW whether relevant keys are pressed/released this frame and react accordingly
	if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);

	if (glfwGetKey(window, GLFW_KEY_UP) == GLFW_PRESS)
		camera.ProcessKeyboard(FORWARD, (float)deltaTime);
	if (glfwGetKey(window, GLFW_KEY_DOWN) == GLFW_PRESS)
		camera.ProcessKeyboard(BACKWARD, (float)deltaTime);
	if (glfwGetKey(window, GLFW_KEY_LEFT) == GLFW_PRESS)
		camera.ProcessKeyboard(LEFT, (float)deltaTime);
	if (glfwGetKey(window, GLFW_KEY_RIGHT) == GLFW_PRESS)
		camera.ProcessKeyboard(RIGHT, (float)deltaTime);
	//if (glfwGetKey(window, GLFW_KEY_PAGE_UP) == GLFW_PRESS)
		//pCamera->ProcessKeyboard(UP, (float)deltaTime);
	//if (glfwGetKey(window, GLFW_KEY_PAGE_DOWN) == GLFW_PRESS)
		//pCamera->ProcessKeyboard(DOWN, (float)deltaTime);

	if (glfwGetKey(window, GLFW_KEY_R) == GLFW_PRESS) {
		int width, height;
		glfwGetWindowSize(window, &width, &height);
		//pCamera
	}
}

unsigned int loadCubemap(std::vector<std::string> faces)
{
	unsigned int textureID;
	glGenTextures(1, &textureID);
	glBindTexture(GL_TEXTURE_CUBE_MAP, textureID);

	int width, height, nrChannels;
	for (unsigned int i = 0; i < faces.size(); i++)
	{
		unsigned char* data = stbi_load(faces[i].c_str(), &width, &height, &nrChannels, 0);
		if (data)
		{
			glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
			stbi_image_free(data);
		}
		else
		{
			std::cout << "Cubemap texture failed to load at path: " << faces[i] << std::endl;
			stbi_image_free(data);
		}
	}
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);

	return textureID;
}

void setFaces(std::vector<std::string>& faces, std::string& textureFolder, unsigned int& cubemapTexture) {
	
		faces =
		{
		textureFolder + "/_right.png",
		textureFolder + "/_left.png",
		textureFolder + "/_top.png",
		textureFolder + "/_bottom.png",
		textureFolder + "/_front.png",
		textureFolder + "/_back.png"
		};


	cubemapTexture = loadCubemap(faces);
}

