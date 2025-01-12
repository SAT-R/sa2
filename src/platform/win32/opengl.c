#include <malloc.h> // realloc
#include <stdio.h> // printf
#include <GL/gl.h>
#include "global.h" // TEMP for PLTT
#include "platform/shared/opengl.h"

// NOTE: This is NOT final at all. EXPERIMENTAL!!!!!

// TODO: Move this file into /platform/shared

// TEMP
static GLuint sTempTextureHandles[3] = { 0 };

#define NUM_RGB_CHANNELS 4
u8 tempRgbaPalette[16 * 32][NUM_RGB_CHANNELS] = {};
u8 tempRgbaFrame[DISPLAY_WIDTH * DISPLAY_HEIGHT][NUM_RGB_CHANNELS] = {};

typedef struct {
    u8 *data;
    int width, height;
} TextureBuffer;
static TextureBuffer sDynTextureBuffer = { 0 };

static void TempConvertPLTTToRGBA8(void)
{
    // Convert PLTT from ABGR1555 -> RGBA8
    for (int i = 0; i < ARRAY_COUNT(tempRgbaPalette); i++) {
        u16 color = PLTT[i];
        float r = (float)(color & 0x01F) / 31.0;
        float g = (float)((color & 0x3E0) >> 5) / 31.0;
        float b = (float)((color & 0x7C00) >> 10) / 31.0;

        tempRgbaPalette[i][0] = r * 255.0;
        tempRgbaPalette[i][1] = g * 255.0;
        tempRgbaPalette[i][2] = b * 255.0;
        tempRgbaPalette[i][3] = 1 * 255.0;
    }
}

static u8 *TempConvertPLTTEntryToRGBA8(u8 paletteId)
{
    // Convert PLTT from ABGR1555 -> RGBA8
    u16 *pal4BPP = &PLTT[(paletteId + 16) * 16];

    for (int i = 0; i < 16; i++) {
        u16 color = pal4BPP[i];

        float r = (float)(color & 0x01F) / 31.0;
        float g = (float)((color & 0x3E0) >> 5) / 31.0;
        float b = (float)((color & 0x7C00) >> 10) / 31.0;

        tempRgbaPalette[paletteId * 16 + i][0] = r * 255.0;
        tempRgbaPalette[paletteId * 16 + i][1] = g * 255.0;
        tempRgbaPalette[paletteId * 16 + i][2] = b * 255.0;
        tempRgbaPalette[paletteId * 16 + i][3] = 1 * 255.0;
    }

    return tempRgbaPalette[paletteId * 16];
}

// TODO: This should be done offline.
//       Just load all assets in RGB8 or RGBA8 on boot.
static void TempConvert4bppToRGBA8_DynTextureBuffer(const u8 *bitmap4bpp, int width, int height, u8 paletteId)
{
    if (sDynTextureBuffer.width * sDynTextureBuffer.height < width * height) {
        sDynTextureBuffer.data = realloc(sDynTextureBuffer.data, width * height * sizeof(u32));

        if (!sDynTextureBuffer.data) {
            printf("WARNING: realloc in %s failed!\n", __FUNCTION__);
            return;
        } else {
            printf("realloc: w 0x%X, h 0x%X, full: 0x%X\n", width, height, (u32)(width * height * sizeof(u32)));
        }
    }

    u8 *texturePalette = TempConvertPLTTEntryToRGBA8(paletteId);

    sDynTextureBuffer.width = width;
    sDynTextureBuffer.height = height;

    u16 widthInTiles = width >> 3;

    int numSourcePixels = width * height;
    for (int frameY = 0; frameY < height; frameY++) {
        for (int frameX = 0; frameX < width; frameX++) {
            u8 colorIndex = ((frameY & 0x7) * 8 + (frameX & 0x7));

            bool8 doShift = (colorIndex & 1);
            u8 textureColorId = bitmap4bpp[colorIndex >> 1] & (0xF << (doShift * 4));
            textureColorId >>= doShift * 4;

            sDynTextureBuffer.data[colorIndex * 4 + 0] = tempRgbaPalette[textureColorId][0];
            sDynTextureBuffer.data[colorIndex * 4 + 1] = tempRgbaPalette[textureColorId][1];
            sDynTextureBuffer.data[colorIndex * 4 + 2] = tempRgbaPalette[textureColorId][2];
            sDynTextureBuffer.data[colorIndex * 4 + 3] = 0xFF;
        }
    }
}

void OpenGL_OnInit()
{
    // Enable texturing
    glEnable(GL_TEXTURE_2D);

    glMatrixMode(GL_TEXTURE);
    glLoadIdentity();

    // NOTE: Modelview matrix is a legacy feature
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glGenTextures(2, &sTempTextureHandles[0]);
}

void OpenGL_DisplaySprite(Sprite *sprite, u8 oamPaletteNum)
{
    const SpriteOffset *dims = sprite->dimensions;

    if (dims != (void *)-1) {
        // Convert vertices screenspace -> unit space
        glMatrixMode(GL_PROJECTION);
#if 0
        glLoadIdentity();
#else
        float a = 2.0f / DISPLAY_WIDTH;
        float b = 2.0f / DISPLAY_HEIGHT;
        float projMtx[] = { a, 0, 0, 0, 0, b, 0, 0, 0, 0, 1, 0, -1, -1, 0, 1 };
        glLoadMatrixf(projMtx);
#endif

        TempConvert4bppToRGBA8_DynTextureBuffer(sprite->graphics.src, dims->width, dims->height, sprite->palId + oamPaletteNum);

        // glGenTextures(1, &sTempTextureHandles[2]);
        glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[2]);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, dims->width, dims->height, 0, GL_RGBA, GL_UNSIGNED_BYTE, sDynTextureBuffer.data);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); // downscale filtering
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); // upscale filtering
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

        // glClearColor((float)tempRgbaPalette[1][0] / 255.,
        //              (float)tempRgbaPalette[1][1] / 255.,
        //              (float)tempRgbaPalette[1][2] / 255.,
        //              1.0);
        // glClear(GL_COLOR_BUFFER_BIT);

        float minX = sprite->x - (dims->width >> 1);
        float maxX = minX + dims->width;

        float minY = sprite->y - (dims->height >> 1);
        float maxY = minY + dims->height;

        glBegin(GL_TRIANGLES);
        {
            glTexCoord2f(0.0, 0.0);
            glVertex2f(minX, maxY);
            glTexCoord2f(1.0, 1.0);
            glVertex2f(maxX, minY);
            glTexCoord2f(0.0, 1.0);
            glVertex2f(minX, minY);

            glTexCoord2f(0.0, 0.0);
            glVertex2f(minX, maxY);
            glTexCoord2f(1.0, 0.0);
            glVertex2f(maxX, maxY);
            glTexCoord2f(1.0, 1.0);
            glVertex2f(maxX, minY);
        }
        glEnd();
    }
}

void OpenGL_Render(void *tempBufferPixels, int viewportWidth, int viewportHeight)
{
    glViewport(0, 0, viewportWidth, viewportHeight);

#if 0
    // Don't convert input-vertices
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
#else
    // Convert vertices screenspace -> unit space
    glMatrixMode(GL_PROJECTION);
    float a = 2.0f / DISPLAY_WIDTH;
    float b = 2.0f / DISPLAY_HEIGHT;
    float projMtx[] = {
        a,  0,  0, 0, //
        0,  b,  0, 0, //
        0,  0,  1, 0, //
        -1, -1, 0, 1 //
    };
    glLoadMatrixf(projMtx);
#endif

    // TempConvertPLTTToRGBA8();

    // Convert the "software-rendered" image from ABGR1555 -> RGBA8
    for (int i = 0; i < ARRAY_COUNT(tempRgbaFrame); i++) {
        u16 color = ((u16 *)tempBufferPixels)[i];
        float r = (float)(color & 0x01F) / 31.0;
        float g = (float)((color & 0x3E0) >> 5) / 31.0;
        float b = (float)((color & 0x7C00) >> 10) / 31.0;

        tempRgbaFrame[i][0] = b * 255.0;
        tempRgbaFrame[i][1] = g * 255.0;
        tempRgbaFrame[i][2] = r * 255.0;
        tempRgbaFrame[i][3] = 1 * 255.0;
    }

    glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[0]);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 16, 32, 0, GL_RGBA, GL_UNSIGNED_BYTE, tempRgbaPalette);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); // downscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); // upscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

    glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[1]);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, GL_RGBA, GL_UNSIGNED_BYTE, tempRgbaFrame);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); // downscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); // upscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

    glClearColor(1.0, 1.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[1]);
    glBegin(GL_TRIANGLES);
    {
        glTexCoord2f(0.0, 0.0);
        glVertex2f(0.0, +DISPLAY_HEIGHT);
        glTexCoord2f(1.0, 1.0);
        glVertex2f(+DISPLAY_WIDTH, 0);
        glTexCoord2f(0.0, 1.0);
        glVertex2f(0, 0);

        glTexCoord2f(0.0, 0.0);
        glVertex2f(0, DISPLAY_HEIGHT);
        glTexCoord2f(1.0, 0.0);
        glVertex2f(DISPLAY_WIDTH, DISPLAY_HEIGHT);
        glTexCoord2f(1.0, 1.0);
        glVertex2f(DISPLAY_WIDTH, 0);
    }
    glEnd();
}