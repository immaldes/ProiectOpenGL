# Install script for directory: D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/packages/assimp_x86-windows/debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "OFF")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-dbg/code/assimp-vc142-mtd.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-dbg/code/assimp-vc142-mtd.dll")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp" TYPE FILE FILES
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/anim.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/aabb.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/ai_assert.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/camera.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/color4.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/color4.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-dbg/code/../include/assimp/config.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/defs.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Defines.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/cfileio.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/light.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/material.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/material.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/matrix3x3.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/matrix3x3.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/matrix4x4.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/matrix4x4.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/mesh.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/pbrmaterial.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/postprocess.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/quaternion.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/quaternion.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/scene.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/metadata.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/texture.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/types.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/vector2.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/vector2.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/vector3.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/vector3.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/version.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/cimport.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/importerdesc.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Importer.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/DefaultLogger.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/ProgressHandler.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/IOStream.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/IOSystem.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Logger.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/LogStream.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/NullLogger.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/cexport.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Exporter.hpp"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/DefaultIOStream.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/DefaultIOSystem.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/ZipArchiveIOSystem.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SceneCombiner.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/fast_atof.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/qnan.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/BaseImporter.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Hash.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/MemoryIOWrapper.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/ParsingUtils.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/StreamReader.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/StreamWriter.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/StringComparison.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/StringUtils.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SGSpatialSort.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/GenericProperty.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SpatialSort.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SkeletonMeshBuilder.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SmoothingGroups.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/SmoothingGroups.inl"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/StandardShapes.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/RemoveComments.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Subdivision.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Vertex.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/LineSplitter.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/TinyFormatter.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Profiler.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/LogAux.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Bitmap.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/XMLTools.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/IOStreamBuffer.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/CreateAnimMesh.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/irrXMLWrapper.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/BlobIOSystem.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/MathFunctions.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Macros.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Exceptional.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/ByteSwapper.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp/Compiler" TYPE FILE FILES
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Compiler/pushpack1.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Compiler/poppack1.h"
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/src/90204b69df-11eeb21532.clean/code/../include/assimp/Compiler/pstdint.h"
    )
endif()

