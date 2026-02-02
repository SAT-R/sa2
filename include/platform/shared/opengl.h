#ifndef GUARD_PLATFORM_SHARED_OPENGL_H
#define GUARD_PLATFORM_SHARED_OPENGL_H

#include "sprite.h" // for Sprite

void OpenGL_OnInit();
void OpenGL_ProcessBackgroundsCopyQueue();
void OpenGL_DisplaySprite(Sprite *sprite, u8 oamPaletteNum);
void OpenGL_TransformSprite(Sprite *sprite, SpriteTransform *transform);
void OpenGL_Render(void *tempBufferPixels, int windowWidth, int windowHeight);

#endif // GUARD_PLATFORM_SHARED_OPENGL_H
