#ifndef GUARD_SA1_BOSSES_SHARED_H
#define GUARD_SA1_BOSSES_SHARED_H

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
    /* 0x3C */ s16 unk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x48 */ u16 unk40;
    /* 0x48 */ s16 unk42;
    /* 0x44 */ s16 qUnk44;
    /* 0x46 */ s16 qUnk46;
    /* 0x48 */ s16 unk48;
} Strc_sub_80168F0; /* 0x4C */

void CreateBossCapsule(s16, s16);

void CreatePostBossEggMobile(CamCoord worldX, CamCoord worldY);

Task *sub_80168F0(CamCoord worldX, CamCoord worldY, u16 numTiles, AnimId anim, u8 variant); // -> Strc_sub_80168F0
Task *Bosses_SetCamBounds(CamCoord minY, CamCoord maxY, CamCoord minX, CamCoord maxX);
Task *CreatePreBossCameraPan(s16 yMin, s16 yMax);
Task *sub_8017540(s32 param0, s32 param1); // -> NutsAndBolts
Task *sub_8016D80(CamCoord worldX, CamCoord worldY, AnimId anim, u8 variant);
#endif // GUARD_SA1_BOSSES_SHARED_H