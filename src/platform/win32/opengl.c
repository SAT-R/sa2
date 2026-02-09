//#include <malloc.h> // realloc
#include <stdio.h> // printf
#include <stdlib.h>
#include <GL/gl.h>
#include <math.h> // sinf/cosf
#include "global.h" // TEMP for PLTT
#include "core.h" // temp?
#include "tilemap.h" // struct Tile
#include "platform/shared/opengl.h"
#include "trig.h" // ONE_CYCLE
#include "game/stage/camera.h" // TEMP?
#include "game/sa1_sa2_shared/globals.h" // gCurrentLevel - TEMP: this shouldn't be exposed to the OpenGL backend...

// NOTE: This is NOT final at all. EXPERIMENTAL!!!!!

// TODO: Move this file into /platform/shared

// TEMP
static GLuint sTempTextureHandles[3] = { 0 };

#define TILES_PER_CHUNK_AXIS 12
#define TILES_PER_CHUNK      (SQUARE(TILES_PER_CHUNK_AXIS))
#define TILE_SIZE_PIXELS     (8 * 8)
#define TILE_SIZE_RGBA       (TILE_SIZE_PIXELS * sizeof(u32))
#define CHUNK_SIZE_RGBA      (TILES_PER_CHUNK * TILE_SIZE_RGBA)
#define CHUNK_SIZE_TEXCOORD  (TILES_PER_CHUNK * sizeof(ChunkTileVertex))
#define NUM_RGB_CHANNELS     4
// u8 tempRgbaFrame[DISPLAY_WIDTH * DISPLAY_HEIGHT][NUM_RGB_CHANNELS] = {};

typedef struct ColorRGBA {
    u8 r;
    u8 g;
    u8 b;
    u8 a;
} ColorRGBA;
typedef struct {
    u8 *data;
    int width, height;
} TextureBuffer;
static TextureBuffer sDynTextureBuffer = { 0 };

ColorRGBA tempRgbaPalette[16 * 32] = {};

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

        tempRgbaPalette[i].r = r * 255.0;
        tempRgbaPalette[i].g = g * 255.0;
        tempRgbaPalette[i].b = b * 255.0;
        tempRgbaPalette[i].a = 1 * 255.0;
    }
}

static ColorRGBA *TempConvertPLTTEntryToRGBA8(u8 paletteId)
{
    // Convert PLTT from ABGR1555 -> RGBA8
    u16 *pal4BPP = &PLTT[(paletteId + 16) * 16];

    for (int i = 0; i < 16; i++) {
        u16 color = pal4BPP[i];

        float r = (float)(color & 0x01F) / 31.0;
        float g = (float)((color & 0x3E0) >> 5) / 31.0;
        float b = (float)((color & 0x7C00) >> 10) / 31.0;

        tempRgbaPalette[paletteId * 16 + i].r = r * 255.0;
        tempRgbaPalette[paletteId * 16 + i].g = g * 255.0;
        tempRgbaPalette[paletteId * 16 + i].b = b * 255.0;
        tempRgbaPalette[paletteId * 16 + i].a = 1 * 255.0;
    }

    return &tempRgbaPalette[paletteId * 16];
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

    ColorRGBA *texturePalette = TempConvertPLTTEntryToRGBA8(paletteId);

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

            sDynTextureBuffer.data[targetColorIndex * 4 + 0] = texturePalette[textureColorId].r;
            sDynTextureBuffer.data[targetColorIndex * 4 + 1] = texturePalette[textureColorId].g;
            sDynTextureBuffer.data[targetColorIndex * 4 + 2] = texturePalette[textureColorId].b;
            sDynTextureBuffer.data[targetColorIndex * 4 + 3] = (textureColorId == 0) ? 0x00 : 0xFF;
        }
    }
}

typedef struct ChunkTileVertex {
    u8 x, y;
} ChunkTileVertex;

typedef struct ChunkGfx {
    ChunkTileVertex *tileVerts;
    u8 *rgbaChunks;
    u16 count;
    u16 capacity;
} ChunkGfx;

static ChunkGfx sChunkGfx = { 0 };
#define RENDERED_CHUNKS_W ((DISPLAY_WIDTH / 96) + 2)
#define RENDERED_CHUNKS_H ((DISPLAY_HEIGHT / 96) + 2)
#define RENDERED_CHUNKS   (RENDERED_CHUNKS_W * RENDERED_CHUNKS_H)

// Set of chunks that have to be drawn this frame
typedef struct ChunkSet {
    u16 *items;
    u16 count, capacity;
} ChunkSet;
static ChunkSet sChunkSet = { 0 };

void OpenGL_RenderRGBABuffer(u8 *buffer, u16 bufferWidth, u16 bufferHeight, float minX, float minY, float maxX, float maxY)
{
    glBindTexture(GL_TEXTURE_2D, sTempTextureHandles[2]);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, bufferWidth, bufferHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); // downscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); // upscale filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

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

void CreateChunkSet(void)
{
    const int defaultCap = 16;
    // NOTE(Jace): For some reason, malloc and realloc (at least with current compile settings on Win32) use different heaps.
    //             That means, calling realloc with a pointer from malloc, which *should* work, crashes inside realloc.
    //             So for dynamic memory, we need to init with realloc for now...
    void *mem = realloc(NULL, defaultCap * sizeof(*sChunkSet.items));
    sChunkSet.items = mem;
    sChunkSet.items[0] = 0;
    sChunkSet.count = 1; // initialize to 1, to skip zero-filled chunk (which always exists)
    sChunkSet.capacity = defaultCap;
}

void FindUniqueChunks(ChunkSet *set, Background *bg, u16 mapChunkX, u16 mapChunkY, u8 screenChunkWidth, u8 screenChunkHeight)
{

    for (int y = 0; y < screenChunkHeight; y++) {
        for (int x = 0; x < screenChunkWidth; x++) {
            u32 screenChunksStartIndex = (mapChunkY + y) * bg->mapWidth + (mapChunkX + x);
            u16 chunkId = bg->metatileMap[screenChunksStartIndex];
            bool8 isInSet = FALSE;

            // Find chunk ID in set
            for (int setI = 0; setI < set->count; setI++) {
                if (set->items[setI] == chunkId) {
                    isInSet = TRUE;
                    break;
                }
            }

            // Add if not inside
            if (!isInSet) {
                while (set->count + 1 >= set->capacity) {
                    set->items = realloc(set->items, set->capacity * 2 * sizeof(*set->items));
                    set->capacity *= 2;
                }

                set->items[set->count] = chunkId;
                set->count++;
            }
        }
    }
}

void CacheUncachedUniqueChunks(Background *bg, ChunkSet *set, ChunkGfx *gfx)
{
    // if (!(bg->flags & (BACKGROUND_DISABLE_TILESET_UPDATE | BACKGROUND_DISABLE_PALETTE_UPDATE)))
    {
        for (int chunkSetItemIndex = 0; chunkSetItemIndex < sChunkSet.count; chunkSetItemIndex++) {
            int chunkIndex = sChunkSet.items[chunkSetItemIndex];
            if (chunkIndex == 0)
                continue;

            ColorRGBA *chunkRGBA = (ColorRGBA *)(&gfx->rgbaChunks[chunkSetItemIndex * CHUNK_SIZE_RGBA]);
            const u8 *tileset4BPP = &((const u8 *)bg->graphics.src)[0];

            for (int tileIdY = 0; tileIdY < TILES_PER_CHUNK_AXIS; tileIdY++) {
                for (int tileIdX = 0; tileIdX < TILES_PER_CHUNK_AXIS; tileIdX++) {
                    int tileId = tileIdY * TILES_PER_CHUNK_AXIS + tileIdX;
                    ColorRGBA *dstTileRGBA = &chunkRGBA[tileIdY * 8 * (TILES_PER_CHUNK_AXIS * 8) + tileIdX * 8];

                    int tileInChunkIndex = (chunkIndex * TILES_PER_CHUNK) + tileIdY * TILES_PER_CHUNK_AXIS + tileIdX;
                    Tile tile = *(const Tile *)&bg->layout[tileInChunkIndex];
                    const u8 *srcTile4BPP = &tileset4BPP[(tile.index * TILE_SIZE_PIXELS) >> 1];

                    for (int tileY = 0; tileY < 8; tileY++) {
                        for (int tileX = 0; tileX < 8; tileX++) {
                            int targetColorIndex = ((tileY * 8) + tileX);
                            bool8 doShift = (targetColorIndex & 1);
                            int colorId = srcTile4BPP[targetColorIndex >> 1] & (0xF << (doShift * 4));
                            colorId >>= doShift * 4;

                            ColorRGBA *tilePalette = (ColorRGBA *)(&tempRgbaPalette[tile.pal * 16 + colorId]);
                            dstTileRGBA[tileY * (TILES_PER_CHUNK_AXIS * 8) + tileX].r = tilePalette->r;
                            dstTileRGBA[tileY * (TILES_PER_CHUNK_AXIS * 8) + tileX].g = tilePalette->g;
                            dstTileRGBA[tileY * (TILES_PER_CHUNK_AXIS * 8) + tileX].b = tilePalette->b;
                            dstTileRGBA[tileY * (TILES_PER_CHUNK_AXIS * 8) + tileX].a = tilePalette->a;
                        }
                    }
                }
            }
        }
    }
}

u16 GetSetIndexFromChunkId(ChunkSet *set, u16 chunkId)
{
    for (int i = 0; i < set->count; i++) {
        if (set->items[i] == chunkId) {
            return i;
        }
    }

    return 0;
}

void RenderScreenChunks(ChunkSet *set, ChunkGfx *gfx, Background *bg, s16 mapChunkX, s16 mapChunkY, s16 screenX, s16 screenY,
                        u8 screenChunkWidth, u8 screenChunkHeight)
{
    // for(int layerI = 0; layerI < 2; layerI++)
    for (int layerI = 0; layerI < 1; layerI++) {
        for (int chunkY = 0; chunkY < screenChunkHeight; chunkY++) {
            int chunkPosIndexY = (mapChunkY + chunkY);
            if (chunkPosIndexY >= bg->mapHeight) {
                break;
            }

            for (int chunkX = 0; chunkX < screenChunkWidth; chunkX++) {
                int chunkPosIndexX = (mapChunkX + chunkX);
                if (chunkPosIndexX >= bg->mapWidth) {
                    break;
                }
                int chunkPosIndex = chunkPosIndexY * bg->mapWidth + chunkPosIndexX;
                int chunkSetIndex = GetSetIndexFromChunkId(set, bg->metatileMap[chunkPosIndex]);
                int chunkStartIndex = chunkSetIndex * CHUNK_SIZE_RGBA;
                int chunkScreenX = (screenX + (chunkX * 96));
                int chunkScreenY = DISPLAY_HEIGHT - (screenY + (chunkY * 96));
                OpenGL_RenderRGBABuffer(&gfx->rgbaChunks[chunkStartIndex], 96, 96, chunkScreenX, chunkScreenY, chunkScreenX + 96,
                                        chunkScreenY + 96);
            }
        }
    }
}

void UpdateChunkGfx(ChunkGfx *gfx, Background *bg)
{
    u32 mapWidthPixels = bg->mapWidth * 96;
    u32 mapHeightPixels = bg->mapHeight * 96;
    u16 mapChunkX = gCamera.x / 96;
    u16 mapChunkY = gCamera.y / 96;
    s16 screenX = -(gCamera.x % 96u);
    s16 screenY = 96 - (gCamera.y % 96u);
    u8 screenChunkWidth = MIN(bg->mapWidth - mapChunkX, RENDERED_CHUNKS_W);
    u8 screenChunkHeight = MIN(bg->mapHeight - mapChunkY, RENDERED_CHUNKS_H);
    // bool8 updateAll = TRUE;

    if (sChunkGfx.tileVerts == NULL || sChunkGfx.rgbaChunks == NULL) {
        const int DEFAULT_CAP = 16;
        gfx->tileVerts = calloc(RENDERED_CHUNKS, CHUNK_SIZE_TEXCOORD * DEFAULT_CAP);
        gfx->rgbaChunks = calloc(RENDERED_CHUNKS, 96 * 96 * NUM_RGB_CHANNELS * DEFAULT_CAP);
        gfx->count = 1; // initialize to 1, to skip zero-filled chunk (which always exists)
        gfx->capacity = DEFAULT_CAP;
    }

    // TODO/PERFORMANCE:
    //   This should probably be two sets, like a "Double Buffer",
    //   with the previous set not getting reset and chunks from it getting copied over if needed.
    //   Both would somehow have to be reset on a stage transition
    //   (more accurately: when the tileset/tilemap changes), though!
    sChunkSet.count = 1; // initialize to 1, to skip zero-filled chunk (which always exists)
    FindUniqueChunks(&sChunkSet, bg, mapChunkX, mapChunkY, screenChunkWidth, screenChunkHeight);

    TempConvertPLTTToRGBA8();
    CacheUncachedUniqueChunks(bg, &sChunkSet, &sChunkGfx);

    // Draw metatile RGBA graphics
    RenderScreenChunks(&sChunkSet, gfx, bg, mapChunkX, mapChunkY, screenX, screenY, screenChunkWidth, screenChunkHeight);

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
            UpdateChunkGfx(&sChunkGfx, bg);

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

    // TODO: Maybe this shuld be done in the platform layers?
    CreateChunkSet();
}

void OpenGL_TransformSprite(Sprite *sprite, SpriteTransform *transform)
{
    glMatrixMode(GL_MODELVIEW);
    s16 rotation = (transform->rotation & ONE_CYCLE);
    float theta = -(2.0f * M_PI * (((float)rotation) / 1024.0f));
    float sinTheta = sinf(theta);
    float cosTheta = cosf(theta);
    float modelViewMatrix[] = {
#if 01
        1,
        0,
        0,
        0, //
        0,
        1,
        0,
        0, //
        0,
        0,
        1,
        0, //
        0,
        0,
        0,
        1, //
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

        OpenGL_RenderRGBABuffer(sDynTextureBuffer.data, dims->width, dims->height, minX, minY, maxX, maxY);
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