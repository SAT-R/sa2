#include "global.h"
#include "gba/syscall.h"

#include "lib/m4a.h"
#include "game/math.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "game/entity.h"
#include "game/interactables_2/note_particle.h"
#include "game/interactables_2/music_plant/note_sphere.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite disp;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ u8 kind;
    /* 0x49 */ u8 angle;
    /* 0x4A */ u8 unk4A;
    /* 0x4B */ u8 unk4B;
} Sprite_NoteSphere; /* size: 0x4C */

static void Task_Note_Sphere(void);

static u8 NoteSphere_BouncePlayer(Sprite_NoteSphere *);
static bool32 NoteSphere_IsPlayerColliding(Sprite_NoteSphere *);
static void TaskDestructor_Interactable_MusicPlant_Note_Sphere(struct Task *);
static void NoteSphere_UpdateSpritePos(Sprite_NoteSphere *);
static void NoteSphere_80758B8(Sprite_NoteSphere *);
static bool32 NoteSphere_ShouldDespawn(Sprite_NoteSphere *);
static void NoteSphere_Despawn(Sprite_NoteSphere *);

/* animId, variant, tileId (OBJ VRAM) */
static const u16 sNoteSphereAnimInfo[8][3] = {
    { SA2_ANIM_NOTE_BLOCK, 7, 0x188 },  { SA2_ANIM_NOTE_BLOCK, 8, 0x18E },
    { SA2_ANIM_NOTE_BLOCK, 9, 0x194 },  { SA2_ANIM_NOTE_BLOCK, 10, 0x19A },
    { SA2_ANIM_NOTE_BLOCK, 11, 0x1A0 }, { SA2_ANIM_NOTE_BLOCK, 12, 0x1A6 },
    { SA2_ANIM_NOTE_BLOCK, 13, 0x1AC }, { SA2_ANIM_NOTE_BLOCK, 14, 0x1B2 },
};

static const s16 sNoteSphereVelocities[8] = {
    Q_8_8(4.5), Q_8_8(5.0), Q_8_8(5.5), Q_8_8(6.0),
    Q_8_8(6.5), Q_8_8(7.0), Q_8_8(7.5), Q_8_8(8.0),
};

static const u16 sNoteSphereSfx[8] = {
    SE_MUSIC_PLANT_NOTES_1, SE_MUSIC_PLANT_NOTES_2, SE_MUSIC_PLANT_NOTES_3,
    SE_MUSIC_PLANT_NOTES_4, SE_MUSIC_PLANT_NOTES_5, SE_MUSIC_PLANT_NOTES_6,
    SE_MUSIC_PLANT_NOTES_7, SE_MUSIC_PLANT_NOTES_8,
};

void CreateEntity_Note_Sphere(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Note_Sphere, sizeof(Sprite_NoteSphere), 0x2010, 0,
                                TaskDestructor_Interactable_MusicPlant_Note_Sphere);
    Sprite_NoteSphere *note = TASK_DATA(t);
    Sprite *s = &note->disp;
    note->unk44 = 0;
    note->unk46 = 0;
    note->kind = me->d.uData[0];

    note->base.regionX = spriteRegionX;
    note->base.regionY = spriteRegionY;
    note->base.me = me;
    note->base.spriteX = me->x;
    note->base.spriteY = spriteY;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;

    s->graphics.dest
        = &((u8 *)OBJ_VRAM0)[sNoteSphereAnimInfo[note->kind][2] * TILE_SIZE_4BPP];
    s->graphics.anim = sNoteSphereAnimInfo[note->kind][0];
    s->variant = sNoteSphereAnimInfo[note->kind][1];

    note->posX = TO_WORLD_POS(me->x, spriteRegionX);
    note->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    UpdateSpriteAnimation(s);
}

static void Task_80754B8(void)
{
    Sprite_NoteSphere *note = TASK_DATA(gCurTask);

    switch (note->unk4A++) {
        case 0: {
            note->unk44 = (Q_2_14_TO_Q_24_8(COS(note->angle * 4)) * 8);
            note->unk46 = (Q_2_14_TO_Q_24_8(SIN(note->angle * 4)) * 8);
        } break;

        case 4: {
            note->unk44 = -(Q_2_14_TO_Q_24_8(COS(note->angle * 4)) * 4);
            note->unk46 = -(Q_2_14_TO_Q_24_8(SIN(note->angle * 4)) * 4);
        } break;

        case 6: {
            note->unk44 = 0;
            note->unk46 = 0;
            gCurTask->main = Task_Note_Sphere;
        } break;
    }

    NoteSphere_UpdateSpritePos(note);
    NoteSphere_80758B8(note);
}

static void NoteSphere_ApplyCollisionPlayer(Sprite_NoteSphere *note)
{
    // NOTE: Setting note->angle is redundant, it gets set in the procedure.
    //       Though it'd be more understandable to leave this in and
    //       remove the assignment inside the proc, if one wanted to remove one of them.
    note->angle = NoteSphere_BouncePlayer(note);

    gPlayer.moveState = ((gPlayer.moveState | MOVESTATE_IN_AIR) & ~(MOVESTATE_100));
    note->unk4A = 0;

    sub_8080C78(note->posX, note->posY, 5, 30, (sNoteSphereVelocities[note->kind] >> 3),
                (-((sNoteSphereVelocities[note->kind] * 3) << 14)) >> 16, 0);

    sub_8080C78(note->posX, note->posY, 5, 30, (-sNoteSphereVelocities[note->kind] >> 3),
                (-((sNoteSphereVelocities[note->kind] * 3) << 14)) >> 16, 1);

    m4aSongNumStart(sNoteSphereSfx[note->kind]);
    gCurTask->main = Task_80754B8;
}

static u8 NoteSphere_BouncePlayer(Sprite_NoteSphere *note)
{
    u8 angle;
    u16 r6;
    s16 vecPlayerToNoteX, vecPlayerToNoteY;
    vecPlayerToNoteX = Q_24_8_TO_INT(gPlayer.x) - note->posX;
    vecPlayerToNoteY = Q_24_8_TO_INT(gPlayer.y) - note->posY;

    r6 = sub_8085530(vecPlayerToNoteX, vecPlayerToNoteY);

    // Normalize vector
    vecPlayerToNoteX = (vecPlayerToNoteX << 14) / r6;
    vecPlayerToNoteY = (vecPlayerToNoteY << 14) / r6;

    angle = ArcTan2(vecPlayerToNoteX, vecPlayerToNoteY) >> 8;

    // Redundant (see note in NoteSphere_ApplyCollisionPlayer)
    note->angle = angle;

    {
        u8 newAngle;
        u8 r4;
        s16 vecNewPlayerDirX = -gPlayer.speedAirX;
        s16 vecNewPlayerDirY = -gPlayer.speedAirY;
        r6 = sub_8085530((s16)vecNewPlayerDirX, (s16)vecNewPlayerDirY);

        vecNewPlayerDirX = ((vecNewPlayerDirX << 8) / r6) << 6;
        vecNewPlayerDirY = ((vecNewPlayerDirY << 8) / r6) << 6;
        newAngle = ArcTan2(vecNewPlayerDirX, vecNewPlayerDirY) >> 8;

        r4 = (u8)(newAngle + (sub_808558C(newAngle, angle, 8) << 1));

        gPlayer.speedAirX = Q_24_8_TO_INT(sNoteSphereVelocities[note->kind]
                                          * Q_2_14_TO_Q_24_8(COS(r4 * 4)));
        gPlayer.speedAirY = Q_24_8_TO_INT(sNoteSphereVelocities[note->kind]
                                          * Q_2_14_TO_Q_24_8(SIN(r4 * 4)));
    }

    gPlayer.transition = PLTRANS_PT5;

    return angle;
}

static bool32 NoteSphere_IsPlayerColliding(Sprite_NoteSphere *note)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 distanceX, distanceY;

        distanceX = ABS(note->posX - Q_24_8_TO_INT(gPlayer.x));
        distanceY = ABS(note->posY - Q_24_8_TO_INT(gPlayer.y));

        if (MAX(distanceX, distanceY) < 25) {
            if ((distanceX * distanceX + distanceY * distanceY) <= (24 * 24)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

static void Task_Note_Sphere(void)
{
    Sprite_NoteSphere *note = TASK_DATA(gCurTask);

    if (NoteSphere_IsPlayerColliding(note)) {
        NoteSphere_ApplyCollisionPlayer(note);
    }

    if (NoteSphere_ShouldDespawn(note)) {
        NoteSphere_Despawn(note);
    } else {
        NoteSphere_UpdateSpritePos(note);
        NoteSphere_80758B8(note);
    }
}

static void TaskDestructor_Interactable_MusicPlant_Note_Sphere(struct Task *UNUSED t) { }

static void NoteSphere_UpdateSpritePos(Sprite_NoteSphere *note)
{
    Sprite *s = &note->disp;

    s->x = (note->posX - gCamera.x) + Q_8_8_TO_INT(note->unk44);
    s->y = (note->posY - gCamera.y) + Q_8_8_TO_INT(note->unk46);
}

static void NoteSphere_80758B8(Sprite_NoteSphere *note)
{
    Sprite *s = &note->disp;

    s->unk10 |= 0x400;
    DisplaySprite(s);

    s->unk10 &= ~0x400;
    DisplaySprite(s);
}

static bool32 NoteSphere_ShouldDespawn(Sprite_NoteSphere *note)
{
    s32 screenX, screenY;
    u16 posX, posY;

    screenX = (note->posX + (CAM_REGION_WIDTH / 2));
    screenX -= gCamera.x;

    screenY = (note->posY + (CAM_REGION_WIDTH / 2));
    screenY -= gCamera.y;

    posY = screenY;
    posX = screenX;

    if ((posX > (DISPLAY_WIDTH + CAM_REGION_WIDTH))
        || (posY > (DISPLAY_HEIGHT + CAM_REGION_WIDTH))) {
        return TRUE;
    }

    return FALSE;
}

static void NoteSphere_Despawn(Sprite_NoteSphere *note)
{
    note->base.me->x = note->base.spriteX;
    TaskDestroy(gCurTask);
}