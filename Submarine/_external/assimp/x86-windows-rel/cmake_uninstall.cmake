IF(NOT EXISTS "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-rel/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-rel/install_manifest.txt\"")
ENDIF(NOT EXISTS "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-rel/install_manifest.txt")

FILE(READ "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/buildtrees/assimp/x86-windows-rel/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  EXEC_PROGRAM(
    "D:/Facultate/Sem II/SMM/ProiectSMM/Submarine/_external/vcpkg/downloads/tools/cmake-3.22.2-windows/cmake-3.22.2-windows-i386/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
    OUTPUT_VARIABLE rm_out
    RETURN_VALUE rm_retval
    )
  IF(NOT "${rm_retval}" STREQUAL 0)
    MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
  ENDIF(NOT "${rm_retval}" STREQUAL 0)
ENDFOREACH(file)
