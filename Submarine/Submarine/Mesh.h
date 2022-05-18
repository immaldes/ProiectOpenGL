#pragma once

#include <string>
#include <fstream>
#include <sstream>
#include <vector>

#include <GL/glew.h>

#include "assimp/types.h"

#include "Shader.h"
using namespace std;

#define MAX_BONE_INFLUENCE 4

struct Vertex {
    // position
    glm::vec3 Position;
    // normal
    glm::vec3 Normal;
    // texCoords
    glm::vec2 TexCoords;

};

struct Texture {
    GLuint id;
    string type;
    aiString path;
};
class Mesh
{
public:
    vector<Vertex>       vertices;
    vector<GLuint> indices;
    vector<Texture>      textures;


    Mesh(vector<Vertex> vertices, vector<GLuint> indices, vector<Texture> textures);
    void Draw(Shader shader);

private:
   
    GLuint VAO,VBO, EBO;
    void setupMesh();
};

