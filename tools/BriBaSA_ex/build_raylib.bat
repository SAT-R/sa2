@echo off

set RL_BUILD_DIR="build/raylib/"

if not exist %RL_BUILD_DIR% (
	mkdir %RL_BUILD_DIR%
)

cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rcore.c"     /Fo%RL_BUILD_DIR%/rcore.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/raudio.c"    /Fo%RL_BUILD_DIR%/raudio.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rglfw.c"     /Fo%RL_BUILD_DIR%/rglfw.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rmodels.c"   /Fo%RL_BUILD_DIR%/rmodels.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rshapes.c"   /Fo%RL_BUILD_DIR%/rshapes.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rtext.c"     /Fo%RL_BUILD_DIR%/rtext.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/rtextures.c" /Fo%RL_BUILD_DIR%/rtextures.obj
cl.exe /O2 /DPLATFORM_DESKTOP /I "./ext/raylib/src/external/glfw/include" /c "./ext/raylib/src/utils.c"     /Fo%RL_BUILD_DIR%/utils.obj

lib.exe /OUT:%RL_BUILD_DIR%/raylib.lib %RL_BUILD_DIR%/rcore.obj %RL_BUILD_DIR%/raudio.obj %RL_BUILD_DIR%/rglfw.obj %RL_BUILD_DIR%/rmodels.obj %RL_BUILD_DIR%/rshapes.obj %RL_BUILD_DIR%/rtext.obj %RL_BUILD_DIR%/rtextures.obj %RL_BUILD_DIR%/utils.obj
