#include "global.h"
#include "game/assets/compressed/roms.h"

// TODO: build japan tiny chao garden
#ifdef JAPAN
const u8 gMultiBootProgram_TinyChaoGarden[]
    = INCBIN_U8("data/mb_chao_garden_japan.gba.lz");
#else
const u8 gMultiBootProgram_TinyChaoGarden[]
    = INCBIN_U8("chao_garden/mb_chao_garden.gba.lz");
#endif
