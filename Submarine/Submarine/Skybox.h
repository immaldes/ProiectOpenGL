#pragma once

#define STB_IMAGE_IMPLEMENTATION
#include <iostream>
#include <vector>
#include <string>

#include <GL/glew.h>
#include <stb_image.h>

#include"Shader.h"
#include "Camera.h"

class Skybox {

private:
	unsigned int cubeMapVAO, cubeMapVBO;
	unsigned int skyboxVAO, skyboxVBO;
	unsigned int cubemapTexture;
public:

	unsigned int loadCubemap(std::vector<std::string> faces);

	bool buildSkybox(Shader shaderCubeMap, Shader shaderSkybox);

	bool DrawSkybox(Shader shaderSkybox, glm::mat4& view, glm::mat4& projection, Camera* pCamera);

};
