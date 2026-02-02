#include <malloc.h> // realloc
#include <stdio.h> // printf
#include <GL/gl.h>
#include <math.h> // sinf/cosf
#include "global.h" // TEMP for PLTT
#include "core.h" // temp?
#include "platform/shared/opengl.h"
#include "trig.h" // ONE_CYCLE
#include "game/sa1_sa2_shared/globals.h" // gCurrentLevel - TEMP: this shouldn't be exposed to the OpenGL backend...

// NOTE: This is NOT final at all. EXPERIMENTAL!!!!!

// TODO: Move this file into /platform/shared

// TEMP
static GLuint sTempTextureHandles[3] = { 0 };

#define TILE_SIZE_RGBA      ((8 * 8) * sizeof(u32))
#define CHUNK_SIZE_RGBA     ((12 * 12) * TILE_SIZE_RGBA)
#define CHUNK_SIZE_TEXCOORD ((12 * 12) * sizeof(ChunkTileVertex))
#define NUM_RGB_CHANNELS    4
u8 tempRgbaPalette[16 * 32][NUM_RGB_CHANNELS] = {};
// u8 tempRgbaFrame[DISPLAY_WIDTH * DISPLAY_HEIGHT][NUM_RGB_CHANNELS] = {};

typedef struct {
    u8 *data;
    int width, height;
} TextureBuffer;
static TextureBuffer sDynTextureBuffer = { 0 };

void Debug_PrintMatrix(float *mtx)
{
    printf("%f %f %f %f\n"
           "%f %f %f %f\n"
           "%f %f %f %f\n"
           "%f %f %f %f\n\n",
           mtx[0], mtx[1], mtx[2], mtx[3], mtx[4], mtx[5], mtx[6], mtx[7], mtx[8], mtx[9], mtx[10], mtx[11], mtx[12], mtx[13], mtx[14],
           mtx[15]);
}

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

        sDynTextureBuffer.width = width;
        sDynTextureBuffer.height = height;
    }

    u8 *texturePalette = TempConvertPLTTEntryToRGBA8(paletteId);

    u16 widthInTiles = width >> 3;

    int numSourcePixels = width * height;
    for (int frameY = 0; frameY < height; frameY++) {
        for (int frameX = 0; frameX < width; frameX++) {
            int tileIndex = (frameY >> 3) * widthInTiles + (frameX >> 3);
            int tileColorIndex = ((frameY & 0x7) * 8 + (frameX & 0x7)) + (tileIndex * (8 * 8));
            int targetColorIndex = ((frameY * width) + frameX);

            bool8 doShift = (targetColorIndex & 1);
            int textureColorId = bitmap4bpp[tileColorIndex >> 1] & (0xF << (doShift * 4));
            textureColorId >>= doShift * 4;

            sDynTextureBuffer.data[targetColorIndex * 4 + 0] = texturePalette[textureColorId * 4 + 0];
            sDynTextureBuffer.data[targetColorIndex * 4 + 1] = texturePalette[textureColorId * 4 + 1];
            sDynTextureBuffer.data[targetColorIndex * 4 + 2] = texturePalette[textureColorId * 4 + 2];
            sDynTextureBuffer.data[targetColorIndex * 4 + 3] = (textureColorId == 0) ? 0x00 : 0xFF;
        }
    }
}

typedef struct ChunkTileVertex {
    u8 x, y;
} ChunkTileVertex;

typedef struct ChunkGfx {
    ChunkTileVertex *tileVerts;
    s16 levelId;
} ChunkGfx;

static ChunkGfx chunkGfx = { NULL, -1 };

void UpdateChunkGfx(ChunkGfx *gfx, Background *bg)
{
    bool32 updateAll = TRUE;

    if (chunkGfx.tileVerts == NULL || chunkGfx.levelId != gCurrentLevel) {
        // 288 KB
        gfx->tileVerts = calloc(32 * 32, CHUNK_SIZE_TEXCOORD);
    }

    //!(bg->flags & BACKGROUND_DISABLE_TILESET_UPDATE)
    // If the palette didn't change, all tiles have to be updated
    // if (bg->flags & BACKGROUND_DISABLE_PALETTE_UPDATE) {
    //     updateAll = FALSE;
    // }

#if 0
    // NOTE: Need to call glEnableClientState(GL_TEXTURE_COORD_ARRAY) first!
    // 
    // Call using this:
    void glTexCoordPointer(2, // coordinates per vertex
 	     GL_BYTE, // data type of each vertex coordinate
 	     0, // stride (0 = tightly packed)
 	     chunkIndex*CHUNK_SIZE_TEXCOORD);
#endif
}

void OpenGL_ProcessBackgroundsCopyQueue(void)
{
    while (gBackgroundsCopyQueueCursor != gBackgroundsCopyQueueIndex) {
        Background *bg = gBackgroundsCopyQueue[gBackgroundsCopyQueueCursor];
        INC_BACKGROUNDS_QUEUE_CURSOR(gBackgroundsCopyQueueCursor);

        if ((bg->flags & BACKGROUND_FLAG_20) && (bg->scrollX == bg->prevScrollX) && bg->scrollY == bg->prevScrollY)
            continue;

        if (bg->flags & BACKGROUND_FLAG_IS_LEVEL_MAP) {
            UpdateChunkGfx(&chunkGfx, bg);

            int k = 123;
        } else {
        }
    }
}

void OpenGL_OnInit()
{
    // Enable texturing
    glEnable(GL_TEXTURE_2D);

    // Enable blending via Alpha Test
    // TODO: Maybe only do this for sprites?
    glEnable(GL_ALPHA_TEST);
    glAlphaFunc(GL_EQUAL, 1.0);

    glMatrixMode(GL_TEXTURE);
    glLoadIdentity();

    // NOTE: Modelview matrix is a legacy feature
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glGenTextures(3, &sTempTextureHandles[0]);
}

void OpenGL_TransformSprite(Sprite *sprite, SpriteTransform *transform)
{
    glMatrixMode(GL_MODELVIEW);
    s16 rotation = (transform->rotation & ONE_CYCLE);
    float theta = -(2.0f * M_PI * (((float)rotation) / 1024.0f));
    float sinTheta = sinf(theta);
    float cosTheta = cosf(theta);
    float modelViewMatrix[] = {
#if 0
        1, 0, 0, 0, //
        0, 1, 0, 0, //
        0, 0, 1, 0, //
        0, 0, 0, 1, //
#else
        +cosTheta,
        +sinTheta,
        0,
        0,
        -sinTheta,
        +cosTheta,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        1,
#endif
    };
    glLoadMatrixf(modelViewMatrix);
    // glTranslatef(transform->x, transform->y, 0);

    // Debug_PrintMatrix(modelViewMatrix);

    // TODO: This doesn't happen in the original TransformSprite() procedure!
    SPRITE_FLAG_SET(sprite, ROT_SCALE_ENABLE);
}

void OpenGL_DisplaySprite(Sprite *sprite, u8 oamPaletteNum)
{
    const SpriteOffset *dims = sprite->dimensions;
    int x = sprite->x;
    int y = sprite->y;

    if (dims != (void *)-1) {
        if (!(sprite->oamFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE)) {
            //	glMatrixMode(GL_MODELVIEW);
            //	glLoadIdentity();
        }
        // Convert vertices screenspace -> unit space
        glMatrixMode(GL_PROJECTION);
#if 0
        glLoadIdentity();
#else
        float a = 2.0f / DISPLAY_WIDTH;
        float b = 2.0f / DISPLAY_HEIGHT;
        float projMtx[] = { +a, 0,  0, 0, //
                            0,  +b, 0, 0, //
                            0,  0,  0, 0, //
                            -1, -1, 0, +1 }; //
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

#if 0
		x -= (sprite->frameFlags & SPRITE_FLAG_MASK_X_FLIP) ? dims->width - dims->offsetX : dims->offsetX;
		y -= (sprite->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) ? dims->height - dims->offsetY : dims->offsetY;
#else
        x -= dims->offsetX;
        y -= dims->offsetY;
#endif
        x += (dims->width >> 1);
        y += (dims->height >> 1);
        float minX = x - (dims->width >> 1);
        float maxX = minX + dims->width;

        float minY = (DISPLAY_HEIGHT - y) - (dims->height >> 1);
        float maxY = minY + dims->height;

        if (sprite->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            float temp = minX;
            minX = maxX;
            maxX = temp;
        }

        if (sprite->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
            float temp = minY;
            minY = maxY;
            maxY = temp;
        }

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

    // TODO: This doesn't happen in the original DisplaySprite() procedure!
    SPRITE_FLAG_CLEAR(sprite, ROT_SCALE_ENABLE);
}

void OpenGL_Render(void *tempBufferPixels, int viewportWidth, int viewportHeight)
{
    glViewport(0, 0, viewportWidth, viewportHeight);

    Background **bgQueue = &gBackgroundsCopyQueue[0];
//    __debugbreak();
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

#if 0
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
#endif

    // Update palette
    glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[0]);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 16, 32, 0, GL_RGBA, GL_UNSIGNED_BYTE, tempRgbaPalette);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); // downscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); // upscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
}