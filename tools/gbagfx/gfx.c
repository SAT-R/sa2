// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h> // memcpy
#include <malloc.h> // memcpy
#include "global.h"
#include "gfx.h"
#include "util.h"

#define GET_GBA_PAL_RED(x)   (((x) >>  0) & 0x1F)
#define GET_GBA_PAL_GREEN(x) (((x) >>  5) & 0x1F)
#define GET_GBA_PAL_BLUE(x)  (((x) >> 10) & 0x1F)

#define SET_GBA_PAL(r, g, b) (((b) << 10) | ((g) << 5) | (r))

#define UPCONVERT_BIT_DEPTH(x) (((x) * 255) / 31)

#define DOWNCONVERT_BIT_DEPTH(x) ((x) / 8)

static void AdvanceMetatilePosition(int *subTileX, int *subTileY, int *metatileX, int *metatileY, int metatilesWide, int metatileWidth, int metatileHeight)
{
	(*subTileX)++;
	if (*subTileX == metatileWidth) {
		*subTileX = 0;
		(*subTileY)++;
		if (*subTileY == metatileHeight) {
			*subTileY = 0;
			(*metatileX)++;
			if (*metatileX == metatilesWide) {
				*metatileX = 0;
				(*metatileY)++;
			}
		}
	}
}

static void ConvertFromTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = metatilesWide * metatileWidth;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int destY = (metatileY * metatileHeight + subTileY) * 8 + j;
			int destX = metatileX * metatileWidth + subTileX;
			unsigned char srcPixelOctet = *src++;
			unsigned char *destPixelOctet = &dest[destY * pitch + destX];

			for (int k = 0; k < 8; k++) {
				*destPixelOctet <<= 1;
				*destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
				srcPixelOctet >>= 1;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

static void ConvertFromTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = (metatilesWide * metatileWidth) * 4;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int destY = (metatileY * metatileHeight + subTileY) * 8 + j;

			for (int k = 0; k < 4; k++) {
				int destX = (metatileX * metatileWidth + subTileX) * 4 + k;
				unsigned char srcPixelPair = *src++;
				unsigned char leftPixel = srcPixelPair & 0xF;
				unsigned char rightPixel = srcPixelPair >> 4;

				if (invertColors) {
					leftPixel = 15 - leftPixel;
					rightPixel = 15 - rightPixel;
				}

				dest[destY * pitch + destX] = (leftPixel << 4) | rightPixel;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

static void ConvertFromTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = (metatilesWide * metatileWidth) * 8;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int destY = (metatileY * metatileHeight + subTileY) * 8 + j;

			for (int k = 0; k < 8; k++) {
				int destX = (metatileX * metatileWidth + subTileX) * 8 + k;
				unsigned char srcPixel = *src++;

				if (invertColors)
					srcPixel = 255 - srcPixel;

				dest[destY * pitch + destX] = srcPixel;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

static void ConvertToTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = metatilesWide * metatileWidth;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;
			int srcX = metatileX * metatileWidth + subTileX;
			unsigned char srcPixelOctet = src[srcY * pitch + srcX];
			unsigned char *destPixelOctet = dest++;

			for (int k = 0; k < 8; k++) {
				*destPixelOctet <<= 1;
				*destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
				srcPixelOctet >>= 1;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

static void ConvertToTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = (metatilesWide * metatileWidth) * 4;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;

			for (int k = 0; k < 4; k++) {
				int srcX = (metatileX * metatileWidth + subTileX) * 4 + k;
				unsigned char srcPixelPair = src[srcY * pitch + srcX];
				unsigned char leftPixel = srcPixelPair >> 4;
				unsigned char rightPixel = srcPixelPair & 0xF;

				if (invertColors) {
					leftPixel = 15 - leftPixel;
					rightPixel = 15 - rightPixel;
				}

				*dest++ = (rightPixel << 4) | leftPixel;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

static void ConvertToTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
	int subTileX = 0;
	int subTileY = 0;
	int metatileX = 0;
	int metatileY = 0;
	int pitch = (metatilesWide * metatileWidth) * 8;

	for (int i = 0; i < numTiles; i++) {
		for (int j = 0; j < 8; j++) {
			int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;

			for (int k = 0; k < 8; k++) {
				int srcX = (metatileX * metatileWidth + subTileX) * 8 + k;
				unsigned char srcPixel = src[srcY * pitch + srcX];

				if (invertColors)
					srcPixel = 255 - srcPixel;

				*dest++ = srcPixel;
			}
		}

		AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
	}
}

void ReadImage(char *path, int tilesWidth, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors)
{
	int tileSize = bitDepth * 8;

	int fileSize;
	unsigned char *buffer = ReadWholeFile(path, &fileSize);

	int numTiles = fileSize / tileSize;

	int tilesHeight = (numTiles + tilesWidth - 1) / tilesWidth;

	if (tilesWidth % metatileWidth != 0)
		FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", tilesWidth, metatileWidth);

	if (tilesHeight % metatileHeight != 0)
		FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", tilesHeight, metatileHeight);

	image->width = tilesWidth * 8;
	image->height = tilesHeight * 8;
	image->bitDepth = bitDepth;
	image->pixels = calloc(tilesWidth * tilesHeight, tileSize);

	if (image->pixels == NULL)
		FATAL_ERROR("Failed to allocate memory for pixels.\n");

	int metatilesWide = tilesWidth / metatileWidth;

	switch (bitDepth) {
	case 1:
		ConvertFromTiles1Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	case 4:
		ConvertFromTiles4Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	case 8:
		ConvertFromTiles8Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	}

	free(buffer);
}

struct OamShape;
struct OamShape {
    struct OamShape *next;
    short offX;
    short offY;
    unsigned char width;
    unsigned char height;
};

typedef struct {
    unsigned char width;
    unsigned char height;
} OamDim;
OamDim oamSizes[12] = {
    {.width = 8, .height = 8},
    {.width = 8, .height = 4},
    {.width = 4, .height = 8},
    {.width = 4, .height = 4},
    {.width = 4, .height = 2},
    {.width = 4, .height = 1},
    {.width = 2, .height = 4},
    {.width = 2, .height = 2},
    {.width = 2, .height = 1},
    {.width = 1, .height = 4},
    {.width = 1, .height = 2},
    {.width = 1, .height = 1},
};

struct OamShape* FindSingleShape(int tileX, int tileY, int imageTileWidth, int imageTileHeight) {
    int chunkWidth  = (imageTileWidth  - tileX);
    int chunkHeight = (imageTileHeight - tileY);

    OamDim found = {0};
    for(int i = 0; i < ARRAY_COUNT(oamSizes); i++) {
        if((chunkWidth >= oamSizes[i].width) && (chunkHeight >= oamSizes[i].height)) {
            found = oamSizes[i];
            break;
        }
    }

    if((found.width + found.height) > 0) {
        struct OamShape *res = calloc(1, sizeof(struct OamShape));
        res->offX = tileX;
        res->offY = tileY;
        res->width  = found.width;
        res->height = found.height;

        return res;
    } else {
        return NULL;
    }
}

struct OamShape *FindOamShapes(int imageWidth, int imageHeight) {
    int tileWidth  = imageWidth  / 8;
    int tileHeight = imageHeight / 8;
    char *collBuffer = calloc(1, (tileWidth * tileHeight));

    int pitch = tileWidth;

    struct OamShape* head = FindSingleShape(0, 0, tileWidth, tileHeight);
    struct OamShape* curr = head;

    // Set tiles as set
    for(int y = 0; y < curr->height; y++) {
        char *pos = &collBuffer[(curr->offY + y) * pitch + curr->offX];
        memset(pos, 1, curr->width);
    }

    for(int x = 0; x < tileWidth; x++) {

        // Find next shape position
        int y = tileHeight;
        for(; y > 0 && collBuffer[(y - 1)*pitch + x] == 0; y--)
            ;

        
        if(y != tileHeight) {
            curr->next = FindSingleShape(x, y, tileWidth, tileHeight);
            curr = curr->next;
            
            // Set tiles as set
            for(int y = 0; y < curr->height; y++) {
                char *pos = &collBuffer[(curr->offY + y) * pitch + curr->offX];
                memset(pos, 1, curr->width);
            }

            // We did not yet reach the bottom of the image
            // so we have to continue looking at the current x pos
            --x;
        }
    }

    int visitedTiles = 0;
    while(visitedTiles < tileWidth * tileHeight) {
        if(collBuffer[visitedTiles] != 1)
            break;

        visitedTiles++;
    }

    if(visitedTiles != tileWidth * tileHeight)
        FATAL_ERROR("Could not find all OAM shapes in the image");

    free(collBuffer);

    return head;
}

void WriteImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors, bool ignoreEmptyTrailingTiles, bool splitIntoOamShapes)
{
	if (image->width % 8 != 0)
		FATAL_ERROR("The width in pixels (%d) isn't a multiple of 8.\n", image->width);

	if (image->height % 8 != 0)
		FATAL_ERROR("The height in pixels (%d) isn't a multiple of 8.\n", image->height);

	int imgWidthTiles  = image->width / 8;
	int imgHeightTiles = image->height / 8;

	if (imgWidthTiles % metatileWidth != 0)
		FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", imgWidthTiles, metatileWidth);

	if (imgHeightTiles % metatileHeight != 0)
		FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", imgHeightTiles, metatileHeight);

	int maxNumTiles = imgWidthTiles * imgHeightTiles;

	if (numTiles == 0)
		numTiles = maxNumTiles;
	else if (numTiles > maxNumTiles)
		FATAL_ERROR("The specified number of tiles (%d) is greater than the maximum possible value (%d).\n", numTiles, maxNumTiles);
    
    int tileSize = (8*8 * bitDepth) / 8;
	int bufferSize = numTiles * tileSize;
	unsigned char *buffer = malloc(bufferSize);

	if (buffer == NULL)
		FATAL_ERROR("Failed to allocate memory for pixels.\n");

	int metatilesWide = imgWidthTiles / metatileWidth;

	switch (bitDepth) {
	case 1:
		ConvertToTiles1Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	case 4:
		ConvertToTiles4Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	case 8:
		ConvertToTiles8Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
		break;
	}
    
    int outfileSize = bufferSize;

    if(splitIntoOamShapes) {
        if(ignoreEmptyTrailingTiles)
            FATAL_ERROR("It is not supported to use -ignore_trailing and -split_into_oam_shapes simultaneously.");

        // TODO: Add 8bpp support
        if(bitDepth != 4)
            FATAL_ERROR("Only 4bpp images supported for -split_into_oam_shapes");

        unsigned char* scratchBuffer = malloc(bufferSize);

        if(scratchBuffer) {
            /* Split image into shapes */
            struct OamShape* head = FindOamShapes(image->width, image->height);

#if 0
            /* Debug */
            printf("OAM Shapes (%d, %d):\n", image->width, image->height);
            struct OamShape* temp = head;
            while(temp) {
                printf("\t=> %d %d %d %d\n", temp->offX*8, temp->offY*8, temp->width*8, temp->height*8);
                temp = temp->next;
            }
#endif
            
            /* Copy the tiles over in the correct order */
            struct OamShape* curr = head;
            int dstIndex = 0;

            while(curr) {
                int imgPitch = imgWidthTiles * tileSize;
                int srcIndex = curr->offY * imgPitch + curr->offX * tileSize;

                for(int y = 0; y < curr->height; y++) {
                    int copySize = curr->width * tileSize;
                    memcpy(&scratchBuffer[dstIndex],
                           &buffer[srcIndex],
                           copySize);
                    srcIndex += imgPitch;
                    dstIndex += copySize;
                }

                curr = curr->next;
            }
            /* Copy the scratch buffer back into the original buffer */
            memcpy(buffer, scratchBuffer, bufferSize);
            
            /* Free the shape list*/
            curr = head;
            while(curr) {
                struct OamShape* old = curr;
                curr = old->next;
                free(old);
            };

            free(scratchBuffer);
        } else {
            FATAL_ERROR("Couldn't allocate buffer for splitting into OAM shapes");
        }
    }

    if(ignoreEmptyTrailingTiles) {
        if((outfileSize % tileSize) != 0)
            FATAL_ERROR("The output buffer size (0x%X) is not a multiple of the tileSize (0x%X).", outfileSize, tileSize);

        unsigned char* bufferEnd = buffer + (bufferSize-1);

        int checksum = 0;

        for(unsigned char* cursor = bufferEnd;
            cursor > buffer;
            cursor -= tileSize)
        {
            for(int i = 0; i < tileSize; i++) {
                checksum += *(cursor-i);
            }

            if(checksum == 0) {
                // This trailing tile is empty (Palette index 0), don't output it
                outfileSize -= tileSize;
                numTiles--;
            } else {
                // This tile contains graphics data, so don't ignore it
                break;
            }
        }
    }

	WriteWholeFile(path, buffer, outfileSize);

	free(buffer);
}

void FreeImage(struct Image *image)
{
	free(image->pixels);
	image->pixels = NULL;
}

void ReadGbaPalette(char *path, struct Palette *palette)
{
	int fileSize;
	unsigned char *data = ReadWholeFile(path, &fileSize);

	if (fileSize % 2 != 0)
		FATAL_ERROR("The file size (%d) is not a multiple of 2.\n", fileSize);

	palette->numColors = fileSize / 2;

	for (int i = 0; i < palette->numColors; i++) {
		uint16_t paletteEntry = (data[i * 2 + 1] << 8) | data[i * 2];
		palette->colors[i].red = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_RED(paletteEntry));
		palette->colors[i].green = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_GREEN(paletteEntry));
		palette->colors[i].blue = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_BLUE(paletteEntry));
	}

	free(data);
}

void WriteGbaPalette(char *path, struct Palette *palette)
{
	FILE *fp = fopen(path, "wb");

	if (fp == NULL)
		FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

	for (int i = 0; i < palette->numColors; i++) {
		unsigned char red = DOWNCONVERT_BIT_DEPTH(palette->colors[i].red);
		unsigned char green = DOWNCONVERT_BIT_DEPTH(palette->colors[i].green);
		unsigned char blue = DOWNCONVERT_BIT_DEPTH(palette->colors[i].blue);

		uint16_t paletteEntry = SET_GBA_PAL(red, green, blue);

		fputc(paletteEntry & 0xFF, fp);
		fputc(paletteEntry >> 8, fp);
	}

	fclose(fp);
}
