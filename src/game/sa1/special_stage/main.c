#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_ewram.h"
#include "lib/m4a/m4a.h"
#include "lib/m4a/m4a_internal.h" // for MP2KSongHeader
#include "game/globals.h"
#include "game/shared/stage/palette_loader.h"
#include "game/shared/stage/pause_menu.h"
#include "game/shared/stage/player.h"
#include "game/sa1/save.h"
#include "game/sa1/special_stage/main.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

extern struct MP2KSongHeader se_ring_copy;

#include "constants/sa1/animations.h"
#include "constants/sa1/tilemaps.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    u8 unk0;
    s16 unk2;
    u16 qBlend;
    s32 qUnk8;
    u8 fillerC[0x4];
} Strc_30055E0; /* 0x10 */

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    u8 filler22[6];
    u8 unk28;
    u8 unk29;
    u8 unk2A;
    u8 unk2B;
    u8 filler2C[0x2];
    u16 unk2E;
    u8 unk30;
    u8 unk31;
    s16 unk32;
    s16 unk34;
    u8 filler36[0x4];
    s16 unk3A;
    s8 unk3C;
    s8 unk3D;
    s8 unk3E;
    u8 unk3F;
    u8 unk40;
    u8 unk41;
    u16 unk42;
    u16 unk44;
    u8 filler46[0x2];
    AnimId anim48;
    u16 variant4A;
    u8 unk4C;
    u8 unk4D;
    u8 filler4E[0x2];
    u16 unk50;
    u16 unk52;
    u16 unk54;
    u8 filler56[0xA];
} Strc_3005690; /* 0x60 */

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    u8 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s8 unk12;
    s8 unk13;
} Strc_3005780;

typedef struct {
    SpriteTransform tf;
    Sprite s;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s16 unk48;
    s16 unk4A;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    s16 unk56;
    s16 unk58;
    s16 unk5A;
    s16 unk5C;
    u8 filler5E[2];
    u16 unk60;
    AnimId anim62;
    u16 variant64;
    u8 unk66;
    u8 unk67;
    s16 unk68;
    u8 unk6A;
    u8 unk6B;
    u8 unk6C;
    u8 unk6D;
    s16 unk6E;
    s16 unk70;
    u8 filler72[2];
} SpStage74;

typedef struct {
    u8 filler0[2];
    u16 unk2;
    u16 unk4;
    u8 unk6;
} SpStage8;

// Stage layouts?
typedef struct {
    s16 unk0;
    s16 unk2;
    s32 unk4;
    u16 unk8;
} SpStageC; /* 0x0C */

typedef struct {
    SpriteTransform tf;
    Sprite s;
    void *mem;
} SpStage40;

// Number of rings needed this round, to continue to the next / (in the last one) collect the emerald.
u16 gSpecialStageTargetRings = 0;

void Task_80299B0(void);
void sub_8029A50(void);
void Task_8029AC4(void);
void sub_8029B74(void);
void sub_8029E0C(s16 characterId);
void sub_8029EA8(s16 unusedCharacterId);
bool32 sub_8029F30(Strc_3005690 *param0);
bool32 sub_8029FA4(Strc_3005690 *param0);
void sub_802A068(Strc_3005690 *strc5690);
void sub_802A134(Strc_3005690 *strc5690);
void sub_802A248(Strc_3005690 *strc5690);
void sub_802A4C4(Strc_3005690 *strc5690);
void Task_802A560(void);
void sub_802A688(void);
void sub_802A890(void);
void sub_802A988(void);
void Task_802AA48(void);
void sub_802AAF0(void);
void sub_802ABA0(void);
void Task_802AC50(void);
void sub_802ACF0(void);
void sub_802B008(void);
void sub_802B07C(void);
void sub_802B18C(void);
void sub_802B214(void);
void Task_802AD9C(void);
void Task_802AE40(void);
void sub_802B5DC(Sprite *s);
void sub_802B884(void);
bool32 sub_802B66C(SpStage74 *strc74, Sprite *s, s16 param2, s16 param3);
bool32 sub_802BC6C(void);
void Task_802BEDC(void);
void sub_802C04C(SpStage74 *strc74);
void sub_802C0CC(void);
void sub_802C224(void);
void sub_802C2DC(SpStage74 *strc74);
void sub_802C488(void);
typedef enum CheckpointMsg {
    CHKPTMSG_PLAYER_COOL,
    CHKPTMSG_PLAYER_AAARGH,
    CHKPTMSG_NOT_ENOUGH_RINGS,
} CheckpointMsg;
static void CreateCheckpointMessage(u8 msg);
void sub_802C6C4(void);
void sub_802C89C(void);
void sub_802C934(void);
void UpdateObjectsAndRender(void);
void sub_802D158(void);
void sub_802D190(void);
void sub_802D1D8(void);
void sub_802D274(void);
void sub_802D464(void);
void Task_802D2BC(void);
u16 sub_802D2F4(Strc_3005690 *param0);
void sub_802D33C(void);
void Task_802D37C(void);
void sub_802D3E4(void);
void sub_802D450(void);
void sub_802D4C4(void);
void Task_802D508(void);
void TaskDestructor_802D578(Task *t);
void sub_802D560(void);
u8 sub_802D58C(s16 param0);
void SpStage_PlayRingSoundeffect(void); // 0x0802D5EC
void Task_SpStageInitializeSomethingAndStartMusic(void);
void Task_802D238(void);
void sub_802D66C(void);
void sub_802D680(void);
void sub_802D6FC(SpStage74 *strc74, Sprite *s);

void sub_802BE0C(Sprite *s, SpriteTransform *tf);

extern void sub_805C448(u8 arg0);
extern void sub_805D048(u8 arg0);
extern void sub_8068D0C();

extern void SetPlayerControls(bool32 flipFaceButtons);

typedef struct {
    SpriteTransform tf;
    Sprite s;
} TfSprite;

// From temporary_sound_play_task.c
extern u16 gUnknown_03005028;
extern u16 gUnknown_03005070;

#if PLATFORM_GBA
// TODO: Insert these!
extern Background gUnknown_030055A0;
extern Strc_30055E0 gUnknown_030055E0;
extern TfSprite gUnknown_030055F0;
extern Background gUnknown_03005630;
extern s16 gUnknown_03005670[16];
extern Strc_3005690 gUnknown_03005690;
extern u16 gUnknown_030056F0[16][2];
extern u8 gUnknown_03005730;
extern Background gUnknown_03005740;
extern Strc_3005780 gUnknown_03005780;
extern Background gUnknown_030057A0;
extern s8 gUnknown_030057E0[32];
extern Background gUnknown_03005800;
extern s16 gUnknown_03005840[16];
#else
Background gUnknown_030055A0 = { 0 };
Strc_30055E0 gUnknown_030055E0 = { 0 };
TfSprite gUnknown_030055F0 = { 0 };
Background gUnknown_03005630 = { 0 };
s16 gUnknown_03005670[16] = { 0 };
Strc_3005690 gUnknown_03005690 = { 0 };
u16 gUnknown_030056F0[16][2] = { 0 };
extern u8 gUnknown_03005730;
Background gUnknown_03005740 = { 0 };
Strc_3005780 gUnknown_03005780 = { 0 };
Background gUnknown_030057A0 = { 0 };
s8 gUnknown_030057E0[32] = { 0 };
Background gUnknown_03005800 = { 0 };
s16 gUnknown_03005840[16] = { 0 };
#endif

extern u16 gUnknown_08487140[][2];
extern u8 gUnknown_08487134[NUM_TIME_ATTACK_ZONES * ACTS_PER_ZONE];

const Background gUnknown_08486FF4 = {
    .graphics = {
        .src = NULL,
        .dest = (void*)(BG_VRAM + 0x8000),
        .size = 0,
    },
    .layoutVram = (void*)(BG_VRAM + 0xE000),
    .tilemapId = 54,
    .targetTilesX = (256 / 8),
    .targetTilesY = (256 / 8),
    .flags = 0x3,
    .prevScrollX = 0x7FFF,
    .prevScrollY = 0x7FFF,
};
const Background gUnknown_08487034 = {
    .graphics = {
        .src = NULL,
        .dest = (void*)(BG_VRAM + 0x4000),
        .size = 0,
    },
    .layoutVram = (void*)(BG_VRAM + 0xC01A),
    .tilemapId = 55,
    .targetTilesX = (152 / 8),
    .targetTilesY = (112 / 8),
    .flags = 0x2,
    .scrollX = 136,
    .scrollY = 32,
    .prevScrollX = 0x7FFF,
    .prevScrollY = 0x7FFF,
};
const Background gUnknown_08487074 = {
    .graphics = {
        .src = NULL,
        .dest = (void*)(BG_VRAM + 0x4000),
        .size = 0,
    },
    .layoutVram = (void*)(BG_VRAM + 0xC39A),
    .tilemapId = 55,
    .targetTilesX = (152 / 8),
    .targetTilesY = (112 / 8),
    .flags = 0x9A,
    .prevScrollX = 0x7FFF,
    .prevScrollY = 0x7FFF,
};
const Background gUnknown_084870B4 = {
    .graphics = {
        .src = NULL,
        .dest = (void*)(BG_VRAM + 0x4000),
        .size = 0,
    },
    .layoutVram = (void*)(BG_VRAM + 0xC800),
    .tilemapId = 55,
    .targetTilesX = (152 / 8),
    .targetTilesY = (112 / 8),
    .flags = 0x11A,
    .prevScrollX = 0x7FFF,
    .prevScrollY = 0x7FFF,
};
const Background gUnknown_084870F4 = {
    .graphics = {
        .src = NULL,
        .dest = (void*)(BG_VRAM + 0x4000),
        .size = 0,
    },
    .layoutVram = (void*)(BG_VRAM + 0xCB80),
    .tilemapId = 55,
    .targetTilesX = (152 / 8),
    .targetTilesY = (112 / 8),
    .flags = 0x19A,
    .prevScrollX = 0x7FFF,
    .prevScrollY = 0x7FFF,
};

typedef struct {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} HitboxS16;

extern const s16 gUnknown_0848715C[16][2];
extern const s16 gUnknown_08487184[16][2];
extern const s16 gUnknown_084871C4[16][2];
extern const s16 gUnknown_084871C4[16][2];
extern const HitboxS16 gUnknown_08487204;
extern const HitboxS16 gUnknown_0848720C;
extern const s16 gUnknown_08487214[12][2];
extern const s16 gUnknown_0848722C[16][3];
extern const u16 gUnknown_0848728C[14][2];
extern s16 gUnknown_084872E0[12][2];
extern s16 gUnknown_08487310[8][2];
extern s16 gUnknown_08487330[10][2];

extern SpStageC *gUnknown_087BF8DC[7];
extern u16 gUnknown_084872C4[];

static inline void sub_802D6B4__inline(Strc_3005690 *strc5690)
{
    if ((strc5690->unk42 & gPlayerControls.jump) && !(1 & strc5690->unk29)) {
        strc5690->unk20 = +Q(1);
    } else {
        if (!(2 & strc5690->unk29)) {
            strc5690->unk20 = Q(0);
        } else {
            strc5690->unk20 = -Q(1);
        }
    }
}

static inline void sub_802D6FC__inline(SpStage74 *strc74, Sprite *s)
{
    s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
}

void CreateSpecialStage()
{
    SA2_LABEL(sub_801F044)();
    gUnknown_03005730 = 0;
    gUnknown_0300507C = 0;
    gSpecialStageCollectedRings = 0;

    gUnknown_03005028 = gUnknown_08487140[gUnknown_08487134[gCurrentLevel]][0];
    gUnknown_03005070 = gUnknown_08487140[gUnknown_08487134[gCurrentLevel]][1];
    gSpecialStageTargetRings = gUnknown_03005028;

    gPlayer.itemEffect &= ~0x4;

    SetPlayerControls(LOADED_SAVE->btnConfig);

    sub_802D158();
    sub_802D190();
    sub_802D1D8();
    sub_8029B74();
    sub_802C934();

    sub_805C448(1);
}

void Task_80299B0(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Strc_30055E0 *strc55E0 = &gUnknown_030055E0;

    if (strc55E0->unk0 == 2) {
        strc55E0->unk2 = 0x1A4;
        strc5690->unk29 |= 1;
        strc5690->unk2A = 0x40;

        gCurTask->main = sub_8029A50;

        if (gUnknown_03005028 > gSpecialStageCollectedRings) {
            CreateCheckpointMessage(CHKPTMSG_NOT_ENOUGH_RINGS);
        }
    }
    if (strc55E0->unk0 == 1) {
        strc55E0->unk2 = 0x1A4;
        strc5690->unk29 |= 1;
        strc5690->unk2A = 0x80;
        gCurTask->main = sub_802D274;

        if (gUnknown_03005070 > gSpecialStageCollectedRings) {
            CreateCheckpointMessage(CHKPTMSG_NOT_ENOUGH_RINGS);
        }
    }
}

void sub_8029A50(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;

    if (--gUnknown_030055E0.unk2 <= 0) {
        if (gUnknown_03005028 <= gSpecialStageCollectedRings) {
            gUnknown_030055E0.unk0 = 0;
            strc5690->unk29 &= ~0x1;
            sub_802D560();
            gCurTask->main = Task_80299B0;
        } else {
            gStageFlags |= 0x20;
            gCurTask->main = Task_8029AC4;
        }
    }
}

void Task_8029AC4(void)
{
    gUnknown_030055E0.qBlend += Q(0.25);
    gBldRegs.bldCnt = 0x3F9F;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = I(gUnknown_030055E0.qBlend);

    if (gUnknown_030055E0.qBlend >= Q(16)) {
        gBldRegs.bldAlpha = 0x10;

        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();

        gBldRegs.bldCnt |= 0x3F1F;
        if (gUnknown_030055E0.unk0 == 2) {
            sub_805D048(0);
        } else if (gSpecialStageTargetRings <= gSpecialStageCollectedRings) {
            sub_8068D0C();
        } else {
            sub_805D048(0);
        }
    }
}

void sub_8029B74(void)
{
    Strc_3005780 *strc5780 = &gUnknown_03005780;
    s32 var_r0;
    s32 var_r0_2;

    gDispCnt = 0x1C40;
    gBgCntRegs[1] = 0x201;
    gBgCntRegs[2] = 0x5806;
    gBgCntRegs[3] = 0x1C0B;
    strc5780->unk0 = 0x88;
    strc5780->unk2 = 0x20;
    strc5780->unkE = 0;
    strc5780->unk4 = 0;
    strc5780->unk10 = 0;
    strc5780->unk6 = 0;
    strc5780->unk8 = 0;
    strc5780->unkC = 0;

#ifndef NON_MATCHING
    asm("" ::"r"(gBgScrollRegs));
#endif

    var_r0 = 0x88 - strc5780->unk4;
    if (var_r0 < 0) {
        var_r0 += 7;
    }
    gBgScrollRegs[3][0] = (var_r0 >> 3);

    var_r0_2 = strc5780->unk6 + 0x20;
    if (var_r0_2 < 0) {
        var_r0_2 += 7;
    }
    gBgScrollRegs[3][1] = (s16)(var_r0_2 >> 3);
    gBgScrollRegs[2][0] = 0x88;
    gBgScrollRegs[2][1] = 0x20;

    gUnknown_03005630 = gUnknown_08487034;
    gUnknown_030055A0 = gUnknown_08487074;
    gUnknown_03005740 = gUnknown_084870B4;
    gUnknown_03005800 = gUnknown_084870F4;
    gUnknown_030057A0 = gUnknown_08486FF4;

    DrawBackground(&gUnknown_03005630);
    DrawBackground(&gUnknown_030055A0);
    DrawBackground(&gUnknown_03005740);
    DrawBackground(&gUnknown_03005800);
    DrawBackground(&gUnknown_030057A0);

    TaskCreate(Task_802D2BC, 0U, 0x1200U, 0U, NULL);

    // Orthogonal big lights
    CreatePaletteLoaderTask(0x2000U, gUnknown_08487134[gCurrentLevel] + 0x340, 0U, NULL);

    // Diagonal small lights
    CreatePaletteLoaderTask(0x2000U, gUnknown_08487134[gCurrentLevel] + 0x340, 1U, NULL);
}

void sub_8029CDC(void)
{
    Strc_3005780 *strc5780 = &gUnknown_03005780;
    Background *bg5630 = &gUnknown_03005630;
    Background *bg55A0 = &gUnknown_030055A0;
    Background *bg5740 = &gUnknown_03005740;
    Background *bg5800 = &gUnknown_03005800;
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    s32 temp_r0;
    s32 var_r0;
    s32 var_r0_2;
    s32 var_r0_3;
    s32 var_r0_4;
#ifndef NON_MATCHING
    register s32 r1 asm("r1");
#else
    s32 r1;
#endif
    u8 r2;
    u32 temp_r0_2;

    strc5780->unk4 = I(-((strc5690->unk0 / 134) * 32));
    temp_r0 = (s32)(0 - (((s32)strc5690->unk4 / 94) << 5)) >> 8;
    strc5780->unk6 = (s16)temp_r0;
    if ((s32)(s16)temp_r0 < -0x20) {
        strc5780->unk6 = -0x20;
    }
    if ((s32)strc5780->unk6 > 0x20) {
        strc5780->unk6 = 0x20;
    }
    if ((s32)strc5780->unk4 < -0x20) {
        strc5780->unk4 = -0x20;
    }
    if ((s32)strc5780->unk4 > 0x20) {
        strc5780->unk4 = 0x20;
    }

#ifndef NON_MATCHING
    asm("" ::"r"(gBgScrollRegs));
#endif

    var_r0 = strc5780->unk0 - strc5780->unk4;
    if (var_r0 < 0) {
        var_r0 += 7;
    }
    gBgScrollRegs[3][0] = (s16)(var_r0 >> 3);
    var_r0_2 = strc5780->unk2 + strc5780->unk6;
    if (var_r0_2 < 0) {
        var_r0_2 += 7;
    }
    gBgScrollRegs[3][1] = (s16)(var_r0_2 >> 3);

    gBgScrollRegs[2][0] = strc5780->unk0 - strc5780->unk4;
    gBgScrollRegs[2][1] = strc5780->unk2 + strc5780->unk6;

    r2 = strc5780->unk12;
    strc5780->unk12 = ((strc5690->unk18 >> 9) + r2) & 0x3F;
    var_r0_3 = strc5780->unk12;
    if (var_r0_3 < 0) {
        var_r0_3 += 3;
    }
    bg5630->tilemapId = TM_SPECIAL_STAGE_BG_FRAME_0 + (var_r0_3 >> 2);
    var_r0_4 = strc5780->unk12;

#ifndef NON_MATCHING
    asm("mov r2, r0" ::"r"(var_r0_4));
#endif

    r1 = var_r0_4;
    if (r1 < 0) {
        var_r0_4 = r1 + 3;
    }
    bg55A0->tilemapId = (var_r0_4 >> 2) + 0x37;
    bg5740->tilemapId = (var_r0_4 >> 2) + 0x37;
    bg5800->tilemapId = (var_r0_4 >> 2) + 0x37;
    bg5630->flags &= 0xFFF7;
    DrawBackground(bg5630);
    DrawBackground(bg55A0);
    DrawBackground(bg5740);
    DrawBackground(bg5800);
}

void sub_8029E0C(s16 characterId)
{
    gUnknown_03005690.unk4C = characterId; // NOTE: u8 cast!
    gUnknown_03005690.unk0 = 0;
    gUnknown_03005690.unk4 = 0;
    gUnknown_03005690.unk8 = 0;
    gUnknown_03005690.unk10 = -52;
    gUnknown_03005690.unk14 = 0;
    gUnknown_03005690.unk16 = 0;
    gUnknown_03005690.unk18 = 0x800;
    gUnknown_03005690.unk1A = 0;
    gUnknown_03005690.unk2B = 0;
    gUnknown_03005690.unk28 = 0;
    gUnknown_03005690.unk29 = 1;
    gUnknown_03005690.unk2A = 0;
    gUnknown_03005690.unk2E = 0;
    gUnknown_03005690.unk30 = 0;
    gUnknown_03005690.unk31 = 0;
    gUnknown_03005690.unk40 = 1;
    gUnknown_03005690.unk42 = 0;
    gUnknown_03005690.unk44 = 0;
    gUnknown_03005690.anim48 = SA1_CHAR_ANIM_27 + gPlayerCharacterIdleAnims[gUnknown_03005690.unk4C];
    gUnknown_03005690.variant4A = 4;
    gUnknown_03005690.unk34 = 0;
    gUnknown_03005690.unk3F = 0;
    gUnknown_03005690.unk50 = 0;
    gUnknown_03005690.unk52 = 0;
    gUnknown_03005690.unk3D = 0;
    gUnknown_03005690.unk3E = 0;
    gUnknown_03005690.unk32 = 0;
}

void sub_8029EA8(s16 unusedCharacterId)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf;

    s->graphics.dest = OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc5690->anim48;
    s->variant = strc5690->variant4A;
    s->prevVariant = -1;
    s->x = DISPLAY_CENTER_X + I(strc5690->unk0);
    s->y = DISPLAY_CENTER_Y - I(strc5690->unk4);
    s->oamFlags = 0x180;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    tf = &gUnknown_030055F0.tf;
    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = 0;
    tf->y = 0;
}

bool32 sub_8029F30(Strc_3005690 *param0)
{
    if (!(1 & param0->unk29)) {
        if (8 & param0->unk29) {
            param0->unk28 = 2;
            ClearBit(param0->unk29, 3);
            sub_802A988();
            return TRUE;
        } else if (4 & param0->unk29) {
            if (param0->unk52 != param0->unk50) {
                param0->unk28 = 1;
                ClearBit(param0->unk29, 2);
                param0->unk52 = param0->unk50;
                sub_802A688();
                return TRUE;
            }
        }
    }

    return FALSE;
}

bool32 sub_8029FA4(Strc_3005690 *param0)
{
    if (param0->unk3E != 0) {
        param0->unk3E--;
        param0->unk3D = 0;
    } else if (param0->unk3D != 0) {
        param0->unk3D--;

        if (param0->unk44 & gPlayerControls.attack) {
            sub_802ACF0();
            MPlayStop(gMPlayTable[gSongTable[42].ms].info);
            CreateSpStageTrickSoundTask(MUS_SP_STAGE_TRICK, MUS_SPECIAL_STAGE);
            return TRUE;
        }
    } else if (param0->unk44 & gPlayerControls.attack) {
        if (!(1 & param0->unk29)) {
            if (0x200 & param0->unk44) {
                param0->unk3C = 0;
            } else {
                param0->unk3C = -1;
            }
            sub_802ABA0();
            return TRUE;
        }
    }

    return FALSE;
}

void sub_802A068(Strc_3005690 *param0)
{
    s32 temp_r0;
    s32 var_r0;
    u16 temp_r1;

    if (0xC0 & param0->unk42) {
        param0->unk1E = gUnknown_084871C4[(0xF0 & param0->unk42) >> 4][1];
        if ((param0->unk16 > 0) && (param0->unk1E < 0)) {
            param0->unk16 = 0;
        }
        if ((param0->unk16 < 0) && (param0->unk1E > 0)) {
            param0->unk16 = 0;
        }
    } else {
        var_r0 = param0->unk16;
        if (var_r0 < 0) {
            var_r0 += 3;
        }

        param0->unk1E = -(var_r0 >> 2);
        if (param0->unk1E == 0) {
            param0->unk1E = 0 - (u16)param0->unk16;
        }
    }

    if (0x30 & param0->unk42) {
        param0->unk1C = gUnknown_084871C4[(0xF0 & param0->unk42) >> 4][0];
        if ((param0->unk14 > 0) && (param0->unk1C < 0)) {
            param0->unk14 = 0;
        }
        if ((param0->unk14 < 0) && (param0->unk1C > 0)) {
            param0->unk14 = 0;
        }
    } else {
        var_r0 = param0->unk14;
        if (var_r0 < 0) {
            var_r0 += 3;
        }
        param0->unk1C = -(var_r0 >> 2);
        if (param0->unk1C == 0) {
            param0->unk1C = -param0->unk14;
        }
    }
}

void sub_802A134(Strc_3005690 *param0)
{
    Sprite *s = &gUnknown_030055F0.s;
    u32 var_r0;

    if (2 & param0->unk29) {
        if (param0->unk18 <= Q(12)) {
            param0->anim48 = SA1_CHAR_ANIM_29 + gPlayerCharacterIdleAnims[param0->unk4C];
            param0->variant4A = 0;
        } else {
            param0->anim48 = SA1_CHAR_ANIM_29 + gPlayerCharacterIdleAnims[param0->unk4C];
            param0->variant4A = 1;
        }
    } else {
        if ((0xF0 & param0->unk42) != 0) {
            param0->anim48 = gUnknown_08487184[((0xF0 & param0->unk42) >> 4)][0] + gPlayerCharacterIdleAnims[param0->unk4C];
            param0->variant4A = gUnknown_08487184[((0xF0 & param0->unk42) >> 4)][1];
        } else {
            var_r0 = sub_802D2F4(param0);
            param0->anim48 = gUnknown_0848715C[var_r0][0] + gPlayerCharacterIdleAnims[param0->unk4C];
            param0->variant4A = gUnknown_0848715C[var_r0][1];
        }
    }

    if ((s->graphics.anim != param0->anim48) || (s->variant != param0->variant4A)) {
        s->graphics.anim = param0->anim48;
        s->variant = param0->variant4A;
        s->prevVariant = -1;
    }
}

void sub_802A248(Strc_3005690 *param0)
{
    s32 param0_unk0 = param0->unk0;
    s32 param0_unk4 = param0->unk4;

    param0->unk14 += param0->unk1C;
    param0->unk16 += param0->unk1E;
    param0->unk18 += param0->unk20;

    switch (param0->unk28) {
        case 0:
        case 2:
        case 3:
        case 4:
        case 5: {
            if (param0->unk14 > 0x400) {
                param0->unk14 = 0x400;
            } else if (param0->unk14 < -0x400) {
                param0->unk14 = -0x400;
            }

            if (param0->unk16 > 0x400) {
                param0->unk16 = 0x400;
            } else if (param0->unk16 < -0x400) {
                param0->unk16 = -0x400;
            }

            if (param0->unk18 <= 0xC00) {
                if (param0->unk18 <= 0x7FF) {
                    param0->unk18 = 0x800;
                }
            } else {
                param0->unk18 = 0xC00;
            }

            if (param0->unk18 == 0x800) {
                param0->unk29 &= ~2;
            } else {
                param0->unk29 |= 2;
            }

            if (2 & param0->unk29) {
                param0_unk4 = param0->unk4 >> 5;
                if (param0_unk4 >= 0) {
                    if (param0_unk4 < param0->unk16) {
                        param0->unk16 = param0_unk4;
                    }
                } else {
                    if (param0_unk4 > param0->unk16) {
                        param0->unk16 = param0_unk4;
                    }
                }

                if (2 & param0->unk29) {
                    param0->unk0 += (param0->unk14 * 8) / I(param0->unk18);
                    param0->unk4 += (param0->unk16 * 8) / I(param0->unk18);
                    param0->unk0 -= (param0->unk0 >> 5);
                    param0->unk4 -= (param0->unk4 >> 5);
                } else {
                    param0->unk0 += param0->unk14;
                    param0->unk4 += param0->unk16;
                }
            } else {
                param0->unk0 += param0->unk14;
                param0->unk4 += param0->unk16;
            }
            if (!(1 & param0->unk29)) {
                param0->unk8 += param0->unk18;
            }
        } break;

        case 1: {
            switch (param0->unk54) {
                default: {
                    param0->unk0 = param0_unk0 + param0->unk14;
                    param0->unk4 = param0_unk4 + param0->unk16;
                } break;

                case 4: {
                    param0->unk14 += param0->unk1C;
                    param0->unk16 += param0->unk1E;

                    if (param0->unk14 > 0x400) {
                        param0->unk14 = 0x400;
                    } else if (param0->unk14 < -0x400) {
                        param0->unk14 = -0x400;
                    }

                    if (param0->unk16 > 0x400) {
                        param0->unk16 = 0x400;
                    } else if (param0->unk16 < -0x400) {
                        param0->unk16 = -0x400;
                    }

                    param0->unk14 = (param0->unk14 * I(param0->unk18)) / 8;
                    param0->unk16 = (param0->unk16 * I(param0->unk18)) / 8;

                    param0->unk0 += param0->unk14;
                    param0->unk4 += param0->unk16;
                } break;

                case 5: {
                    param0->unk14 += param0->unk1C;
                    param0->unk16 += param0->unk1E;

                    if (param0->unk14 > 0x400) {
                        param0->unk14 = 0x400;
                    } else if (param0->unk14 < -0x400) {
                        param0->unk14 = -0x400;
                    }

                    if (param0->unk16 > 0x400) {
                        param0->unk16 = 0x400;
                    } else if (param0->unk16 < -0x400) {
                        param0->unk16 = -0x400;
                    }

                    param0->unk14 = (param0->unk14 * 8) / I(param0->unk18);
                    param0->unk16 = (param0->unk16 * 8) / I(param0->unk18);
                    param0->unk0 += param0->unk14;
                    param0->unk4 += param0->unk16;
                }
            }
            if (!(1 & param0->unk29)) {
                param0->unk8 += param0->unk18;
            }
        } break;
    }

    if (param0->unk0 < -Q(134)) {
        param0->unk0 = -Q(134);
    }
    if (param0->unk0 > +Q(134)) {
        param0->unk0 = +Q(134);
    }
    if (param0->unk4 < -Q(94)) {
        param0->unk4 = -Q(94);
    }
    if (param0->unk4 > +Q(94)) {
        param0->unk4 = +Q(94);
    }
}

// (90.14%) https://decomp.me/scratch/ZDa67
NONMATCH("asm/non_matching/game/sa1/special_stage/sub_802A4C4.inc", void sub_802A4C4(Strc_3005690 *param0))
{
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    s16 temp_r1;
    s16 temp_r1_3;
    s16 x16, y16;
    s16 temp_r8;
    s32 r1, r8;
    s32 temp_r1_2;

    r8 = param0->unk10;
    temp_r1_2 = (param0->unk10 + 0x240);
    x16 = I((param0->unk0 * (param0->unk10 + 0x240)) / 576);
    y16 = I((param0->unk4 * (param0->unk10 + 0x240)) / 576);
    r1 = 80;
    r1 -= y16;

    param0->unkC = (x16 += 120 + gUnknown_03005780.unk4);
    param0->unkE = r1 -= (u16)gUnknown_03005780.unk6;
    s->x = param0->unkC;
    s->y = param0->unkE;
    tf->x = s->x;
    tf->y = s->y;
    tf->rotation = 0;
    tf->qScaleX = r8 + Q(1);
    tf->qScaleY = r8 + Q(1);
    s->frameFlags = 0x2020;
}
END_NONMATCH

void Task_802A560(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    u32 var_r0;

    strc5690->unk42 = gInput;
    strc5690->unk44 = gPressedKeys;
    if (0xC0 & strc5690->unk2A) {
        strc5690->unk32 = 0x78;
        strc5690->unk14 = (-strc5690->unk0) / 120;
        strc5690->unk16 = (-strc5690->unk4) / 120;
        strc5690->unk1C = 0;
        strc5690->unk1E = 0;
        gCurTask->main = Task_802AE40;
        Task_802AE40();
    } else {
        if (!sub_8029F30(strc5690) && !sub_8029FA4(strc5690)) {
            strc5690->unk12 = (strc5690->unk12 + 0x10) & 0x3FF;
            strc5690->unk10 = SIN_24_8(strc5690->unk12) / 16u;

            sub_802D6B4__inline(strc5690);

            sub_802A068(strc5690);
            sub_802A134(strc5690);
            sub_802A248(strc5690);
            sub_802A4C4(strc5690);
            UpdateSpriteAnimation(s);
            sub_802BE0C(s, tf);
            DisplaySprite(s);
        }
    }
}

void sub_802A688(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    u16 index;

    index = strc5690->unk54 - 4;
    strc5690->anim48 = gUnknown_08487214[index][0] + gPlayerCharacterIdleAnims[strc5690->unk4C];
    strc5690->variant4A = gUnknown_08487214[index][1];
    s->graphics.anim = strc5690->anim48;
    s->variant = strc5690->variant4A;
    s->prevVariant = -1;
    if (2 & strc5690->unk29) {
        strc5690->unk14 = (gUnknown_0848722C[index][0] * 4) / 3;
        strc5690->unk16 = (gUnknown_0848722C[index][1] * 4) / 3;
        strc5690->unk18 = (gUnknown_0848722C[index][2] * 4) / 3;
    } else {
        strc5690->unk14 = gUnknown_0848722C[index][0];
        strc5690->unk16 = gUnknown_0848722C[index][1];
        strc5690->unk18 = gUnknown_0848722C[index][2];
    }

    switch (index) {
        default: {
            s32 unk20;
            strc5690->unk1C = -(gUnknown_0848722C[index][0] >> 7);
            strc5690->unk1E = -(gUnknown_0848722C[index][1] >> 7);
            strc5690->unk20 = -32;

#ifndef NON_MATCHING
            // NOTE: This works, but converts each value to double, multiplies two doubles in software and then converts them back to
            // integer.
            //       Considering the mul values are just 1.5 and 3, this can be done as integers.
            strc5690->unk14 *= 1.5;
            strc5690->unk16 *= 1.5;
            strc5690->unk18 *= 1.5;
            strc5690->unk1C *= 3.0;
            strc5690->unk1E *= 3.0;
#else
            // This is now just one add and two/one shifts
            strc5690->unk14 = (strc5690->unk14 * 3) >> 1;
            strc5690->unk16 = (strc5690->unk16 * 3) >> 1;
            strc5690->unk18 = (strc5690->unk18 * 3) >> 1;
            strc5690->unk1C *= 3;
            strc5690->unk1E *= 3;
#endif
            unk20 = -Q(0.375);
            strc5690->unk20 = unk20;
        } break;

        case 0: {
            strc5690->unk1C = 0;
            strc5690->unk1E = 0;
            strc5690->unk20 = +Q(0.25);
        } break;

        case 1: {
            strc5690->unk1C = 0;
            strc5690->unk1E = 0;
            strc5690->unk20 = -Q(0.25);
        } break;
    }

    if (gUnknown_03005730 == 0) {
        m4aSongNumStart(SE_148);
    }

    strc5690->unk29 &= ~0x6;
    sub_802A248(strc5690);
    sub_802A4C4(strc5690);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    gCurTask->main = sub_802A890;
}

void sub_802A890(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    bool32 var_r7 = 0;

    strc5690->unk42 = gInput;
    strc5690->unk44 = gPressedKeys;

    if (strc5690->unk3D != 0) {
        strc5690->unk3D--;
    }

    switch (strc5690->unk54) {
        case 4:
            if (strc5690->unk18 > 0) {
                sub_802A068(strc5690);
            }
            break;
        case 5:
            sub_802A068(strc5690);
            break;
    }

    if (sub_8029F30(strc5690) == 0) {
        if (strc5690->unk54 == 4) {
            if (strc5690->unk18 >= 0x800) {
                var_r7 = 1;
            }
        } else {
            if (strc5690->unk18 <= 0x800) {
                var_r7 = 1;
            }
        }

        if (var_r7 != 0) {
            gCurTask->main = Task_802A560;
            strc5690->unk28 = 0;
            strc5690->unk18 = 0x800;
            strc5690->unk20 = 0;
            strc5690->unk3E = 0;
        }
        sub_802A248(strc5690);
        sub_802A4C4(strc5690);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802A988(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    if (gSpecialStageCollectedRings != 0) {
        sub_802AAF0();
        if (gUnknown_03005730 == 0) {
            m4aSongNumStart(SE_RINGS_LOST);
        }
    }

    strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 32;
    strc5690->variant4A = 0;

    s->graphics.anim = strc5690->anim48;
    s->variant = strc5690->variant4A;
    s->prevVariant = 0xFF;

    strc5690->unk14 = 0;
    strc5690->unk16 = 0;
    strc5690->unk18 = 0x800;
    strc5690->unk1C = 0;
    strc5690->unk1E = 0;
    strc5690->unk20 = 0;
    strc5690->unk29 &= 0xFE;
    strc5690->unk34 = 0x3C;
    sub_802A248(strc5690);
    sub_802A4C4(strc5690);

    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    gCurTask->main = Task_802AA48;
}

void Task_802AA48(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    u16 temp_r0;

    strc5690->unk42 = gInput;
    strc5690->unk44 = gPressedKeys;
    if (strc5690->unk3D != 0) {
        strc5690->unk3D = (u8)strc5690->unk3D - 1;
    }

    if (--strc5690->unk34 == 0) {
        gCurTask->main = Task_802A560;
        strc5690->unk28 = 0;
        (&strc5690->unk28)[0x16] = 0;
    }
    if (strc5690->unk34 <= 30) {
        sub_802A068(&gUnknown_03005690);
    }
    sub_802A248(&gUnknown_03005690);
    sub_802A4C4(&gUnknown_03005690);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    if (!(2 & strc5690->unk34)) {
        DisplaySprite(s);
    }
}

void sub_802AAF0(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    s32 temp_r3;
    SpStage74 *strc74;
    u16 temp_r7;
    u16 var_r5;

    if ((u32)gSpecialStageCollectedRings > 9U) {
        var_r5 = 10;
        gSpecialStageCollectedRings = gSpecialStageCollectedRings - 10;
    } else {
        var_r5 = gSpecialStageCollectedRings;
        gSpecialStageCollectedRings = 0;
    }

    temp_r7 = var_r5;
    while (var_r5 != 0) {
        strc74 = TASK_DATA(TaskCreate(sub_802C6C4, sizeof(SpStage74), 0x1500U, 0U, NULL));
        temp_r3 = var_r5 - 1;
        strc74->unk6A = temp_r3;
        strc74->unk6B = temp_r7;
        strc74->unk3C = strc5690->unk0;
        strc74->unk40 = strc5690->unk4;
        strc74->unk44 = strc5690->unk8;
        strc74->unk52 = 0;
        strc74->unk54 = 0;
        strc74->unk56 = 0;
        strc74->unk58 = 0;
        strc74->unk5A = 0;
        strc74->unk5C = 0;
        strc74->unk60 = 0;
        strc74->unk68 = 0xFFFF;
        var_r5 = temp_r3;
    }
}

void sub_802ABA0(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 30;
    strc5690->variant4A = 0;

    s->graphics.anim = strc5690->anim48;
    s->variant = strc5690->variant4A;
    s->prevVariant = 0xFF;

    strc5690->unk14 = 0;
    strc5690->unk16 = 0;
    strc5690->unk1C = 0;
    strc5690->unk1E = 0;
    strc5690->unk20 = 0;
    strc5690->unk28 = 3;
    strc5690->unk29 |= 0x10;
    strc5690->unk3A = 0x2D;

    if (gUnknown_03005730 == 0) {
        m4aSongNumStart(SE_149);
    }

    sub_802A248(strc5690);
    sub_802A4C4(strc5690);

    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    gCurTask->main = Task_802AC50;
}

void Task_802AC50(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    if (strc5690->unk3D != 0) {
        strc5690->unk3D--;
    }
    if (sub_8029F30(strc5690) == 0) {
        if (2 & strc5690->unk29) {
            strc5690->unk20 = -Q(0.5);
        } else {
            strc5690->unk20 = 0;
        }

        if (--strc5690->unk3A == 0) {
            gCurTask->main = Task_802A560;
            strc5690->unk29 &= ~0x10;
            strc5690->unk28 = 0;
            strc5690->unk3E = 0xC;
        }

        sub_802A248(strc5690);
        sub_802A4C4(strc5690);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802ACF0(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 31;
    strc5690->variant4A = 0;

    s->graphics.anim = strc5690->anim48;
    s->variant = strc5690->variant4A;
    s->prevVariant = 0xFF;

    strc5690->unk14 = 0;
    strc5690->unk16 = 0;
    strc5690->unk1C = 0;
    strc5690->unk1E = 0;
    strc5690->unk20 = 0;
    strc5690->unk28 = 4;
    strc5690->unk29 |= 0x20;

    if (gUnknown_03005730 == 0) {
        m4aSongNumStart(SE_149);
    }

    sub_802A248(strc5690);
    sub_802A4C4(strc5690);

    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    gCurTask->main = Task_802AD9C;
}

void Task_802AD9C(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    if (strc5690->unk3D != 0) {
        strc5690->unk3D--;
    }
    if (sub_8029F30(strc5690) == 0) {
        if (2 & strc5690->unk29) {
            strc5690->unk20 = -Q(0.5);
        } else {
            strc5690->unk20 = 0;
        }

        if (s->frameFlags & 0x4000) {
            gCurTask->main = Task_802A560;
            strc5690->unk29 &= ~0x20;
            strc5690->unk28 = 0;
            strc5690->unk3E = 0xC;
        }

        sub_802A248(strc5690);
        sub_802A4C4(strc5690);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void Task_802AE40(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    strc5690->unk42 = 0;
    strc5690->unk44 = 0;
    strc5690->unk12 = ((u16)strc5690->unk12 + 0x10) & 0x3FF;
    strc5690->unk10 = (s16)((s32)((u16)gSineTable[strc5690->unk12] << 0x10) >> 0x1A);

    if (2 & strc5690->unk29) {
        strc5690->unk20 = -Q(1);
    } else {
        strc5690->unk20 = 0;
    }

    sub_802A134(strc5690);
    sub_802A248(strc5690);
    sub_802A4C4(strc5690);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    if (--strc5690->unk32 == 0) {
        if (strc5690->unk2A == 0x40) {
            if (gUnknown_03005028 <= gSpecialStageCollectedRings) {
                strc5690->unk32 = 0x14A;
                strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 0x21;
                strc5690->variant4A = 0;
                gCurTask->main = sub_802B07C;
                CreateCheckpointMessage(CHKPTMSG_PLAYER_COOL);
            } else {
                strc5690->unk32 = 0;
                strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 0x22;
                strc5690->variant4A = 0;
                gCurTask->main = sub_802B008;
                sub_802B214();
                CreateCheckpointMessage(CHKPTMSG_PLAYER_AAARGH);
            }
        } else if (gUnknown_03005070 <= gSpecialStageCollectedRings) {
            strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 0x21;
            strc5690->variant4A = 0;
            gCurTask->main = sub_802B18C;
            m4aSongNumStart(MUS_SPECIAL_STAGE_CLEAR);
            CreateCheckpointMessage(CHKPTMSG_PLAYER_COOL);
        } else {
            strc5690->unk32 = 0;
            strc5690->anim48 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 0x22;
            strc5690->variant4A = 0;
            gCurTask->main = sub_802B008;
            sub_802B214();
            CreateCheckpointMessage(CHKPTMSG_PLAYER_AAARGH);
        }
        s->graphics.anim = strc5690->anim48;
        s->variant = strc5690->variant4A;
        s->prevVariant = -1;
    }
}

void sub_802B008(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;

    if (strc5690->unk32 > -120) {
        strc5690->unk10 = --strc5690->unk32;
        strc5690->unk42 = 0;
        strc5690->unk44 = 0;

        if (!(2 & strc5690->unk29)) {
            strc5690->unk20 = 0;
        } else {
            strc5690->unk20 = -Q(1.0);
        }

        sub_802A068(strc5690);
        sub_802A248(strc5690);
        sub_802A4C4(strc5690);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

// (98.11%) https://decomp.me/scratch/jrZYE
NONMATCH("asm/non_matching/game/sa1/special_stage/sub_802B07C.inc", void sub_802B07C(void))
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    u32 flags;
    u8 *ptr;

    strc5690->unk42 = 0;
    strc5690->unk44 = 0;
    strc5690->unk12 = (strc5690->unk12 + 0x10) & 0x3FF;
    strc5690->unk10 = SIN(strc5690->unk12) >> 10;
    flags = 2 & strc5690->unk29;
    ptr = &strc5690->unk29;
    if (flags) {
        strc5690->unk20 = -Q(1);
    } else {
        strc5690->unk20 = 0;
    }

    sub_802A068(strc5690);
    sub_802A248(strc5690);
    sub_802A4C4(strc5690);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);

    if (strc5690->unk32 == 0xB4) {
        gSpecialStageTargetRings = gUnknown_03005070;
        TasksDestroyInPriorityRange(0x1180U, 0x1181U);
        sub_805C448(0U);
    }
    if (strc5690->unk32 != 0) {
        if (--strc5690->unk32 == 0) {
            strc5690->variant4A = 1;
            s->variant = 1;
            s->prevVariant = 0xFF;
        }
    }
    if (s->frameFlags & 0x4000) {
        gCurTask->main = Task_802A560;
        *ptr = 0;
        strc5690->unk2A = 0;
        strc5690->unk3E = 0xC;
    }
}
END_NONMATCH

void sub_802B18C(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s = &gUnknown_030055F0.s;
    SpriteTransform *tf = &gUnknown_030055F0.tf;
    u32 flags;

    strc5690->unk42 = 0;
    strc5690->unk44 = 0;
    strc5690->unk12 = (strc5690->unk12 + 0x10) & 0x3FF;
    strc5690->unk10 = SIN_24_8(strc5690->unk12) / 16u;

    if (2 & strc5690->unk29) {
        strc5690->unk20 = -Q(1);
    } else {
        strc5690->unk20 = 0;
    }

    sub_802A068(strc5690);
    sub_802A248(strc5690);
    sub_802A4C4(strc5690);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
    DisplaySprite(s);
}

void sub_802B214(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Sprite *s;
    SpriteTransform *tf;
    s32 rnd;

    SpStage74 *strc74 = TASK_DATA(TaskCreate(Task_802D508, sizeof(SpStage74), 0x10FFU, 0U, NULL));
    strc74->unk3C = strc5690->unk0;
    strc74->unk40 = strc5690->unk4;
    strc74->unk44 = strc5690->unk8 - Q(1);
    strc74->unk50 = (s16)(u16)strc5690->unk10;
    strc74->unk52 = 0;
    strc74->unk54 = 0;
    strc74->unk56 = 0;
    rnd = PseudoRandom32();
    strc74->unk58 = rnd & 0xF;
    strc74->unk5A = -((0x70 & rnd) >> 4);
    strc74->unk5C = -0x10;
    if (rnd & 0x80) {
        strc74->unk58 = -strc74->unk58;
    }
    strc74->unk6E = 0;
    strc74->unk60 = 0xE;
    strc74->anim62 = gPlayerCharacterIdleAnims[strc5690->unk4C] + 34;
    strc74->variant64 = 1U;
    strc74->unk67 = 0;

    s = &strc74->s;
    s->graphics.dest = OBJ_VRAM0 + 0x1400;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    strc74->unk66 = sub_802D58C(I(strc5690->unk8) - I(strc74->unk44));
    s->x = I(strc74->unk3C) + 120;
    s->y = 80 - I(strc74->unk40);
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->qAnimDelay = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = strc74->unk66 | 0x2020;
    tf = &strc74->tf;
    tf->rotation = 0;
    tf->qScaleX = Q(0.25);
    tf->qScaleY = Q(0.25);
    tf->x = s->x;
    tf->y = s->y;
}

void Task_802B3E4()
{
    SpStage8 *strc8 = TASK_DATA(gCurTask);
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Strc_30055E0 *strc55E0 = &gUnknown_030055E0;
    SpStage74 *strc74;
    SpStageC *temp_r5;
    u16 var_r0;

    temp_r5 = gUnknown_087BF8DC[gUnknown_08487134[gCurrentLevel]];
    if ((strc8->unk6 == 0) && (strc55E0->unk0 != 1)) {
        while (temp_r5[strc8->unk2].unk4 < (I(strc5690->unk8) + 0x300)) {
            if (temp_r5[strc8->unk2].unk8 == 0xFFFF) {
                strc74 = TASK_DATA(TaskCreate(sub_802D33C, sizeof(SpStage74), 0x1F00U, 0U, NULL));
                strc74->unk60 = 1;
                strc74->unk44 = temp_r5[strc8->unk2].unk4 << 8;
                strc8->unk4 = temp_r5[strc8->unk2].unk4;
                strc8->unk2 += 1;
                strc8->unk6 = 1;
                break;
            } else if (temp_r5[strc8->unk2].unk8 == 0x7FFF) {
                strc74 = TASK_DATA(TaskCreate(sub_802D33C, sizeof(SpStage74), 0x1F00U, 0U, NULL));
                strc74->unk60 = 2;
                strc74->unk44 = temp_r5[strc8->unk2].unk4 << 8;
                strc8->unk4 = temp_r5[strc8->unk2].unk4;
                strc8->unk2++;
            } else if (temp_r5[strc8->unk2].unk8 == 0) {
                strc8->unk2++;
            } else {
                strc74 = TASK_DATA(TaskCreate(Task_802BEDC, sizeof(SpStage74), 0x1500U, 0U, NULL));
                strc74->unk60 = temp_r5[strc8->unk2].unk8;
                strc74->unk3C = Q(temp_r5[strc8->unk2].unk0);
                strc74->unk40 = Q(temp_r5[strc8->unk2].unk2);
                strc74->unk44 = Q(temp_r5[strc8->unk2].unk4);
                strc74->unk68 = (s16)strc8->unk2;
                strc74->unk6D = 0xB;
                strc74->unk70 = 0;
                strc8->unk4 = temp_r5[strc8->unk2].unk4;
                strc8->unk2++;
            }
        }
    }
}

void sub_802B5DC(Sprite *s)
{
    s32 i;

    if ((s->graphics.anim != 797) || (s->variant != 0)) {
        for (i = 0; i < (s32)ARRAY_COUNT(gUnknown_030056F0); i++) {
            if ((gUnknown_030056F0[i][0] == s->graphics.anim) && (gUnknown_030056F0[i][1] == s->variant)) {
                s->frameFlags = s->frameFlags | 0xC0000;
                return;
            }
        }

        for (i = 0; i < (s32)ARRAY_COUNT(gUnknown_030056F0); i++) {
            if ((gUnknown_030056F0[i][0] == 0) && (gUnknown_030056F0[i][1] == 0)) {
                gUnknown_030056F0[i][0] = s->graphics.anim;
                gUnknown_030056F0[i][1] = s->variant;
                return;
            }
        }
    }
}

// (97.41%) https://decomp.me/scratch/veYrR
NONMATCH("asm/non_matching/game/sa1/special_stage/sub_802B66C.inc", u32 sub_802B66C(SpStage74 *strc74, Sprite *s, s16 param2, s16 param3))
{
    Sprite *spr55F0 = &gUnknown_030055F0.s;
    Strc_3005690 *strc5690;

    if (s->hitboxes[0].index == -1) {
        return 0U;
    }

    strc5690 = &gUnknown_03005690;
    if ((strc5690->unk8 >= strc74->unk44 - Q(64)) && (strc5690->unk8 <= strc74->unk44)) {
        u16 unk60 = strc74->unk60;
        if ((unk60 >= 4) && ((unk60 < 10) || (unk60 == 0xB))) {
            if (2 & strc5690->unk29) {
                if (HB_COLLISION(param2, param3, s->hitboxes[0].b, I(strc5690->unk0), I(strc5690->unk4), gUnknown_0848720C)) {
                    return TRUE;
                }
            } else if (RECT_COLLISION(param2, param3, &s->hitboxes[0].b, I(strc5690->unk0), I(strc5690->unk4), &gUnknown_08487204)) {
                return TRUE;
            }
        } else {
            if (HB_COLLISION(param2, param3, s->hitboxes[0].b, I(strc5690->unk0), I(strc5690->unk4), spr55F0->hitboxes[0].b)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}
END_NONMATCH

void sub_802B884(void)
{
    u16 temp_r0;

    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    Strc_3005690 *strc5690 = &gUnknown_03005690;

    if (1 & strc74->unk67) {
        return;
    }
    if (1 & strc5690->unk29) {
        return;
    }
    if (strc5690->unk28 == 2) {
        return;
    }
    if (sub_802B66C(strc74, s, strc74->unk48, strc74->unk4A) == 0) {
        return;
    }

    switch (strc74->unk60) {
        case 0: {
            strc74->unk60 = 1;
            strc74->anim62 = gUnknown_0848728C[strc74->unk60][0];
            strc74->variant64 = gUnknown_0848728C[strc74->unk60][1];
            strc74->unk67 |= 1;
            strc74->unk52 = 0;
            strc74->unk54 = 0;
            strc74->unk56 = 0;
            strc74->unk58 = 0;
            strc74->unk5A = 0;
            strc74->unk5C = 0;
            s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
            s->graphics.size = 0;
            s->graphics.anim = strc74->anim62;
            s->variant = strc74->variant64;
            s->prevVariant = -1;
            s->qAnimDelay = 0;
            s->animSpeed = 0x10;
            gSpecialStageCollectedRings += 1;
            SpStage_PlayRingSoundeffect();
            gCurTask->main = sub_802D3E4;
        } break;
        case 3: {
            strc74->unk60 = 1;
            strc74->anim62 = gUnknown_0848728C[strc74->unk60][0];
            strc74->variant64 = gUnknown_0848728C[strc74->unk60][1];
            strc74->unk67 |= 1;
            strc74->unk52 = 0;
            strc74->unk54 = 0;
            strc74->unk58 = 0;
            strc74->unk5A = 0;
            s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
            s->graphics.size = 0;
            s->graphics.anim = strc74->anim62;
            s->variant = strc74->variant64;
            s->prevVariant = -1;
            s->qAnimDelay = 0;
            s->animSpeed = 0x10;
            gSpecialStageCollectedRings += 1;
            SpStage_PlayRingSoundeffect();
            gCurTask->main = sub_802C224;
        } break;

        case 2: {
            strc74->unk67 |= 1;
            if (gUnknown_03005730 == 0) {
                m4aSongNumStart(SE_150);
            }
            sub_802C2DC(strc74);
            sub_802C04C(strc74);
            gCurTask->main = sub_802C488;
            strc5690->unk3D = 0xA;
            strc74->unk6D = 0xB;
        } break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9: {
            strc5690->unk29 = 4 | strc5690->unk29;
            strc5690->unk50 = (u16)strc74->unk68;
            strc5690->unk54 = (u16)strc74->unk60;
        } break;

        case 10: {
            TaskDestroy(gCurTask);
            if (gUnknown_03005730 == 0) {
                m4aSongNumStart(SE_151);
            }
            gUnknown_0300507C += 1;
        } break;

        case 11: {
            strc74->unk60 = 0xC;
            strc74->anim62 = gUnknown_0848728C[strc74->unk60][0];
            strc74->variant64 = gUnknown_0848728C[strc74->unk60][1];
            strc74->unk67 |= 1;
            strc74->unk52 = 0;
            strc74->unk54 = 0;
            strc74->unk56 = 0;
            strc74->unk58 = 0;
            strc74->unk5A = 0;
            strc74->unk5C = 0;

            s->graphics.dest = OBJ_VRAM0 + (gUnknown_084872C4[strc74->unk60] * TILE_SIZE_4BPP);
            s->graphics.size = 0;
            s->graphics.anim = strc74->anim62;
            s->variant = strc74->variant64;
            s->prevVariant = -1;
            s->qAnimDelay = 0;
            s->animSpeed = 0x10;
            strc5690->unk29 |= 8;

            if (gUnknown_03005730 == 0) {
                m4aSongNumStart(SE_EXPLOSION);
            }

            gCurTask->main = sub_802D3E4;
        } break;
    }
}

void sub_802BBF0()
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);

    strc74->unk52 += strc74->unk58;
    strc74->unk54 += strc74->unk5A;
    strc74->unk56 += strc74->unk5C;
    strc74->unk3C += strc74->unk52;
    strc74->unk40 += strc74->unk54;
    strc74->unk44 += strc74->unk56;
}

NONMATCH("asm/non_matching/game/sa1/special_stage/sub_802BC6C.inc", bool32 sub_802BC6C(void))
{
    s32 var_r0;
    s32 var_r4;
    s32 var_r7;
    Strc_3005690 *strc5690 = &gUnknown_03005690;

    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    strc74->unk50 = (s16)I(strc5690->unk8 - strc74->unk44);
    if ((strc74->unk60 != 3) && (strc74->unk50 > 576)) {
        TaskDestroy(gCurTask);
        return 0;
    }

    if (strc74->unk50 > 0xC0) {
        return FALSE;
    }
    if (strc74->unk50 < -Q(3)) {
        return FALSE;
    }

    strc74->unk66 = sub_802D58C(strc74->unk50);
    var_r7 = (strc74->unk50 + 0x300);
    var_r7 >>= 3;
    if (var_r7 == 0) {
        var_r7 = 1;
    }
    var_r7 = (var_r7 * var_r7 * var_r7 * var_r7) / 408;
    var_r4 = var_r7;
    if (var_r7 < 0) {
        var_r4 = var_r7 + 0x1FF;
    }

    strc74->unk48 = ((((var_r4 >> 9) + 0x38) * strc74->unk3C) / 640) >> 8;
    strc74->unk4A = ((((var_r4 >> 9) + 0x38) * strc74->unk40) / 640) >> 8;
    strc74->unk4C = 120 + strc74->unk48;
    strc74->unk4E = 80 - strc74->unk4A;
    strc74->unk4C += gUnknown_03005780.unk4;
    strc74->unk4E -= gUnknown_03005780.unk6;
    s->x = strc74->unk4C;
    s->y = strc74->unk4E;
    tf->x = s->x;
    tf->y = s->y;

    var_r0 = var_r7;
    if (var_r7 < 0) {
        var_r0 = var_r7 + 0x3FF;
    }

    tf->qScaleX = (var_r0 >> 10) + 0x40;
    tf->qScaleY = (var_r0 >> 10) + 0x40;
    s->frameFlags = strc74->unk66 | 0x2020;
    if (tf->qScaleX > 0x100) {
        s->frameFlags |= 0x40;
    }

    var_r0 = ((strc74->unk50 - 0xC0) / 32);
    s->oamFlags = SPRITE_OAM_ORDER(-var_r0);

    return TRUE;
}
END_NONMATCH

// (73.95%) https://decomp.me/scratch/2UCbe
NONMATCH("asm/non_matching/game/sa1/special_stage/sub_802BE0C.inc", void sub_802BE0C(Sprite *s, SpriteTransform *tf))
{
    u16 sp00[8];
    const SpriteOffset *dims;
    s8 temp_r7;
    u32 temp_r1;
    u32 temp_r1_2;
    u16 *affine;

    dims = s->dimensions;
    if (dims != (SpriteOffset *)-1) {
        u16 *ptrSP = &sp00[0];
        *ptrSP++ = tf->qScaleX;
        *ptrSP++ = tf->qScaleY;
        ptrSP = &sp00[7];
        *ptrSP = s->frameFlags & 0x1F;
        temp_r7 = gUnknown_030057E0[*ptrSP];
        if (temp_r7 == 0) {
            gUnknown_030057E0[*ptrSP] = 0xFF;

            affine = (*ptrSP << 4) + &gOamBuffer->all.affineParam;
            affine[0 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, tf->qScaleX);
            affine[1 * OAM_DATA_COUNT_AFFINE] = 0;
            affine[2 * OAM_DATA_COUNT_AFFINE] = 0;
            affine[3 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, tf->qScaleY);
        }
        sp00[2] = tf->x - I((tf->qScaleX * (dims->offsetX - (dims->width >> 1))) + Q((dims->width >> 1)));
        sp00[4] = tf->y - I((tf->qScaleY * (dims->offsetY - (dims->height >> 1))) + Q((dims->height >> 1)));
        s->x = sp00[2];
        s->y = sp00[4];
    }
}
END_NONMATCH

void Task_802BEDC(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s;

    strc74->unk50 = 0;
    strc74->unk52 = 0;
    strc74->unk54 = 0;
    strc74->unk56 = 0;
    strc74->unk58 = 0;
    strc74->unk5A = 0;
    strc74->unk5C = 0;
    strc74->anim62 = gUnknown_0848728C[strc74->unk60][0];
    strc74->variant64 = gUnknown_0848728C[strc74->unk60][1];
    strc74->unk67 = 0;

    s = &strc74->s;
    s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    strc74->unk66 = sub_802D58C((I(gUnknown_03005690.unk8) - I(strc74->unk44)));
    s->x = 120 + I(strc74->unk3C);
    s->y = 80 - I(strc74->unk40);
    s->oamFlags = 0x7C0;
    s->palId = 0;
    s->frameFlags = strc74->unk66 | 0x2020;

    strc74->tf.rotation = 0;
    strc74->tf.qScaleX = Q(0.25);
    strc74->tf.qScaleY = Q(0.25);
    strc74->tf.x = s->x;
    strc74->tf.y = s->y;
    gCurTask->main = Task_802D37C;
    sub_802B5DC(s);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, &strc74->tf);
}

void sub_802C04C(SpStage74 *strc74)
{
    s32 var_r6;
    SpStage74 *newStrc74;

    for (var_r6 = 0; var_r6 < 12; var_r6++) {
        newStrc74 = TASK_DATA(TaskCreate(Task_802BEDC, sizeof(SpStage74), 0x1510U, 0U, NULL));
        newStrc74->unk60 = 3;
        newStrc74->unk3C = (strc74->unk3C + (gUnknown_084872E0[var_r6][0] << 6));
        newStrc74->unk40 = (strc74->unk40 + (gUnknown_084872E0[var_r6][1] << 6));
        newStrc74->unk44 = strc74->unk44;
        newStrc74->unk68 = strc74->unk68;
        newStrc74->unk70 = 0xF;
    }
}

void sub_802C0CC(void)
{
    s16 temp_r1_3;
    s32 temp_r1_2;
    s16 temp_r0_3;
    u16 var_r2;
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;
    s16 theta;
    s16 x, y;
    s32 v0, v1;

    x = (strc5690->unkC - strc74->unk4C);
    y = (strc5690->unkE - strc74->unk4E);

    theta = SA2_LABEL(sub_8004418)(y, x);
    strc74->unk52 += 0x15;
    v0 = (strc74->unk52 * COS(theta));
    v1 = (SIN(theta));
    strc74->unk3C += v0 >> 14;
    strc74->unk40 -= (strc74->unk52 * v1) >> 14;
    strc74->unk5C = I(strc5690->unk8 - strc74->unk44);
    temp_r0_3 = strc74->unk56 + strc74->unk5C;

    if (temp_r0_3 >= 0) {
        if (temp_r0_3 > Q(14)) {
            temp_r0_3 = Q(14);
        }
    } else if (temp_r0_3 < -Q(14)) {
        temp_r0_3 = -Q(14);
    }

    strc74->unk56 = temp_r0_3;
    strc74->unk44 += strc74->unk56;
    if ((strc5690->unk8 + 0x100) < strc74->unk44) {
        strc74->unk44 = strc5690->unk8;
    }
    if (sub_802BC6C() != 0) {
        if (strc74->unk70 != 0) {
            strc74->unk70 -= 1;
        } else {
            sub_802B884();
        }
        sub_802B5DC(s);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802C224(void)
{
    s16 temp_r1_3;
    s32 temp_r1_2;
    s16 temp_r0_3;
    u16 var_r2;
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;
    s16 theta;
    s16 x, y;
    s32 v0, v1;

    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        gCurTask->main = sub_802D450;
        return;
    }

    strc74->unk5C = I(strc5690->unk8 - strc74->unk44);

    temp_r0_3 = strc74->unk56 + strc74->unk5C;
    if (temp_r0_3 >= 0) {
        if (temp_r0_3 > Q(14)) {
            temp_r0_3 = Q(14);
        }
    } else if (temp_r0_3 < -Q(14)) {
        temp_r0_3 = -Q(14);
    }

    strc74->unk56 = temp_r0_3;
    strc74->unk44 += strc74->unk56;
    if ((strc5690->unk8 + 0x100) < strc74->unk44) {
        strc74->unk44 = strc5690->unk8;
    }
    if (sub_802BC6C() != 0) {
        sub_802B5DC(s);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802C2DC(SpStage74 *strc74)
{
    s32 i;
    SpStage74 *newStrc74;
    Sprite *s;

    for (i = 0; i < 8; i++) {
        newStrc74 = TASK_DATA(TaskCreate(sub_802D3E4, sizeof(SpStage74), 0x1510U, 0U, NULL));
        newStrc74->unk60 = 0xD;
        newStrc74->unk3C = (strc74->unk3C + Q(gUnknown_08487310[i][0]));
        newStrc74->unk40 = (strc74->unk40 + Q(gUnknown_08487310[i][1]));
        newStrc74->unk44 = strc74->unk44;
        newStrc74->unk50 = 0;
        newStrc74->unk52 = (u16)gUnknown_08487310[i][0] * 8;
        newStrc74->unk54 = (u16)gUnknown_08487310[i][1] * 8;
        newStrc74->unk56 = 0;
        newStrc74->unk58 = 0 - (newStrc74->unk52 / 32);
        newStrc74->unk5A = 0 - (newStrc74->unk54 / 32);
        newStrc74->unk5C = 0;
        newStrc74->anim62 = gUnknown_0848728C[newStrc74->unk60][0];
        newStrc74->variant64 = gUnknown_0848728C[newStrc74->unk60][1];
        newStrc74->unk66 = strc74->unk66;
        newStrc74->unk67 = 1;
        s = &newStrc74->s;
        s->graphics.dest = ((gUnknown_084872C4[newStrc74->unk60] << 5) + OBJ_VRAM0);
        s->graphics.size = 0;
        s->graphics.anim = newStrc74->anim62;
        s->variant = newStrc74->variant64;
        s->prevVariant = 0xFF;
        s->qAnimDelay = 0;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->frameFlags = (newStrc74->unk66 | 0x2020);
        s->oamFlags = SPRITE_OAM_ORDER(31);
    }
}

void sub_802C488()
{
    u16 var_r0;
    u8 *temp_r1;
    u8 *temp_r3;
    u8 temp_r0_2;

    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;

    s = &strc74->s;
    if (--strc74->unk6D == 0) {
        strc74->unk6D = 60;
        if (gUnknown_03005690.unk28 == 4) {
            strc74->anim62 = SA1_ANIM_SP_STAGE_FEEDBACK_MESSAGES;
            strc74->variant64 = 1;
        } else {
            strc74->anim62 = SA1_ANIM_SP_STAGE_FEEDBACK_MESSAGES;
            strc74->variant64 = 2;
        }

        sub_802D6FC__inline(strc74, s);
        s->x = 120;
        s->y = 40;
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        gCurTask->main = sub_802D4C4;
    }
}

static void CreateCheckpointMessage(u8 msg)
{
    Sprite *s;
    u8 *temp_r1;
    u8 var_r0;

    SpStage74 *strc74 = TASK_DATA(TaskCreate(sub_802D4C4, 0x74U, 0x1500U, 0U, NULL));
    s = &strc74->s;

    switch (msg) {
        case 0:
            // "COOL!"
            s->y = 40;
            strc74->anim62 = SA1_ANIM_SP_STAGE_PLAYER_SPEECH;
            strc74->variant64 = (u16)msg;
            strc74->unk60 = 5;
            strc74->unk6D = 0xB4;
            break;
        case 1:
            // "AAARGH!"
            s->y = 40;
            strc74->anim62 = SA1_ANIM_SP_STAGE_PLAYER_SPEECH;
            strc74->variant64 = (u16)msg;
            strc74->unk60 = 5;
            strc74->unk6D = 0xB4;
            break;
        case 2:
            // "Not enough rings..."
            s->y = 136;
            strc74->anim62 = SA1_ANIM_SP_STAGE_FEEDBACK_MESSAGES;
            strc74->variant64 = 0;
            strc74->unk60 = (u16)msg;
            strc74->unk6D = 0x78;
            break;
    }

    s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = 0x10;
    s->x = 120;
    s->oamFlags = 0x40;
    s->frameFlags = 0x2000;
    s->palId = 0;
    s->animCursor = 0;
    s->hitboxes[0].index = -1;
}

void sub_802C6C4()
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s;
    SpriteTransform *tf;

    strc74->unk50 = 0;
    strc74->unk52 = gUnknown_08487330[strc74->unk6A][0];
    strc74->unk54 = gUnknown_08487330[strc74->unk6A][1];
    strc74->unk56 = 0x800;
    strc74->unk58 = -(strc74->unk52 / 32);
    strc74->unk5A = -(strc74->unk54 / 32);
    strc74->unk5C = -(strc74->unk56 / 64);
    strc74->anim62 = gUnknown_0848728C[0][0];
    strc74->variant64 = gUnknown_0848728C[0][1];
    strc74->unk67 = 0;
    strc74->unk66 = sub_802D58C(I(gUnknown_03005690.unk8) - I(strc74->unk44));

    s = &strc74->s;
    s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = 0x10;
    s->x = 120 + I(strc74->unk3C);
    s->y = +80 - I(strc74->unk40);
    s->oamFlags = 0x180;
    s->qAnimDelay = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = strc74->unk66 | 0x2020;

    tf = &strc74->tf;
    tf->rotation = 0;
    tf->qScaleX = 0x100;
    tf->qScaleY = 0x100;
    tf->x = s->x;
    tf->y = s->y;

    gCurTask->main = sub_802C89C;

    sub_802B5DC(s);
    UpdateSpriteAnimation(s);
    sub_802BE0C(s, tf);
}

void sub_802C89C()
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    strc74->unk58 = -(strc74->unk52 / 32);
    strc74->unk5A = -(strc74->unk54 / 32);

    sub_802BBF0();

    if (sub_802BC6C() != 0) {
        sub_802B5DC(s);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);

        if (1 & strc74->unk6C++) {
            DisplaySprite(s);
        }
    }
}

void sub_802C934(void)
{
    s32 sp4;
    SpStageC *element;
    Sprite *s;
    u16 var_r4;
    u32 allocSize;
    u8 var_r2;
    u8 *temp_r6;
    SpStage40 *strc40;

    element = gUnknown_087BF8DC[gUnknown_08487134[gCurrentLevel]];
    var_r4 = 0;
    for (var_r2 = 0; var_r2 < 16; var_r2++) {
        while (((u32)(var_r2 << 12) > (element[var_r4].unk4 + 0x300))) {
            if (element[var_r4].unk8 == 0xFFFF) {
                break;
            }

            var_r4 += 1;
        }
        gUnknown_03005840[var_r2] = var_r4;
    }

    allocSize = ((var_r4 >> 3) + 4) & 0xFFFC;
    temp_r6 = EwramMalloc(allocSize);
    DmaFill32(3, 0, temp_r6, allocSize);
    strc40 = TASK_DATA(TaskCreate(UpdateObjectsAndRender, sizeof(SpStage40), 0x1300U, 0U, TaskDestructor_802D578));
    strc40->mem = temp_r6;
    s = &strc40->s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x800;
    s->oamFlags = 0x500;
    s->graphics.size = 0;
    s->graphics.anim = 0x31B;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2030;
}

// (77.44%) https://decomp.me/scratch/inpcX
// This function loads all objects' positions, scales and renders them
// and the player character, and checks the collision between them.
// NOTE(Jace): I think the loops in this should have the same layout as sub_802D58C().
NONMATCH("asm/non_matching/game/sa1/special_stage/UpdateObjectsAndRender.inc", void UpdateObjectsAndRender(void))
{
    u16 sp4;
    SpStageC *sp8;
    Strc_3005690 *strc5690;
    SpStage40 *strc40;
    SpriteTransform *tf;
    const SpriteOffset *sp18;
    u8 *sp1C;
    u8 sp20;
    s32 sp24;
    s32 sp28;
    s32 sp2C;
    s32 sp34;
    s32 sp38;
    u16 *sp3C;
    u32 sp40;
    OamData *temp_r0_9;
    OamData *temp_r5_4;
    s16 temp_r0_6;
    s16 temp_r2_6;
    s16 temp_r3_6;
    s32 temp_r0_3;
    s32 temp_r1;
    s32 temp_r3;
    s32 temp_r4_3;
    s32 var_r0_2;
    s32 var_r6;
    s8 *temp_r1_7;
    s8 temp_r3_4;
    s8 temp_r6;
    s8 temp_r6_2;
    u16 *temp_r0_11;
    u16 *temp_r4_6;
    u16 temp_r0_2;
    u16 temp_r1_2;
    u16 temp_r2_7;
    u16 var_sb;
    u32 temp_r0_7;
    u32 temp_r0_8;
    u32 temp_r2_5;
    u8 var_r2;
    u8 var_r2_2;
    u16 *temp_r5_2;
    u16 *temp_r2;
    u8 vall;

    Sprite *spr55F0;
    Sprite *spr74;
    Sprite *s;
    SpStage74 *strc74;
    s16 someX, someY;

    strc40 = TASK_DATA(gCurTask);
    sp8 = gUnknown_087BF8DC[gUnknown_08487134[gCurrentLevel]];
    strc5690 = &gUnknown_03005690;
    spr55F0 = &gUnknown_030055F0.s;
    s = &strc40->s;
#if 1
    sp20 = 0;
    DmaFill16(3, INT16_MAX, gUnknown_03005670, 0x20);
    DmaFill16(3, 0, gUnknown_030057E0, 0x10);
    sp1C = strc40->mem;
#else
    sp20 = 0;
    sp1C = strc40->mem;
#endif
    UpdateSpriteAnimation(s);
    sp18 = s->dimensions;
    temp_r3 = (I(strc5690->unk8) + 0x300);
    vall = (temp_r3 >> 0xC);
    var_sb = gUnknown_03005840[vall];
    sp34 = I(strc5690->unk8) - 0xC0;
    sp3C = &sp4;
    while (sp8[var_sb].unk4 < temp_r3) {
        if (((sp8[var_sb].unk8 != 0xFFFF) && !(sp8[var_sb].unk8 != 0)) || (sp8[var_sb].unk4 < sp34)
            || (((((uintptr_t)(strc40 + (var_sb >> 3)) >> (7 & var_sb)) & 1) != 0))) {
            u8 *ptrU8;
            s32 valR3;
            sp24 = Q(sp8[var_sb].unk0);
            sp28 = Q(sp8[var_sb].unk2);
            sp2C = Q(sp8[var_sb].unk4);
            temp_r0_2 = I(strc5690->unk8) - sp8[var_sb].unk4;
            var_r6 = (s32)((s16)temp_r0_2 + 0x300) >> 3;
            if (var_r6 == 0) {
                var_r6 = 1;
            }
            temp_r0_3 = (s32)(var_r6 * (var_r6 * var_r6) * var_r6) / 408;
            temp_r4_3 = (temp_r0_3 / 512) + 0x38;
            someX = ((temp_r4_3 * sp24) / 640) >> 8;
            someY = ((temp_r4_3 * sp28) / 640) >> 8;
            if (!(1 & strc5690->unk29) && (strc5690->unk28 != 2) && (I(strc5690->unk8) >= (s32)(I(sp2C) - 32))
                && (I(strc5690->unk8) <= I(sp2C))
                && HB_COLLISION(someX, someY, s->hitboxes[0].b, I(strc5690->unk0), I(strc5690->unk4), spr55F0->hitboxes[0].b)) {
                strc74 = TASK_DATA(TaskCreate(sub_802D3E4, sizeof(SpStage74), 0x1500U, 0U, NULL));
                strc74->unk60 = 1;
                strc74->unk3C = sp24;
                strc74->unk40 = sp28;
                strc74->unk44 = sp2C;
                strc74->unk50 = 0;
                strc74->unk52 = 0;
                strc74->unk54 = 0;
                strc74->unk56 = 0;
                strc74->unk58 = 0;
                strc74->unk5A = 0;
                strc74->unk5C = 0;
                strc74->anim62 = gUnknown_0848728C[strc74->unk60][0];
                strc74->variant64 = gUnknown_0848728C[strc74->unk60][1];

                valR3 = temp_r0_2;
                for (var_r2_2 = 0; var_r2_2 < 16; var_r2_2++) {
                    if (gUnknown_03005670[var_r2_2] == INT16_MAX) {
                        gUnknown_03005670[var_r2_2] = valR3;
                        break;
                    }

                    if (gUnknown_03005670[var_r2_2] == valR3) {
                        break;
                    }
                }

                strc74->unk66 = var_r2_2 + 1;
                strc74->unk67 = 1;
                spr74 = &strc74->s;
                spr74->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
                spr74->graphics.size = 0;
                spr74->graphics.anim = strc74->anim62;
                spr74->variant = strc74->variant64;
                spr74->prevVariant = -1;
                spr74->qAnimDelay = 0;
                spr74->animSpeed = 0x10;
                spr74->qAnimDelay = 0;
                spr74->animSpeed = 0x10;
                spr74->palId = 0;
                spr74->frameFlags = strc74->unk66 | 0x2020;
                spr74->oamFlags = 0x7C0;
                gSpecialStageCollectedRings += 1;
                SpStage_PlayRingSoundeffect();
                sp1C[var_sb >> 3] |= 1 << (var_sb & 7);
                var_sb++;
            } else {
                for (var_r2 = 0; var_r2 < 16; var_r2++) {
                    if ((u16)gUnknown_03005670[var_r2] == INT16_MAX) {
                        gUnknown_03005670[var_r2] = temp_r0_2;
                        break;
                    }

                    if (gUnknown_03005670[var_r2] == temp_r0_2) {
                        break;
                    }
                }

                var_r2++;
                strc40->tf.x = (120 + someX + gUnknown_03005780.unk4);
                strc40->tf.y = ((+80 - gUnknown_03005780.unk6) - someY);
                strc40->tf.qScaleX = (temp_r0_3 / 1024) + 64;
                strc40->tf.qScaleY = (temp_r0_3 / 1024) + 64;
                s->frameFlags = 0x2020 | var_r2;
                if (strc40->tf.qScaleX > Q(1)) {
                    s->frameFlags |= 0x40;
                }
                s->x = strc40->tf.x - I((strc40->tf.qScaleX * (sp18->offsetX - (sp18->width >> 1))) + ((sp18->width >> 1) << 8));
                s->y = strc40->tf.y - I((strc40->tf.qScaleY * (sp18->offsetY - (sp18->height >> 1))) + ((sp18->height >> 1) << 8));
                if ((sp20 == 0) || (s->oamBaseIndex == 0xFF)) {
                    s->oamBaseIndex = 0xFF;
                    sp3C[0] = s->frameFlags & 0x1F;
                    if (gUnknown_030057E0[sp3C[0]] == 0) {
                        gUnknown_030057E0[sp3C[0]] = -1;
                        temp_r5_2 = (u16 *)(&gOamBuffer[sp3C[0] * 4]);
                        temp_r5_2[0 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, strc40->tf.qScaleX);
                        temp_r5_2[1 * OAM_DATA_COUNT_AFFINE] = 0;
                        temp_r5_2[2 * OAM_DATA_COUNT_AFFINE] = 0;
                        temp_r5_2[3 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, strc40->tf.qScaleY);
                    }
                    DisplaySprite(s);
                    var_sb++;
                    sp20++;
                } else {
                    if (s->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                        s->x -= (sp18->width >> 1);
                        s->y -= (sp18->height >> 1);
                    }
                    sp3C[0] = s->frameFlags & 0x1F;
                    if (gUnknown_030057E0[sp3C[0]] == 0) {
                        gUnknown_030057E0[sp3C[0]] = -1;
                        temp_r5_2 = (u16 *)(&gOamBuffer[sp3C[0] * 4]);
                        temp_r5_2[0 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, strc40->tf.qScaleX);
                        temp_r5_2[1 * OAM_DATA_COUNT_AFFINE] = 0;
                        temp_r5_2[2 * OAM_DATA_COUNT_AFFINE] = 0;
                        temp_r5_2[3 * OAM_DATA_COUNT_AFFINE] = Div(0x10000, strc40->tf.qScaleY);
                    }
                    temp_r5_2 = (u16 *)&gOamMallocBuffer[s->oamBaseIndex];
                    temp_r0_9 = OamMalloc(((s->oamFlags & 0x7C0) >> 6));
                    if (iwram_end == temp_r0_9) {
                        break;
                    }

                    DmaCopy16(3, temp_r5_2, temp_r0_9, sizeof(OamDataShort));

                    temp_r0_9->all.attr0 &= 0xFD00;
                    temp_r0_9->all.attr1 &= 0xC000;
                    temp_r0_9->all.attr0 |= (u8)s->y | ((s->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) * 8);
                    temp_r0_9->all.attr1 |= ((u16)s->x & 0x1FF) | ((s->frameFlags & 0x1F) << 9);
                    var_sb++;
                    sp20++;
                }
            }
        } else {
            break;
        }
        // continue
    }
    // return
}
END_NONMATCH

void sub_802D158(void)
{
    TaskCreate(Task_SpStageInitializeSomethingAndStartMusic, 0, 0x1000, 0, NULL);
    TaskCreate(sub_802D680, 0, 0x1000, 0, NULL);
}

void sub_802D190(void)
{
    u8 *character;
    u16 charId = gSelectedCharacter;
    sub_8029E0C(charId);
    sub_8029EA8(charId);

    character = TASK_DATA(TaskCreate(Task_802A560, sizeof(u8), 0x1100, 0, NULL));
    *character = charId;
}

void sub_802D1D8(void)
{
    Task *t = TaskCreate(Task_802B3E4, sizeof(SpStage8), 0x1400, 0, NULL);
    SpStage8 *strc8 = TASK_DATA(t);
    strc8->unk2 = 0;
    strc8->unk4 = 0;
    strc8->unk6 = 0;
}

void Task_SpStageInitializeSomethingAndStartMusic(void)
{
    gUnknown_030055E0.unk0 = 0;
    gUnknown_030055E0.unk2 = 240;
    gUnknown_030055E0.qBlend = Q(0);

    gCurTask->main = Task_802D238;

    m4aSongNumStart(MUS_SPECIAL_STAGE);
}

void Task_802D238(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;

    if (--gUnknown_030055E0.unk2 <= 0) {
        gCurTask->main = Task_80299B0;

        strc5690->unk29 &= ~0x1;

        sub_802D560();
    }
}

void sub_802D274(void)
{
    if (--gUnknown_030055E0.unk2 <= 0) {
        gStageFlags |= 0x20;
        gCurTask->main = Task_8029AC4;
    }
}

void sub_802D2A8(void) { gDispCnt |= DISPCNT_OBJ_ON | ((~DISPCNT_BG0_ON) & DISPCNT_BG_ALL_ON); }

void Task_802D2BC(void)
{
    Strc_3005780 *strc5780 = &gUnknown_03005780;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    strc5780->unk12 = 0;
    strc5780->unk13 = 8;
    sub_8029CDC();
    gCurTask->main = sub_8029CDC;
}

void nullsub_802D2F0(void) { }

u16 sub_802D2F4(Strc_3005690 *param0)
{
    s32 temp_r2;
    s32 temp_r2_2;
    u16 var_r0;
    u16 var_r1;

    temp_r2 = param0->unk0;
    if (temp_r2 < -Q(40)) {
        var_r1 = 1;
    } else if (temp_r2 <= +Q(40)) {
        var_r1 = 2;
    } else {
        var_r1 = 3;
    }

    if (param0->unk4 < +Q(30)) {
        if (param0->unk4 > -Q(30)) {
            var_r1 += 3;
        } else {
            var_r1 += 6;
        }
    }

    return var_r1;
}

void sub_802D33C(void)
{
    Strc_3005690 *strc5690 = &gUnknown_03005690;
    Strc_30055E0 *strc55E0 = &gUnknown_030055E0;
    SpStage74 *strc74 = TASK_DATA(gCurTask);

    if (strc5690->unk8 >= strc74->unk44) {
        strc55E0->unk0 = strc74->unk60;
        TaskDestroy(gCurTask);
    }
}

void Task_802D37C(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    sub_802D464();
    sub_802BBF0();
    if (sub_802BC6C() != 0) {
        if (strc74->unk70 != 0) {
            strc74->unk70 -= 1;
        } else {
            sub_802B884();
        }
        sub_802B5DC(s);
        UpdateSpriteAnimation(s);
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802D3E4(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    sub_802BBF0();
    if (sub_802BC6C() != 0) {
        if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
            gCurTask->main = sub_802D450;
            return;
        }
        sub_802B5DC(s);
        if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
            gCurTask->main = sub_802D450;
        }
        sub_802BE0C(s, tf);
        DisplaySprite(s);
    }
}

void sub_802D450(void) { TaskDestroy(gCurTask); }

void sub_802D464(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    SpStage74 *parent = TASK_DATA(TASK_PARENT(gCurTask));

    if (strc74->unk60 == 3) {
        if (parent->unk6D != 0) {
            if (gUnknown_03005690.unk28 == 4) {
                gCurTask->main = sub_802C0CC;
                strc74->unk52 = -Q(3);
            }
        } else {
            strc74->unk60 = 0;
        }
    }
}

void sub_802D4C4(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (--strc74->unk6D == 0) {
        gCurTask->main = sub_802D66C;
    }
}

void Task_802D508(void)
{
    SpStage74 *strc74 = TASK_DATA(gCurTask);
    Sprite *s = &strc74->s;
    SpriteTransform *tf = &strc74->tf;

    if (strc74->unk6E > -160) {
        strc74->unk6E--;
        sub_802BBF0();

        if (sub_802BC6C() != 0) {
            s->oamFlags = SPRITE_OAM_ORDER(5);
            UpdateSpriteAnimation(s);
            sub_802BE0C(s, tf);
            DisplaySprite(s);
        }
    }
}

void sub_802D560(void)
{
    s32 var_r1;
    u16(*var_r0)[2];

    var_r0 = gUnknown_030056F0;
    for (var_r1 = 0; var_r1 < 16; var_r1++) {
        var_r0[var_r1][0] = 0;
        var_r0[var_r1][1] = 0;
    }
}

void TaskDestructor_802D578(Task *t)
{
    SpStage40 *strc40 = TASK_DATA(t);
    EwramFree(strc40->mem);
}

u8 sub_802D58C(s16 param0)
{
    u8 var_r3;
    for (var_r3 = 0; var_r3 < 16; var_r3++) {
        if (gUnknown_03005670[var_r3] == INT16_MAX) {
            gUnknown_03005670[var_r3] = param0;
            break;
        }

        if (gUnknown_03005670[var_r3] == param0) {
            break;
        }
    }

    var_r3++;

    return var_r3;
}

void SpStage_PlayRingSoundeffect(void)
{
    if (1 & gSpecialStageCollectedRings) {
        MPlayStart(&gMPlayInfo_SE2, &se_ring_copy);
        m4aMPlayImmInit(&gMPlayInfo_SE2);
        m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFFU, 0x80U);
        m4aMPlayPanpotControl(&gMPlayInfo_SE2, 0xFFFFU, -0x40);
    } else {
        MPlayStart(&gMPlayInfo_SE1, &se_ring_copy);
        m4aMPlayImmInit(&gMPlayInfo_SE1);
        m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFFU, 0x80U);
        m4aMPlayPanpotControl(&gMPlayInfo_SE1, 0xFFFFU, 0x40);
    }
}

void sub_802D66C(void) { TaskDestroy(gCurTask); }

void sub_802D680(void)
{
    if (!(0x20 & gStageFlags) && (START_BUTTON & gPressedKeys) && !(0x40 & gStageFlags)) {
        CreatePauseMenu();
    }
}

void sub_802D6B4(Strc_3005690 *strc5690)
{
    if ((strc5690->unk42 & gPlayerControls.jump) && !(1 & strc5690->unk29)) {
        strc5690->unk20 = 0x100;
    } else {
        if (!(2 & strc5690->unk29)) {
            strc5690->unk20 = 0;
        } else {
            strc5690->unk20 = 0xFF00;
        }
    }
}

void sub_802D6FC(SpStage74 *strc74, Sprite *s)
{
    u8 *temp_r1;

    s->graphics.dest = (gUnknown_084872C4[strc74->unk60] << 5) + OBJ_VRAM0;
    s->graphics.size = 0;
    s->graphics.anim = strc74->anim62;
    s->variant = strc74->variant64;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
}
