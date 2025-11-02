#include "core.h"
#include "task.h"
#include "sprite.h"
#include "trig.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/bosses/final_intro.h"

#include "game/math.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/stage.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"
#include "constants/zones.h"

typedef struct {
    u8 cameraY;
    u32 animFrame;
    u32 unk8;
    u16 unkC;
    s8 unkE;
    s8 unkF;
    u8 unk10[32];
    s32 birdPositions[32][2];
    s16 birdSpeeds[32][2];
    u8 unk1B0;
    s32 unk1B4;
    s32 unk1B8;

    Sprite vanillaSprite;
    Sprite birdSprites[3];
} TrueArea53Intro; /* size 0x27C */

typedef struct {
    u8 unk0[8];
    u16 orbitSpeeds[7];
    u32 orbitPositions[7];
    u32 animFrame;
    Sprite emerald[7];
    Background background;
} OrbitingEmeraldsSequence;

typedef struct {
    u16 animFrame;
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;
    Sprite s;
} SuperSonicSpark;

typedef struct {
    u8 character;
    u8 sequence;
    u16 animFrame;

    s32 unk4;

    s32 x;
    s32 y;

    s16 speedX;
    s16 speedY;

    Sprite s;
    Sprite ssGroundEffectSprite;
} IntroActor;

typedef struct {
    Background bg1;
    Background bg2;
    Background bg3;
} WorldBackgrounds;

void Task_IntroPanIn(void);
void CreateBackgrounds(void);
void CreateSkipHandler(void);
void sub_8038C34(void);
void sub_8038CD8(void);

void sub_8038D7C(void);
void sub_80399CC(void);

void sub_8038EE4(void);
void sub_8038FBC(void);
void sub_8039084(void);
void sub_8039144(void);
void sub_8039208(void);
void sub_8039A10(void);
void IntroRenderSprites(u8);
void sub_80393A4(void);

// TODO: Include these through Boss's header
void SetupEggmanKidnapsVanillaTask(void);
void sub_8050B2C(s32 *, s32 *);

void CreateActor(u8);
void Task_SkipHandlerMain(void);
void sub_8039AD4(void);
void sub_8039A38(void);
void sub_8038B6C(void);
void sub_8038AA0(void);
void sub_80399A4(void);
void sub_803893C(void);
void sub_8038898(void);
void sub_80387F4(void);
void sub_803872C(void);
void sub_8038664(void);
void sub_803997C(void);
void sub_8038500(void);
void sub_803845C(void);
void sub_80383B8(void);
void sub_80382F0(void);
void sub_8038238(void);
void sub_8038168(void);
void sub_8037F68(void);
void sub_8037E08(void);
void sub_8037CEC(void);
void sub_8037BD0(void);
void sub_8037B04(void);
void sub_8037A38(void);
void sub_803796C(void);
void sub_80378BC(void);
void sub_8037818(void);
void sub_8037744(void);
void Task_OrbitingEmeraldsContractAndFadeScreenWhite(void);
void Task_OrbitingEmeraldsRotate(void);
void Task_OrbitingEmeraldsMoveOutwards(void);
void Task_DisplaySonicSonicArtworkAndDestroyTask(void);
void Task_SuperSonicSpark(void);
void Task_ActorSonicSlowDownTilStop(void);

void Task_ActorSonicRunIn(void);
void sub_80380B0(void);
void sub_80385A4(void);
void sub_80389E0(void);
void sub_8038E20(void);

#define ACTOR_CHEESE 4

#define NEXT_SEQUENCE_ANIM(actor, s)                                                                                                       \
    ({                                                                                                                                     \
        const TileInfoPtr *animSet, *tileInfo;                                                                                             \
        (actor)->animFrame = gUnknown_080D7704[(actor)->character][++(actor)->sequence];                                                   \
                                                                                                                                           \
        animSet = gUnknown_080D76F0[(actor)->character];                                                                                   \
        tileInfo = &animSet[(actor)->sequence];                                                                                            \
                                                                                                                                           \
        (s)->graphics.anim = tileInfo->anim;                                                                                               \
        (s)->variant = tileInfo->variant;                                                                                                  \
        (s)->prevVariant = -1;                                                                                                             \
    })

#define OBJ_RENDER_SPRITE(obj, s)                                                                                                          \
    ({                                                                                                                                     \
        (s)->x = I((obj)->x);                                                                                                              \
        (s)->y = I((obj)->y) - gCamera.y;                                                                                                  \
        UpdateSpriteAnimation(s);                                                                                                          \
        DisplaySprite(s);                                                                                                                  \
    })

#define OBJ_UPDATE_POS(obj)                                                                                                                \
    ({                                                                                                                                     \
        (obj)->x += (obj)->speedX;                                                                                                         \
        (obj)->y += (obj)->speedY;                                                                                                         \
    })

#define OBJ_ACCELERATE_Y(obj, val)                                                                                                         \
    ({                                                                                                                                     \
        (obj)->speedY += (val);                                                                                                            \
        if ((val) < 0 && (obj)->speedY < 0) {                                                                                              \
            (obj)->speedY = 0;                                                                                                             \
        }                                                                                                                                  \
    })

#define OBJ_ACCELERATE_X(obj, val)                                                                                                         \
    ({                                                                                                                                     \
        (obj)->speedX += (val);                                                                                                            \
        if ((val) < 0 && (obj)->speedX < 0) {                                                                                              \
            (obj)->speedX = 0;                                                                                                             \
        }                                                                                                                                  \
    })

static const TileInfoPtr gUnknown_080D7540[] = {
    { OBJ_VRAM0 + 0x4000, 839, 0 },
    { OBJ_VRAM0 + 0x4000, 839, 1 },
    { OBJ_VRAM0 + 0x3800, 838, 0 },
    { OBJ_VRAM0 + 0x3C00, 838, 1 },
};

static const TileInfoPtr gUnknown_080D7560[] = {
    { OBJ_VRAM0, 844, 0 },
    { OBJ_VRAM0 + 0x800, SA2_ANIM_ANIMAL_ROBIN, 0 },
    { OBJ_VRAM0 + 0x920, SA2_ANIM_ANIMAL_PEACOCK, 0 },
    { OBJ_VRAM0 + 0xA40, SA2_ANIM_ANIMAL_PARROT, 0 },
    { OBJ_VRAM0, 844, 1 },
};

static const TileInfoPtr gUnknown_080D7588[] = {
    { OBJ_VRAM0, 9, 2 }, { NULL, 9, 1 },   { NULL, 835, 0 }, { NULL, 835, 1 }, { NULL, 835, 2 }, { NULL, 835, 3 },
    { NULL, 835, 5 },    { NULL, 835, 5 }, { NULL, 836, 0 }, { NULL, 836, 1 }, { NULL, 836, 2 }, { NULL, 836, 3 },
};
static const TileInfoPtr gUnknown_080D75E8[] = {
    { OBJ_VRAM0 + 0x1000, 191, 2 },
    { NULL, 191, 1 },
    { NULL, 842, 0 },
    { NULL, 842, 1 },
    { NULL, 842, 2 },
    { NULL, 842, 3 },
    { NULL, 842, 4 },
    { NULL, 842, 4 },
};
static const TileInfoPtr gUnknown_080D7628[] = {
    { OBJ_VRAM0 + 0x1800, 282, 2 },
    { NULL, 282, 1 },
    { NULL, 834, 0 },
    { NULL, 834, 1 },
    { NULL, 834, 2 },
    { NULL, 834, 3 },
    { NULL, 834, 4 },
    { NULL, 834, 4 },
};
static const TileInfoPtr gUnknown_080D7668[] = {
    { OBJ_VRAM0 + 0x800, 840, 2 },
    { NULL, 840, 1 },
    { NULL, 840, 0 },
    { NULL, 841, 0 },
    { NULL, 841, 1 },
    { NULL, 841, 2 },
    { NULL, 841, 3 },
    { NULL, 841, 4 },
    { NULL, 841, 4 },
};
static const TileInfoPtr gUnknown_080D76B0[] = {
    { OBJ_VRAM0 + 0x2800, SA2_ANIM_CHEESE_SIDEWAYS, 0 },
    { NULL, SA2_ANIM_CHEESE_SIDEWAYS, 0 },
    { NULL, 843, 0 },
    { NULL, SA2_ANIM_CHEESE_SHOCKED, 0 },
    { NULL, SA2_ANIM_CHEESE_SHOCKED, 1 },
    { NULL, 843, 1 },
    { NULL, 843, 2 },
    { NULL, 843, 2 },
};

static const TileInfoPtr *const gUnknown_080D76F0[] = {
    gUnknown_080D7588, gUnknown_080D7668, gUnknown_080D75E8, gUnknown_080D7628, gUnknown_080D76B0,
};

static const u16 gUnknown_080D7704[][17] = {
    { 225, 55, 5, 170, 110, 360, 180, 120, 60, 80, 20, 160, 60, 80, 180, 60, 60 },
    { 76, 30, 10, 210, 350, 640, 60, 60, 80, 180, 60, 60, 80, 180, 60, 60, 60 },
    { 240, 30, 70, 320, 530, 200, 60, 60, 80, 180, 60, 60, 80, 180, 60, 60, 60 },
    { 220, 50, 70, 320, 530, 200, 60, 60, 80, 180, 60, 60, 80, 180, 60, 60, 60 },
    { 70, 60, 240, 100, 150, 780, 60, 60, 80, 180, 60, 60, 80, 180, 60, 60, 60 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

static const s32 gUnknown_080D77D0[][4] = {
    { Q(-344), Q(178), Q(2), Q(0) }, { Q(-4), Q(178), Q(2), Q(0) },  { Q(-406), Q(178), Q(2), Q(0) },
    { Q(-388), Q(178), Q(2), Q(0) }, { Q(-14), Q(158), Q(2), Q(0) }, { Q(0), Q(0), Q(0), Q(0) },
};

static const s16 gUnknown_080D7830[][5] = {
    { 120, 85, 5, 6, 0 },  { 130, 90, 4, 5, 1 },  { 140, 95, 7, 4, 2 },   { 90, 100, 8, 5, 0 },  { 100, 105, 10, 3, 1 },
    { 110, 110, 5, 1, 2 }, { 120, 115, 9, 4, 0 }, { 80, 120, 4, 3, 1 },   { 120, 125, 8, 2, 2 }, { 130, 130, 6, 4, 0 },
    { 140, 135, 4, 2, 1 }, { 150, 140, 5, 1, 2 }, { 100, 145, 10, 5, 0 }, { 110, 150, 7, 1, 1 }, { 120, 155, 6, 4, 2 },
    { 80, 160, 4, 3, 0 },  { 80, 160, 5, 6, 2 },  { 70, 150, 4, 5, 1 },   { 60, 140, 7, 4, 2 },  { 50, 130, 8, 5, 0 },
    { 50, 120, 10, 3, 1 }, { 60, 110, 5, 1, 2 },  { 70, 100, 9, 4, 0 },   { 80, 90, 4, 3, 1 },   { 150, 120, 5, 6, 2 },
    { 160, 100, 4, 5, 1 }, { 140, 140, 7, 4, 2 }, { 150, 80, 8, 5, 0 },   { 70, 90, 10, 6, 1 },  { 60, 110, 5, 5, 2 },
    { 70, 100, 9, 7, 0 },  { 80, 90, 8, 4, 1 },
};

static const TaskMain gUnknown_080D7970[] = {
    Task_ActorSonicRunIn, sub_80380B0, sub_80385A4, sub_80389E0, sub_8038E20,
};

static const s8 gUnknown_080D7984[] = {
    0, -8, 4, 2, 0, 0, 0, 0,
};

void CreateTrueArea53Intro(void)
{
    u8 i;
    struct Task *t;
    TrueArea53Intro *intro;
    Sprite *s;
    gBldRegs.bldCnt = 0x3FFF;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(Task_IntroPanIn, sizeof(TrueArea53Intro), 0x7000, 0, NULL);
    intro = TASK_DATA(t);
    intro->cameraY = 0;
    intro->animFrame = 370;
    intro->unk8 = 0xE8;
    intro->unkE = 0;
    intro->unkF = 0;

    for (i = 0; i < 32; i++) {
        intro->unk10[i] = 1;
        intro->birdPositions[i][0] = Q(gUnknown_080D7830[i][0]);
        intro->birdPositions[i][1] = Q(gUnknown_080D7830[i][1]);
        intro->birdSpeeds[i][0] = 0;
        intro->birdSpeeds[i][1] = 0;
    }

    intro->unk1B0 = 1;
    intro->unk1B4 = Q(100);
    intro->unk1B8 = Q(180);

    s = &intro->vanillaSprite;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = gUnknown_080D7560[0].tiles;
    s->graphics.anim = gUnknown_080D7560[4].anim;
    s->variant = gUnknown_080D7560[4].variant;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 5;
    s->frameFlags = 0x400;

    for (i = 0; i < 3; i++) {
        s = &intro->birdSprites[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = gUnknown_080D7560[i + 1].tiles;
        s->graphics.anim = gUnknown_080D7560[i + 1].anim;
        s->variant = gUnknown_080D7560[i + 1].variant;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = i + 1;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
    }

    CreateBackgrounds();
    CreateSkipHandler();
    m4aSongNumStart(MUS_EXTRA_DEMO_1);
}

void CreateOrbitingEmeraldsSequence(void)
{
    u8 i;
    Background *background;
    Sprite *emerald;

    struct Task *t = TaskCreate(Task_OrbitingEmeraldsMoveOutwards, sizeof(OrbitingEmeraldsSequence), 0x7000, 0, NULL);
    OrbitingEmeraldsSequence *sequence = TASK_DATA(t);
    sequence->animFrame = 32;

    background = &sequence->background;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CUTSCENE_VANILLA_KIDNAPPED_SUPER_SONIC_ART;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 9;
    background->unk24 = 1;
    background->targetTilesX = 0xD;
    background->targetTilesY = 0x12;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(2);

    for (i = 0; i < 7; i++) {
        sequence->orbitSpeeds[i] = 0;
        sequence->orbitPositions[i] = Q(180);
        emerald = &sequence->emerald[i];
        emerald->x = 0;
        emerald->y = 0;
        emerald->graphics.dest = OBJ_VRAM0 + 0x3000 + (i * 0x200);
        emerald->graphics.anim = 0x345;
        emerald->variant = i;
        emerald->prevVariant = -1;
        emerald->oamFlags = SPRITE_OAM_ORDER(20);
        emerald->graphics.size = 0;
        emerald->animCursor = 0;
        emerald->qAnimDelay = 0;
        emerald->animSpeed = SPRITE_ANIM_SPEED(1.0);
        emerald->palId = 0;
        emerald->frameFlags = 0;
    }
}

#define ORBIT_BASE_X 120
#define ORBIT_BASE_Y 100

#define ORBIT_SET_SPRITE_POS(s, pos)                                                                                                       \
    ({                                                                                                                                     \
        s->x = pos[0] + ORBIT_BASE_X;                                                                                                      \
        s->y = pos[1] + ORBIT_BASE_Y;                                                                                                      \
    })

void Task_OrbitingEmeraldsMoveOutwards(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    Sprite *s;
    OrbitingEmeraldsSequence *sequence = TASK_DATA(gCurTask);

    for (i = 0; i < 7; i++) {
        s = &sequence->emerald[i];
        sequence->orbitSpeeds[i] += 5;
        sequence->orbitPositions[i] += sequence->orbitSpeeds[i];

        temp[0] = ((sequence->orbitPositions[i] * (i + 15)) >> 9) & ONE_CYCLE;
        temp[1] = ((sequence->orbitPositions[i] * (i + 13)) >> 9) & ONE_CYCLE;

        pos[0] = Q_2_14_TO_INT(COS(temp[0]) * (32 - sequence->animFrame));
        pos[1] = Q_2_14_TO_INT(SIN(temp[1]) * (32 - sequence->animFrame)) >> 2;

        ORBIT_SET_SPRITE_POS(s, pos);

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (--sequence->animFrame == 0) {
        sequence->animFrame = 360;
        gCurTask->main = Task_OrbitingEmeraldsRotate;
    };
}

void Task_OrbitingEmeraldsRotate(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    s32 temp2;
    Sprite *s;
    OrbitingEmeraldsSequence *sequence = TASK_DATA(gCurTask);

    for (i = 0; i < 7; i++) {
        s = &sequence->emerald[i];
        sequence->orbitSpeeds[i] += 5;
        sequence->orbitPositions[i] += sequence->orbitSpeeds[i];

        temp[0] = ((sequence->orbitPositions[i] * (i + 15)) >> 9) & ONE_CYCLE;
        temp[1] = ((sequence->orbitPositions[i] * (i + 13)) >> 9) & ONE_CYCLE;

        temp2 = COS(temp[0]);
        pos[0] = temp2 >> 9;

        temp2 = SIN(temp[1]);
        pos[1] = temp2 >> 11;

        ORBIT_SET_SPRITE_POS(s, pos);

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (--sequence->animFrame == 0) {
        sequence->animFrame = 32;
        gCurTask->main = Task_OrbitingEmeraldsContractAndFadeScreenWhite;
    };
}

void Task_OrbitingEmeraldsContractAndFadeScreenWhite(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    Sprite *s;
    OrbitingEmeraldsSequence *sequence = TASK_DATA(gCurTask);

    if (--sequence->animFrame == 0) {
        sequence->animFrame = 0x78;
        gBgCntRegs[2] = 0x1C08;
        gBldRegs.bldY = 0x10;
        gDispCnt = 0x40;
        gDispCnt |= 0x5500;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0;

        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[2][0] = 0;
        gUnknown_03002280[2][1] = 0;
        gUnknown_03002280[2][2] = 0xff;
        gUnknown_03002280[2][3] = 0x14;

        DrawBackground(&sequence->background);
        gCurTask->main = Task_DisplaySonicSonicArtworkAndDestroyTask;
        return;
    }

    if (sequence->animFrame < 16) {
        gDispCnt |= 0x4000;
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10 - sequence->animFrame;
        gWinRegs[1] = DISPLAY_WIDTH;
        gWinRegs[3] = DISPLAY_HEIGHT;
        gWinRegs[4] = 0xFF00;
        gWinRegs[5] = 0xFF;
    }

    for (i = 0; i < 7; i++) {
        s = &sequence->emerald[i];
        sequence->orbitSpeeds[i] += 5;
        sequence->orbitPositions[i] += sequence->orbitSpeeds[i];

        temp[0] = ((sequence->orbitPositions[i] * (i + 15)) >> 9) & ONE_CYCLE;
        temp[1] = ((sequence->orbitPositions[i] * (i + 13)) >> 9) & ONE_CYCLE;

        pos[0] = Q_2_14_TO_INT(sequence->animFrame * COS(temp[0]));
        pos[1] = Q_2_14_TO_INT(sequence->animFrame * SIN(temp[1])) >> 2;

        ORBIT_SET_SPRITE_POS(s, pos);

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_DisplaySonicSonicArtworkAndDestroyTask(void)
{
    OrbitingEmeraldsSequence *sequence = TASK_DATA(gCurTask);

    if (--sequence->animFrame == 0) {
        gDispCnt = 0x1140;
        gBgCntRegs[2] = 0x1C0B;
        TaskDestroy(gCurTask);
        return;
    }

    if (sequence->animFrame < 117 && gBldRegs.bldY != 0) {
        gBldRegs.bldCnt = 0xbf;
        gBldRegs.bldY--;
        gWinRegs[1] = DISPLAY_WIDTH;
        gWinRegs[3] = DISPLAY_HEIGHT;
        gWinRegs[4] = 0xff00;
        gWinRegs[5] = 0xff;
    }
}

void CreateSuperSonicSpark(s32 x, s32 y)
{
    Sprite *s;
    struct Task *t = TaskCreate(Task_SuperSonicSpark, sizeof(SuperSonicSpark), 0x7000, 0, NULL);
    u32 type = PseudoRandBetween(2, 4);
    SuperSonicSpark *spark = TASK_DATA(t);
    spark->animFrame = 40;

    spark->x = x + (s16)Q(PseudoRandBetween(-16, 16));
    spark->y = y + (s16)Q(PseudoRandBetween(-16, 16));
    spark->speedX = 0;
    spark->speedY = 0;

    s = &spark->s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = gUnknown_080D7540[type].tiles;
    s->graphics.anim = gUnknown_080D7540[type].anim;
    s->variant = gUnknown_080D7540[type].variant;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = 0x20;
    s->palId = 0;
    s->frameFlags = 0x1000;
}

void Task_SuperSonicSpark(void)
{
    SuperSonicSpark *spark = TASK_DATA(gCurTask);
    Sprite *s = &spark->s;

    OBJ_ACCELERATE_Y(spark, 16);
    OBJ_UPDATE_POS(spark);

    if (--spark->animFrame == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    OBJ_RENDER_SPRITE(spark, s);
}

void CreateActor(u8 character)
{
    Sprite *s;
    const TileInfoPtr *tileInfo;
    struct Task *t = TaskCreate(gUnknown_080D7970[character], sizeof(IntroActor), 0x7000, 0, NULL);
    IntroActor *actor = TASK_DATA(t);
    actor->character = character;
    actor->sequence = 0;

    actor->animFrame = gUnknown_080D7704[actor->character][0];

    actor->x = gUnknown_080D77D0[actor->character][0];
    actor->y = gUnknown_080D77D0[actor->character][1];
    actor->speedX = gUnknown_080D77D0[actor->character][2];
    actor->speedY = gUnknown_080D77D0[actor->character][3];

    tileInfo = gUnknown_080D76F0[character];
    s = &actor->s;

    // BUG: should have been `I`
    s->x = Q(gUnknown_080D77D0[actor->character][0]);
    s->y = Q(gUnknown_080D77D0[actor->character][1]);

    s->graphics.dest = tileInfo->tiles;
    s->graphics.anim = tileInfo->anim;
    s->variant = tileInfo->variant;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(16 - gUnknown_080D7984[character]);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = 0x20;
    if (character < ACTOR_CHEESE) {
        s->palId = character;
    } else {
        s->palId = 0;
    }

    s->frameFlags = 0x1400;

    if (character < ACTOR_CHEESE) {
        s = &actor->ssGroundEffectSprite;
        s->x = 0;
        s->y = 0;

        s->graphics.dest = gUnknown_080D7540[character].tiles;
        s->graphics.anim = gUnknown_080D7540[character].anim;
        s->variant = gUnknown_080D7540[character].variant;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(16);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0x1000;
    }
}

void Task_ActorSonicRunIn(void)
{
    Sprite *s;
    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = Task_ActorSonicSlowDownTilStop;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void Task_ActorSonicSlowDownTilStop(void)
{
    Sprite *s;
    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8037744;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8037744(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        actor->speedX = 0;
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8037818;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8037818(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80378BC;
    }
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_80378BC(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        actor->unk4 = 0;
        gCurTask->main = sub_803796C;
    }
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_803796C(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    if (actor->animFrame < 309) {
        if (actor->animFrame == 240) {
            CreateOrbitingEmeraldsSequence();
            m4aSongNumStart(MUS_EXTRA_DEMO_2);
        }

        if (I(actor->y) > 156) {
            actor->y -= 24;
        }
    }

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8037A38;
    }
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8037A38(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;

    if (!(actor->animFrame & 7)) {
        s->animSpeed++;
    }

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        m4aSongNumStart(SE_GRINDING);
        gCurTask->main = sub_8037B04;
    }
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8037B04(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;
    actor->y -= SIN(((++actor->unk4) * 5) & 0x3FF) >> 8;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8037BD0;
    }
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8037BD0(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;
    actor->y -= SIN(((++actor->unk4) * 5) & 0x3FF) >> 8;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8037CEC;
    }
    OBJ_RENDER_SPRITE(actor, s);

    s = &actor->ssGroundEffectSprite;
    s->x = I(actor->x);
    s->y = 178 - gCamera.y;
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);

    if (!(actor->animFrame & 3)) {
        CreateSuperSonicSpark(actor->x, actor->y);
    }
}

void sub_8037CEC(void)
{
    Sprite *s;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;
    actor->y -= SIN(((++actor->unk4) * 5) & 0x3FF) >> 8;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8037E08;
    }
    OBJ_RENDER_SPRITE(actor, s);

    s = &actor->ssGroundEffectSprite;
    s->x = I(actor->x);
    s->y = 178 - gCamera.y;
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);

    if (!(actor->animFrame & 3)) {
        CreateSuperSonicSpark(actor->x, actor->y);
    }
}

void sub_8037E08(void)
{
    Sprite *s, *sprite2;

    IntroActor *actor = TASK_DATA(gCurTask);
    s = &actor->s;
    sprite2 = &actor->ssGroundEffectSprite;
    actor->y -= SIN(((++actor->unk4) * 5) & 0x3FF) >> 8;

    if (--actor->animFrame == 0) {
        gBldRegs.bldY = 0;
        NEXT_SEQUENCE_ANIM(actor, s);

        sprite2->graphics.dest = gUnknown_080D7540[1].tiles;
        sprite2->graphics.anim = gUnknown_080D7540[1].anim;
        sprite2->variant = gUnknown_080D7540[1].variant;
        sprite2->prevVariant = -1;

        gCurTask->main = sub_8037F68;

        m4aSongNumStop(SE_GRINDING);
        m4aSongNumStart(SE_221);
    }
    OBJ_RENDER_SPRITE(actor, s);

    s = &actor->ssGroundEffectSprite;
    s->x = I(actor->x);
    s->y = 178 - gCamera.y;
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);

    if (!(actor->animFrame & 3)) {
        CreateSuperSonicSpark(actor->x, actor->y);
    }
}

void sub_8037F68(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;
    if (actor->y > -0x2000) {
        actor->y -= 0x800;
    }

    gDispCnt |= 0x4000;
    gBldRegs.bldCnt = 0xFF;
    gWinRegs[1] = DISPLAY_WIDTH;
    gWinRegs[3] = DISPLAY_HEIGHT;
    gWinRegs[4] = 0xff00;
    gWinRegs[5] = 0xff;

    if (actor->animFrame == 0) {
        if (gBldRegs.bldY == 16) {
            // exit to stage
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
            gGameMode = GAME_MODE_SINGLE_PLAYER;
            gSelectedCharacter = CHARACTER_SONIC;
            gCurrentLevel = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
            ApplyGameStageSettings();
            GameStageStart();
            return;
        }

        gBldRegs.bldY++;
    } else {
        actor->animFrame--;
    }

    OBJ_RENDER_SPRITE(actor, s);

    if (actor->animFrame > 0x99) {
        s = &actor->ssGroundEffectSprite;
        s->x = I(actor->x);
        s->y = 178 - gCamera.y;
        s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(s);
    }

    if (!(actor->animFrame & 3)) {
        CreateSuperSonicSpark(actor->x, actor->y);
    }
}

// Cream
void sub_80380B0(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038168;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038168(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8038238;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038238(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80382F0;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_80382F0(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80383B8;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_80383B8(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_803845C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_803845C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038500;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038500(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_803997C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

// tails
void sub_80385A4(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8038664;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038664(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_803872C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_803872C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80387F4;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_80387F4(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038898;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038898(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_803893C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_803893C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80399A4;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

// Knuckles
void sub_80389E0(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        gCurTask->main = sub_8038AA0;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038AA0(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        actor->speedX = 0;
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038B6C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038B6C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038C34;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038C34(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038CD8;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038CD8(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038D7C;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038D7C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_80399CC;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

// Maybe cheese?
void sub_8038E20(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038EE4;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038EE4(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        actor->y -= 0x200;
        actor->speedX = 0;
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8038FBC;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8038FBC(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    OBJ_ACCELERATE_X(actor, -32);
    OBJ_UPDATE_POS(actor);

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8039084;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8039084(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (actor->x < 0xB800) {
        actor->x += 0x80;
    } else {
        s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    }

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8039144;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8039144(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (actor->x < 0x9800) {
        actor->x += 0x40;
    }

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        gCurTask->main = sub_8039208;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8039208(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;

    if (--actor->animFrame == 0) {
        NEXT_SEQUENCE_ANIM(actor, s);
        gCurTask->main = sub_8039A10;
    }

    OBJ_RENDER_SPRITE(actor, s);
}

void Task_IntroPanIn(void)
{
    TrueArea53Intro *intro = TASK_DATA(gCurTask);

    if (!(gStageTime & 3) && intro->cameraY < 44) {
        intro->cameraY++;
    }

    intro->unk8 += 2;
    gCamera.x = 0;
    gCamera.y = intro->cameraY;
    gStageTime++;

    IntroRenderSprites(0);

    if (intro->animFrame != 370) {
        if (--intro->animFrame == 0) {
            Sprite *s;
            intro->unk8 = 0x100;
            gCurTask->main = sub_80393A4;

            s = &intro->vanillaSprite;
            s->graphics.dest = gUnknown_080D7560[0].tiles;
            s->graphics.anim = gUnknown_080D7560[0].anim;
            s->variant = gUnknown_080D7560[0].variant;
            s->frameFlags = 0;
            s->prevVariant = -1;
        }

        if (intro->animFrame == 60) {
            SetupEggmanKidnapsVanillaTask();
            return;
        }

        if (intro->animFrame < 60) {
            intro->unkE = SIN(intro->animFrame & ONE_CYCLE) & 1;
            intro->unkF = SIN(intro->animFrame & ONE_CYCLE) & 1;
        }
        return;
    }

    if (gBldRegs.bldY != 0) {
        if ((gStageTime & 3) == 0) {
            gBldRegs.bldY--;
        }
        return;
    }

    intro->animFrame--;
}

void sub_80393A4(void)
{
    s32 x, y;
    u8 i;
    TrueArea53Intro *intro = TASK_DATA(gCurTask);

    intro->unk8++;
    gStageTime++;
    gUnknown_030054B8 = 0;

    intro->animFrame += 7;
    if (intro->animFrame > 250) {
        sub_8050B2C(&x, &y);
        x += 5120;
        y += 1024;

        for (i = 0; i < 32; i++) {
            if (intro->unk10[i] != 0) {
                intro->birdPositions[i][0] = sub_8085698(intro->birdPositions[i][0], x, intro->animFrame, 10, gUnknown_080D7830[i][4] + 2);

                intro->birdPositions[i][1] = sub_8085698(intro->birdPositions[i][1], y, intro->animFrame, 10, gUnknown_080D7830[i][4] + 2);

                intro->birdSpeeds[i][0] -= (intro->birdSpeeds[i][0] >> 3);
                intro->birdSpeeds[i][1] -= (intro->birdSpeeds[i][1] >> 3);

                if ((intro->birdPositions[i][0] + 2048) > x) {
                    intro->unk10[i] = 0;
                }
            }
        }
        if (intro->unk1B0 > 0) {
            m4aSongNumStartOrContinue(SE_SUCTION);
            intro->unk1B4 = sub_8085698(Q(100), x, intro->animFrame + 32, 10, 3);
            intro->unk1B8 = sub_8085698(Q(180), y, intro->animFrame + 96, 10, 3);

            if ((intro->unk1B4 + 2048) > x) {
                intro->unk1B0 = 0;
                m4aMPlayFadeOutTemporarily(&gMPlayInfo_SE2, 4);
            }
        }
    }

    if (intro->animFrame < 2800) {
        intro->unkE = SIN(intro->animFrame & ONE_CYCLE) & 1;
        intro->unkF = SIN(intro->animFrame & ONE_CYCLE) & 1;
    } else if (intro->animFrame > 3000) {
        CreateActor(CHARACTER_SONIC);
        CreateActor(CHARACTER_CREAM);
        CreateActor(CHARACTER_TAILS);
        CreateActor(CHARACTER_KNUCKLES);
        CreateActor(ACTOR_CHEESE);
        m4aSongNumStop(SE_SUCTION);
        TaskDestroy(gCurTask);
        return;
    } else {
        intro->unkE = 0;
        intro->unkF = 0;
    }

    IntroRenderSprites(1);
}

void IntroRenderSprites(u8 flockMode)
{
    u8 i;
    s32 pos[2];
    Sprite *s;
    TrueArea53Intro *intro = TASK_DATA(gCurTask);
    gBgScrollRegs[0][1] = intro->unkF + intro->cameraY;
    gBgScrollRegs[1][1] = intro->unkF + intro->cameraY;
    gBgScrollRegs[0][0] = intro->unkE;
    gBgScrollRegs[1][0] = intro->unkE;

    UpdateSpriteAnimation(&intro->birdSprites[0]);
    UpdateSpriteAnimation(&intro->birdSprites[1]);
    UpdateSpriteAnimation(&intro->birdSprites[2]);

    pos[0] = (intro->unk8 * 5) & ONE_CYCLE;
    pos[1] = (intro->unk8 * 3) & ONE_CYCLE;

    if (flockMode != 0) {
        for (i = 0; i < 32; i++) {
            if (intro->unk10[i] != 0) {
                s = &intro->birdSprites[gUnknown_080D7830[i][4]];

                intro->birdPositions[i][0] += intro->birdSpeeds[i][0];
                intro->birdPositions[i][1] += intro->birdSpeeds[i][1];

                intro->birdSpeeds[i][0] -= 0x28;
                intro->birdSpeeds[i][1] -= 0x10;

                s->x = intro->birdPositions[i][0] >> 8;
                s->y = (intro->birdPositions[i][1] >> 8) - intro->cameraY;
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
                DisplaySprite(s);
            }
        }
    } else {
        for (i = 0; i < 32; i++) {
            s32 prevPos[2];
            s = &intro->birdSprites[gUnknown_080D7830[i][4]];
            prevPos[0] = intro->birdPositions[i][0];
            prevPos[1] = intro->birdPositions[i][1];

            intro->birdPositions[i][0] = (COS(pos[0]) * gUnknown_080D7830[i][2]) >> 4;
            intro->birdPositions[i][0] += Q(gUnknown_080D7830[i][0]);

            intro->birdPositions[i][1] = (SIN(pos[1]) * gUnknown_080D7830[i][3]) >> 4;
            intro->birdPositions[i][1] += Q(gUnknown_080D7830[i][1]);

            intro->birdSpeeds[i][0] = intro->birdPositions[i][0] - prevPos[0];
            intro->birdSpeeds[i][1] = intro->birdPositions[i][1] - prevPos[1];

            s->x = I(intro->birdPositions[i][0]);
            s->y = I(intro->birdPositions[i][1]) - intro->cameraY;

            if (intro->birdSpeeds[i][0] < 0) {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
            } else {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
            }

            DisplaySprite(s);
            pos[0] = (pos[0] - 64) & ONE_CYCLE;
            pos[1] = (pos[1] - 64) & ONE_CYCLE;
        }
    }

    if (intro->unk1B0 != 0) {
        s = &intro->vanillaSprite;
        s->x = I(intro->unk1B4);
        s->y = I(intro->unk1B8) - intro->cameraY + intro->unkF;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void CreateBackgrounds(void)
{
    struct Task *t;
    Background *background;
    WorldBackgrounds *worldBgs;
    gDispCnt = 0x1341;
    gBgCntRegs[2] = 0x5c09;
    gBgCntRegs[1] = 0x1e06;
    gBgCntRegs[0] = 0x1f03;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0x48;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0x48;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 0x20;

    t = TaskCreate(sub_8039A38, sizeof(WorldBackgrounds), 0x8100, 0, NULL);
    worldBgs = TASK_DATA(t);

    background = &worldBgs->bg1;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(31);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CUTSCENE_VANILLA_KIDNAPPED_FULL_MAP;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &worldBgs->bg2;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CUTSCENE_VANILLA_KIDNAPPED_FULL_MAP_COPY;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);
}

void sub_803997C(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);

    UpdateSpriteAnimation(&actor->s);
    DisplaySprite(&actor->s);
}

void sub_80399A4(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);

    UpdateSpriteAnimation(&actor->s);
    DisplaySprite(&actor->s);
}

void sub_80399CC(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);
    Sprite *s = &actor->s;
    OBJ_RENDER_SPRITE(actor, s);
}

void sub_8039A10(void)
{
    IntroActor *actor = TASK_DATA(gCurTask);

    UpdateSpriteAnimation(&actor->s);
    DisplaySprite(&actor->s);
}

void sub_8039A38(void) { TaskDestroy(gCurTask); }

void CreateSkipHandler(void) { TaskCreate(Task_SkipHandlerMain, 0, 0x2000, 0, NULL); }

void Task_SkipHandlerMain(void)
{
    s32 priorityMax = 0xffff;
    s32 priority = 0x8888;

    if (gPressedKeys & START_BUTTON) {
        TasksDestroyInPriorityRange(0, priorityMax);
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        TaskCreate(sub_8039AD4, 0, priority, 0, NULL);
    }
}

void sub_8039AD4(void)
{
    gOamFreeIndex = 0;
    gOamFirstPausedIndex = 0;
    CpuFill16(-1, gUnknown_03001850, sizeof(gUnknown_03001850));
    CpuFill16(-1, gUnknown_03004D60, sizeof(gUnknown_03004D60));

    m4aMPlayAllStop();
    gGameMode = GAME_MODE_SINGLE_PLAYER;
    gSelectedCharacter = CHARACTER_SONIC;
    gCurrentLevel = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
    ApplyGameStageSettings();
    GameStageStart();
    TaskDestroy(gCurTask);
}
