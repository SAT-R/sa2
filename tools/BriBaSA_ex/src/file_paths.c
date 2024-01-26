#include <stdlib.h>
#include <string.h>

#include <config.h> // from raylib, for MAX_FILEPATH_LENGTH
#include <raylib.h>

#include "jasc_parser/jasc_parser.h"

#include "global.h"
#include "file_paths.h"

static void SetupTilemapPaths(Tilemap *out, char *directory);

void
InitFilePaths(FileInfo *outInfo, char *gameDir, char *mapDir)
{
    FileInfo info = {0};

    info.gameRoot = gameDir;
    info.mapRoot  = mapDir;
    
    /* Global C Headers */
    info.characters_h    = allocPath(gameDir, "include/constants/characters.h");
    info.animations_h    = allocPath(gameDir, "include/constants/animations.h");
    info.enemies_h       = allocPath(gameDir, "include/constants/enemies.h");
    info.interactables_h = allocPath(gameDir, "include/constants/interactables.h");
    info.items_h         = allocPath(gameDir, "include/constants/items.h");


    /* Map-specific */

    // Base Paths
    char fgPath[MAX_FILEPATH_LENGTH];
    char bgPath[MAX_FILEPATH_LENGTH];
    TextCopy(fgPath, TextFormat("%s/tilemaps/fg/", mapDir));
    TextCopy(bgPath, TextFormat("%s/tilemaps/bg/", mapDir));

    SetupTilemapPaths(&info.background, bgPath);
    SetupTilemapPaths(&info.map, fgPath);

    // Entity data
    info.entityCSVs.enemies       = allocPath(mapDir, "entities/enemies.csv");
    info.entityCSVs.interactables = allocPath(mapDir, "entities/interactables.csv");
    info.entityCSVs.items         = allocPath(mapDir, "entities/itemboxes.csv");
    info.entityCSVs.rings         = allocPath(mapDir, "entities/rings.csv");


    // Copy local data into output
    if(outInfo) {
        memcpy(outInfo, &info, sizeof(*outInfo));
    }
}

char *
allocPath(char *folder, char *fileName)
{
    const char *source      = TextFormat("%s/%s", folder, fileName);
    int allocatedSize = TextLength(source) + 1;
    char *dest        = _Realloc(NULL, allocatedSize);
    TextCopy(dest, source);
    return dest;
}

static inline void loadFile(File *out, char *fileName) {
    out->data = LoadFileData(fileName, &out->dataSize);
    out->path = fileName;
}

static inline void loadTextFile(File *out, char *fileName) {
    char *txt = LoadFileText(fileName);
    int length = TextLength(txt);

    out->data = txt;
    out->dataSize = length;
    out->path = fileName;
}

static void
LoadPaletteFromJascFile(char *jascPath, Palette *pal)
{
    Jasc jasc;
    parse_jasc(jascPath, &jasc);

    pal->colors = (Color*)jasc.colors;
    pal->count  = jasc.count;
}

static void
SetupTilemapPaths(Tilemap *out, char *directory)
{
    Tilemap tm = {0};

    tm.dir = allocPath(directory, "");

    // Shared paths
    char *tileset = allocPath(directory, "tileset.png");
    char *palette = allocPath(directory, "palette.pal");
    char *tilemap = allocPath(directory, "metatiles.tilemap2");

    // Map-exclusive paths
    char *mapBack            = allocPath(directory, "map_back.bin");
    char *mapFront           = allocPath(directory, "map_front.bin");
    char *collisionFlags     = allocPath(directory, "flags.coll");
    char *collisionHeightmap = allocPath(directory, "height_map.coll");
    char *collisionRotation  = allocPath(directory, "tile_rot.coll");
    char *stageInfo          = allocPath(directory, "metadata.txt");

    // TODO: Standardize tileset and tilemap file names in the future!
    if(!FileExists(tileset)) {
        // Assume that this is a non-stage-map tilemap

        // NOTE: GetFileName returns pointer inside the src string
        char *tilesetName = (char *)GetFileName(tileset);
        TextCopy(tilesetName, "tiles.png");
    }

    if(!FileExists(tilemap)) {
        // Didn't find a metatiles file,
        // so check whether it's a 2-byte tilemap
        char *tilemapName = (char *)GetFileName(tilemap);
        TextCopy(tilemapName, "tilemap.tilemap2");

        if(!FileExists(tilemap)) {
            // Assume that it's a 1-byte-per-tile tilemap
            char *tilemapName = (char *)GetFileName(tilemap);
            TextCopy(tilemapName, "tilemap.tilemap1");
        }
    }

    if(FileExists(tileset)) tm.tileset = LoadImage(tileset);
    if(FileExists(palette)) LoadPaletteFromJascFile(palette, &tm.palette);
    if(FileExists(tilemap)) {
        loadFile(&tm.tilemap, tilemap);
        
        const char *ext = GetFileExtension(tilemap);
        const char *tilemap1or2 = TextSubtext(ext, TextLength("tilemap2"), 1);
        int bytesPerIndex = TextToInteger(tilemap1or2);
        if(bytesPerIndex < 0)
            bytesPerIndex = 0;

        tm.bytesPerTilemapIndex = bytesPerIndex;
    }

    /* Only used by stage maps */
    if(FileExists(mapBack))            loadFile(&tm.layers[LAYER_BACK], mapBack);    
    if(FileExists(mapFront))           loadFile(&tm.layers[LAYER_FRONT], mapFront);
    if(FileExists(collisionFlags))     loadFile(&tm.collisionFlags, collisionFlags);
    if(FileExists(collisionHeightmap)) loadFile(&tm.collisionHeightmap, collisionHeightmap);
    if(FileExists(collisionRotation))  loadFile(&tm.collisionRotation, collisionRotation);
    
    memcpy(out, &tm, sizeof(*out));
}
