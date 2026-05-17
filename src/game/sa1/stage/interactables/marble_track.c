#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h" // gPlayerControls
#include "game/sa1/stage/stage_ui.h" // sub_80549FC
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3C */ u8 unk3D;
    /* 0x3D */ u8 unk3E[2];
    /* 0x44 */ s32 unk40[2];
    /* 0x44 */ s32 unk48[2];
    /* 0x44 */ s32 unk50[2];
    /* 0x44 */ s32 unk58[2];
    /* 0x44 */ s32 unk60[2];
    /* 0x68 */ u8 unk68;
} MarbleTrackDir; /* 0x6C */

/* The chopped-up pipes in Secret Base, which automatically "warp" you downwards */
typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x44 */ u16 unk44[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x48 */ u16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ u8 unk4C;
    /* 0x4D */ u8 unk4D;
} SecretBasePipe; /* 0x50 */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
    /* 0x44 */ s32 unk40[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x48 */ s16 unk48;
    /* 0x48 */ s16 unk4A;
} MarbleTrackEntrance; /* 0x4C */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ u8 unk40;
    /* 0x41 */ u8 unk41;
    /* 0x44 */ s32 unk44[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x4C */ s32 unk4C[NUM_SINGLEPLAYER_CHARS_MAX];
} MarbleTrackExit; /* 0x54 */

void Task_MarbleTrack_Dir(void);
void Task_MarbleTrack_Unk(void);
void Task_MarbleTrack_Entrance(void);
void TaskDestructor_MarbleTrack_Entrance(Task *t);
void Task_MarbleTrack_Exit(void);
void TaskDestructor_MarbleTrack_Exit(Task *t);

void CreateEntity_MarbleTrack_Dir(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MarbleTrack_Dir, sizeof(MarbleTrackDir), 0x2000 | me->d.uData[3], 0, NULL);
    MarbleTrackDir *dir = TASK_DATA(t);
    s32 i;

    dir->base.regionX = regionX;
    dir->base.regionY = regionY;
    dir->base.me = me;
    dir->base.meX = me->x;
    dir->base.id = id;

    dir->unk3D = me->d.uData[2];
    for (i = 0; i < 2; i++) {
        dir->unk3E[i] = 0;
        dir->unk40[i] = 0;
        dir->unk48[i] = 0;
        dir->unk58[i] = 0;
        dir->unk60[i] = 0;
    }

    dir->unk50[0] = me->d.sData[0] * 8;
    dir->unk50[1] = me->d.sData[1] * 8;

    dir->unk68 = 0;
    dir->unk3C = me->d.uData[3];

    SET_MAP_ENTITY_INITIALIZED(me);
}

NONMATCH("asm/non_matching/game/sa1/stage/interactables/marble_track_exit__Task_MarbleTrack_Dir.inc", void Task_MarbleTrack_Dir(void))
{
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    MapEntity *me;
    MarbleTrackDir *dir = TASK_DATA(gCurTask);
    s32 i;
    me = dir->base.me;

    worldX = TO_WORLD_POS(dir->base.meX, dir->base.regionX);
    worldY = TO_WORLD_POS(me->y, dir->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (GetBit(dir->unk68, i)) {
                if (((PLAYER(i).SA2_LABEL(unk99)[0] == dir->unk3C))) {
                    s32 x, y;

                    x = Div(dir->unk50[0] * dir->unk3E[i], dir->unk3D);
                    y = Div(dir->unk50[1] * dir->unk3E[i], dir->unk3D);

                    PLAYER(i).qWorldX = Q(dir->unk40[i] + x);
                    PLAYER(i).qWorldY = Q(dir->unk48[i] + y);

                    PLAYER(i).qSpeedAirX = PLAYER(i).qWorldX - dir->unk58[i];
                    PLAYER(i).qSpeedAirY = PLAYER(i).qWorldY - dir->unk60[i];

                    if ((++dir->unk3E[i] >= dir->unk3D) || (PLAYER(i).SA2_LABEL(unk99)[0] > dir->unk3C)) {
                        if ((PLAYER(i).SA2_LABEL(unk99)[0] == dir->unk3C)) {
                            PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                            PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                            PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                            PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                            PLAYER(i).qSpeedAirY = 0;
                            PLAYER(i).qSpeedAirX = 0;
                            PLAYER(i).qSpeedGround = +Q(0);
                        }
                        ClearBit(dir->unk68, i);
                    } else {
                        PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                        PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                        PLAYER(i).qSpeedGround = +Q(0);
                        PLAYER(i).heldInput = 0;
                        PLAYER(i).frameInput = 0;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                        SetBit(dir->unk68, i);
                    }

                    dir->unk58[i] = PLAYER(i).qWorldX;
                    dir->unk60[i] = PLAYER(i).qWorldY;
                } else {
                    ClearBit(dir->unk68, i);
                }
            } else {
                // !GetBit(dir->unk68, i)
                if (((PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) && (PLAYER(i).SA2_LABEL(unk99)[0] < dir->unk3C)) || !dir->unk3C) {
                    if ((worldX - 8 <= I(PLAYER(i).qWorldX)) && (worldX + 8 >= I(PLAYER(i).qWorldX))
                        && (worldY - 10 <= I(PLAYER(i).qWorldY)) && (worldY + 10 >= I(PLAYER(i).qWorldY))) {
                        dir->unk3E[i] = 0;

                        PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                        PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                        dir->unk40[i] = I(PLAYER(i).qWorldX);
                        dir->unk48[i] = I(PLAYER(i).qWorldY);

                        PLAYER(i).qSpeedAirY = -Q(0);
                        PLAYER(i).qSpeedAirX = +Q(0);
                        PLAYER(i).qSpeedGround = +Q(0);
                        PLAYER(i).heldInput = +Q(0);
                        PLAYER(i).frameInput = +Q(0);

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        m4aSongNumStart(SE_SPRING);

                        // NOTE (for Matching): Same problem as Task_MarbleTrack_Exit.
                        // An unnecessary 'mov r2, #0 ' was inserted in the original...
                        SetBit(dir->unk68, i);

                        PLAYER(i).SA2_LABEL(unk99)[0] = dir->unk3C;
                        PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (!(dir->unk68 & 0x3)) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, dir->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}
END_NONMATCH

void CreateEntity_MarbleTrack_Pipe(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MarbleTrack_Unk, sizeof(SecretBasePipe), 0x2000 + me->d.sData[1], 0, NULL);
    SecretBasePipe *basePipe = TASK_DATA(t);

    basePipe->base.regionX = regionX;
    basePipe->base.regionY = regionY;
    basePipe->base.me = me;
    basePipe->base.meX = me->x;
    basePipe->base.id = id;

    basePipe->unk48 = me->d.uData[2] * 3;
    basePipe->unk4C = 0;
    basePipe->unk44[PLAYER_1] = 0;
    basePipe->unk3C[PLAYER_1] = 0;
    basePipe->unk44[PLAYER_2] = 0;
    basePipe->unk3C[PLAYER_2] = 0;
    basePipe->unk4A = me->d.sData[0] * 8;
    basePipe->unk4D = me->d.sData[1];

    SET_MAP_ENTITY_INITIALIZED(me);
}

// (99.04%) https://decomp.me/scratch/cMq5a
// TODO: This IA might have been left unused due to the X/Y bug?
NONMATCH("asm/non_matching/game/sa1/stage/interactables/marble_track_exit__Task_MarbleTrack_Unk.inc", void Task_MarbleTrack_Unk(void))
{
    CamCoord worldX, worldY;
    s16 screenY, screenX;
    s16 sp0C;
    SecretBasePipe *basePipe = TASK_DATA(gCurTask);
    MapEntity *me = basePipe->base.me;
    s32 i;

    worldX = TO_WORLD_POS(basePipe->base.meX, basePipe->base.regionX);
    worldY = TO_WORLD_POS(me->y, basePipe->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (GetBit(basePipe->unk4C, i)) {
                s8 zone;
                PLAYER(i).qSpeedAirY += Q(42. / 256.);

                PLAYER(i).qWorldY += PLAYER(i).qSpeedAirY;
                basePipe->unk3C[i] += PLAYER(i).qSpeedAirY;

                if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_2) || (gCurrentLevel == 15)) {
                    if (PLAYER(i).qWorldX < Q(worldX)) {
                        PLAYER(i).qWorldX += Q(0.5);

                        if (PLAYER(i).qWorldX > Q(worldX)) {
                            PLAYER(i).qWorldX = Q(worldX);
                        }
                    } else {
                        PLAYER(i).qWorldX -= Q(0.5);

                        if (PLAYER(i).qWorldX < Q(worldX))
                            PLAYER(i).qWorldX = Q(worldX);
                    }
                }

                if (((PLAYER(i).SA2_LABEL(unk99)[0] > basePipe->unk4D))
                    || ((++basePipe->unk44[i] >= basePipe->unk48) || (I(basePipe->unk3C[i]) > basePipe->unk4A))) {
                    if ((PLAYER(i).SA2_LABEL(unk99)[0] == basePipe->unk4D)) {
                        PLAYER(i).SA2_LABEL(unk99)[0] = 0x7F;
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                    ClearBit(basePipe->unk4C, i);
                } else {
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                    PLAYER(i).qSpeedAirX = +Q(0);
                    PLAYER(i).qSpeedGround = +Q(0);
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                    SetBit(basePipe->unk4C, i);
                }

            } else {
                // !GetBit(basePipe->unk4C, i)
                if ((((PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) && (PLAYER(i).SA2_LABEL(unk99)[0] < basePipe->unk4D))
                     || !basePipe->unk4D)) {
                    if ((worldX - 12 <= I(PLAYER(i).qWorldX)) && (worldX + 12 >= I(PLAYER(i).qWorldX))
                        && (worldY - 12 <= I(PLAYER(i).qWorldY)) && (worldY + 12 >= I(PLAYER(i).qWorldY))) {
                        basePipe->unk44[i] = 0;
                        basePipe->unk3C[i] = 0;
                        PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                        PLAYER(i).qSpeedAirY = -Q(0);
                        PLAYER(i).qSpeedAirX = +Q(0);
                        PLAYER(i).qSpeedGround = +Q(0);
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        m4aSongNumStart(SE_SPRING);

                        // NOTE (for Matching): Same problem as Task_MarbleTrack_Exit.
                        // An unnecessary 'mov r2, #0 ' was inserted in the original...
                        SetBit(basePipe->unk4C, i);

                        PLAYER(i).SA2_LABEL(unk99)[0] = basePipe->unk4D;
                        PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            }
        } else {
            if (GetBit(basePipe->unk4C, i)) {
                ClearBit(basePipe->unk4C, i);
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (!(basePipe->unk4C & 0x3)) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            s32 i = 0;
            do {
                if (PLAYER(i).SA2_LABEL(unk99)[0] == basePipe->unk4D) {
                    if (GetBit(basePipe->unk4C, i)) {
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                    }
                }
            } while (++i < gNumSingleplayerCharacters);

            SET_MAP_ENTITY_NOT_INITIALIZED(me, basePipe->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}
END_NONMATCH

void CreateEntity_MarbleTrack_Entrance(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MarbleTrack_Entrance, sizeof(MarbleTrackEntrance), 0x1900 + me->d.uData[3], 0,
                         TaskDestructor_MarbleTrack_Entrance);
    MarbleTrackEntrance *entrance = TASK_DATA(t);
    Sprite *s = &entrance->s;

    entrance->base.regionX = regionX;
    entrance->base.regionY = regionY;
    entrance->base.me = me;
    entrance->base.meX = me->x;
    entrance->base.id = id;

    entrance->unk3F = me->d.sData[0];
    entrance->unk3C[PLAYER_1] = 0;
    entrance->unk40[PLAYER_1] = 0;
    entrance->unk3C[PLAYER_2] = 0;
    entrance->unk40[PLAYER_2] = 0;
    entrance->unk48 = me->d.uData[2];
    entrance->unk3E = 0;
    entrance->unk4A = me->d.sData[1];

    SET_MAP_ENTITY_INITIALIZED(me);

#ifdef BUG_FIX
    // NOTE: Technically this is wrong, too, but at least it's consistent with most other interactables/gimmicks.
    s->x = TO_WORLD_POS(me->x, regionX); // What the..?
    s->y = TO_WORLD_POS(me->y, regionY);
#else
    s->x = TO_WORLD_POS_INV(0xFE, regionX); // What the..?
    s->y = TO_WORLD_POS(me->y, regionY);
#endif

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_MARBLE_TRACK_EXIT);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MARBLE_TRACK_EXIT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_MarbleTrack_Entrance(void)
{
    CamCoord worldX, worldY;
    s16 screenY, screenX;
    s16 sp0C;
    MarbleTrackEntrance *entrance = TASK_DATA(gCurTask);
    Sprite *s = &entrance->s;
    MapEntity *me = entrance->base.me;
    s32 i;

    worldX = TO_WORLD_POS(entrance->base.meX, entrance->base.regionX);
    worldY = TO_WORLD_POS(me->y, entrance->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            s32 sp1C;
            if (GetBit(entrance->unk3E, i)) {
                PLAYER(i).qSpeedAirY += Q(42. / 256.);

                sp1C = Q(worldX + Div(entrance->unk4A * entrance->unk3C[i], entrance->unk3F));

                PLAYER(i).qWorldY += PLAYER(i).qSpeedAirY;
                entrance->unk40[i] = entrance->unk40[i] + PLAYER(i).qSpeedAirY;
                PLAYER(i).qWorldX = sp1C;
                PLAYER(i).SA2_LABEL(unk80) += 4;

                if (PLAYER(i).SA2_LABEL(unk80) > 0x100) {
                    PLAYER(i).SA2_LABEL(unk80) = 0x100;
                }

                PLAYER(i).SA2_LABEL(unk82) = PLAYER(i).SA2_LABEL(unk80);

                if (entrance->unk3C[i] == 25) {
                    Player_Tails_InitGfxMarbleTrack(&PLAYER(i));
                }

                if ((++entrance->unk3C[i] >= entrance->unk3F) || (I(entrance->unk40[i]) > entrance->unk48)
                    || ((PLAYER(i).SA2_LABEL(unk99)[0] != 0x7F) && PLAYER(i).SA2_LABEL(unk99)[0] > me->d.uData[3])) {
                    ClearBit(entrance->unk3E, i);
                } else {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).qSpeedAirX = +Q(0);
                    PLAYER(i).qSpeedGround = +Q(0);
                    PLAYER(i).charState = CHARSTATE_32;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                    SetBit(entrance->unk3E, i);
                }
            } else {
                // !GetBit(entrance->unk3E, i)
                sp1C = PLAYER(i).qWorldX;

                if (sub_80549FC() && (PLAYER(i).charState != CHARSTATE_73)) {
                    if (PLAYER(i).qWorldY > Q(worldY) + Q(12)) {
                        if (Coll_Player_Platform(s, worldX, worldY, &PLAYER(i)) & 0x10000) {
                            PLAYER(i).qWorldY = Q(worldY + 23);
                        }
                    }
                } else if ((PLAYER(i).SA2_LABEL(unk99)[0] == 0x7F) && Coll_Player_Platform(s, worldX, worldY, &PLAYER(i)) & 0x8) {
                    entrance->unk3C[i] = 0;
                    entrance->unk40[i] = 0;
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).SA2_LABEL(unk99)[0] = me->d.uData[3];

                    PLAYER(i).qSpeedAirY = -Q(0);
                    PLAYER(i).qSpeedAirX = +Q(0);
                    PLAYER(i).qSpeedGround = +Q(0);
                    PLAYER(i).frameInput = 0;
                    PLAYER(i).heldInput = 0;
                    PLAYER(i).charState = CHARSTATE_32;
                    PLAYER(i).SA2_LABEL(unk80) = 0xB0;
                    PLAYER(i).SA2_LABEL(unk82) = 0xB0;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    m4aSongNumStart(SE_SPRING);

                    SetBit(entrance->unk3E, i);

                    PLAYER(i).qWorldX = sp1C;
#if 01
                    {
                        PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
#else
                    // NOTE: For matching..?
                    if (i != 0) {
                        gPartner.itemEffect |= gPartner.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
                    } else {
                        gPlayer.itemEffect |= gPlayer.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
                    }
#endif
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (!(entrance->unk3E & 0x3)) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            s32 i = 0;
            do {
                if (GetBit(entrance->unk3E, i)) {
                    if (me->d.uData[3] == PLAYER(i).SA2_LABEL(unk99)[0]) {
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            } while (++i < gNumSingleplayerCharacters);

            SET_MAP_ENTITY_NOT_INITIALIZED(me, entrance->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_MarbleTrack_Entrance(Task *t)
{
    MarbleTrackEntrance *entrance = TASK_DATA(t);
    VramFree(entrance->s.graphics.dest);
}

void CreateEntity_MarbleTrack_Exit(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MarbleTrack_Exit, sizeof(MarbleTrackExit), 0x2100 + me->d.sData[1], 0, TaskDestructor_MarbleTrack_Exit);
    MarbleTrackExit *exit = TASK_DATA(t);
    Sprite *s = &exit->s;

    exit->base.regionX = regionX;
    exit->base.regionY = regionY;
    exit->base.me = me;
    exit->base.meX = me->x;
    exit->base.id = id;

    exit->unk40 = 0;
    exit->unk44[PLAYER_1] = 0;
    exit->unk4C[PLAYER_1] = 0;
    exit->unk44[PLAYER_2] = 0;
    exit->unk4C[PLAYER_2] = 0;
    exit->unk3C = me->d.sData[0] * 8;
    exit->unk41 = me->d.uData[2];

    SET_MAP_ENTITY_INITIALIZED(me);

    s->x = TO_WORLD_POS_INV(0xFE, regionX); // TODO: What the..?
    s->y = TO_WORLD_POS(me->y, regionY);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_MARBLE_TRACK_EXIT);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MARBLE_TRACK_EXIT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (99.44%)
NONMATCH("asm/non_matching/game/sa1/stage/interactables/marble_track_exit__Task_MarbleTrack_Exit.inc", void Task_MarbleTrack_Exit(void))
{
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    s16 sp0C;
    MarbleTrackExit *exit = TASK_DATA(gCurTask);
    Sprite *s = &exit->s;
    MapEntity *me = exit->base.me;
    s32 i;

    worldX = TO_WORLD_POS(exit->base.meX, exit->base.regionX);
    worldY = TO_WORLD_POS(me->y, exit->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (exit->unk41 != 0) {
        sp0C = -24;
    } else {
        sp0C = 0;
    }
    // _08083868

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            // _080838A0
            if (GetBit(exit->unk40, i)) {
                // _080838B4
                PLAYER(i).qSpeedAirY += Q(42. / 256.);
                // _080838C6

                exit->unk4C[i] += PLAYER(i).qSpeedAirY;
                PLAYER(i).qWorldY = exit->unk4C[i];
                PLAYER(i).qWorldX = exit->unk44[i];
                // _08083906
                PLAYER(i).SA2_LABEL(unk80) -= 4;
                // _08083920

                if (PLAYER(i).SA2_LABEL(unk80) < 0xB0) {
                    PLAYER(i).SA2_LABEL(unk80) = 0xB0;
                }
                // _0808395E

                PLAYER(i).SA2_LABEL(unk82) = PLAYER(i).SA2_LABEL(unk80);
                PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                // _080839C8

                if (PLAYER(i).qSpeedAirY > Q(0)) {
                    // _080839E0

                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                    PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                    PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                    // _08083A64
                    ClearBit(exit->unk40, i);
                    PLAYER(i).SA2_LABEL(unk80) = 0x100;
                    PLAYER(i).SA2_LABEL(unk82) = 0x100;
                    PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                }
            } else {
                // !GetBit(exit->unk40, i)
                // _08083ADC
                if (PLAYER(i).SA2_LABEL(unk99)[0] != 0x7F) {
                    // _08083AF0
                    if ((worldX + sp0C <= I(PLAYER(i).qWorldX)) && (worldX + sp0C + 24 >= I(PLAYER(i).qWorldX))
                        && (worldY - 24 <= I(PLAYER(i).qWorldY)) && (worldY + 24 >= I(PLAYER(i).qWorldY))) {
                        // _08083B80
                        if (!GetBit(exit->unk40, i)) {
                            exit->unk44[i] = PLAYER(i).qWorldX;
                            exit->unk4C[i] = PLAYER(i).qWorldY;
                        }

                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                        PLAYER(i).moveState &= ~MOVESTATE_100;
                        PLAYER(i).moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
                        PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                        PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                        PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                        PLAYER(i).qSpeedAirY = -Q(5);
                        PLAYER(i).qSpeedAirX = +Q(0);
                        PLAYER(i).qSpeedGround = +Q(0);
                        PLAYER(i).heldInput = +Q(0);
                        PLAYER(i).frameInput = +Q(0);

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        m4aSongNumStart(SE_SPRING);

                        PLAYER(i).SA2_LABEL(unk99)[0] = 0x7F;

                        SetBit(exit->unk40, i);

#if 0
                        {
                            PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                        }
#else
                        // NOTE: For matching..?
                        if (i != 0) {
                            gPartner.itemEffect |= gPartner.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
                        } else {
                            gPlayer.itemEffect |= gPlayer.itemEffect | PLAYER_ITEM_EFFECT__TELEPORT;
                        }
#endif
                    }
                }
                // _08083D26

                if (!(PLAYER(i).moveState & MOVESTATE_IGNORE_INPUT)) {
                    Coll_Player_Platform(s, worldX, worldY, &PLAYER(i));
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);
    // _08083D7E

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        // _08083DA4

        s32 i = 0;
        do {
            if (GetBit(exit->unk40, i)) {
                PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, exit->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void TaskDestructor_MarbleTrack_Exit(Task *t)
{
    MarbleTrackExit *exit = TASK_DATA(t);
    VramFree(exit->s.graphics.dest);
}