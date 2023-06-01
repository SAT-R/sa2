#include "global.h"
#include "game/game.h"
#include "gba/m4a_internal.h"
#include "lib/m4a.h"

#include "constants/songs.h"

static void MusManager_UpdateBgmParams(void);
void sub_800BF74(u16 fadeoutSpeed);

const u16 gLevelSongs[] = {
    MUS_LEAF_FOREST__ACT_1,
    MUS_LEAF_FOREST__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_HOT_CRATER__ACT_1,
    MUS_HOT_CRATER__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_MUSIC_PLANT__ACT_1,
    MUS_MUSIC_PLANT__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_ICE_PARADISE__ACT_1,
    MUS_ICE_PARADISE__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_SKY_CANYON__ACT_1,
    MUS_SKY_CANYON__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_TECHNO_BASE__ACT_1,
    MUS_TECHNO_BASE__ACT_2,
    MUS_BOSS,
    MUS_BOSS_PINCH,
    MUS_EGG_UTOPIA__ACT_1,
    MUS_EGG_UTOPIA__ACT_2,
    MUS_7_BOSS,
    MUS_7_BOSS_PINCH,
    MUS_XX__FINAL_ZONE,
    MUS_TRUE_AREA_53,
    MUS_FINAL_BOSS,
    MUS_FINAL_BOSS_PINCH,
    MUS_BOSS_KNUCKLES,
    MUS_BOSS,
    MUS_BOSS,
    MUS_BOSS,
    MUS_BOSS,
    MUS_BOSS,
    MUS_BOSS,
    MUS_DUMMY,
};

const u16 gUnknown_080D5254[7] = {
    SE_260, 0xF000, 0x1008, 0x8F0, 0xF000, 0x1008, 0x1F0,

};

void Task_StageMusicManager(void)
{
    struct SongHeader *songHeader = gMPlayTable[0].info->songHeader;

    if ((gUnknown_030054A8.unk0 == 0) && PLAYER_IS_ALIVE) {
        if ((gUnknown_030054A8.unk1 & 0xF0) == 0x30) {
            MPlayStop(&gMPlayInfo_BGM);

            gUnknown_030054A8.unk0 = 0xFF;
            gUnknown_030054A8.unk1 &= 0x0F;
        } else if (gUnknown_030054A8.unk6 != 0) {
            sub_800BF74(gUnknown_030054A8.unk6);

            gUnknown_030054A8.unk0 = 0xFF;
            gUnknown_030054A8.unk6 = 0;
            gUnknown_030054A8.unk5 = 1;
        } else if ((songHeader == gSongTable[MUS_DROWNING].header)
                   && ((gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK) != 0)
                   && ((gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE) == 0)) {
            gUnknown_030054A8.unk5 = 1;
            gUnknown_030054A8.unk2 = 0;
            gUnknown_030054A8.unk3 = 0;
        } else if (gUnknown_030054A8.unk4 != 0) {
            gUnknown_030054A8.unk4 = 0;
            gUnknown_030054A8.unk5 = 1;

            m4aSongNumStart(MUS_DROWNING);
        } else if ((songHeader == gSongTable[MUS_INVINCIBILITY].header)
                   && ((gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK) != 0)
                   && (!(gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE))
                   && ((gPlayer.unk37 & FLAG_PLAYER_x37__INVINCIBLE) == 0)) {
            gUnknown_030054A8.unk5 = 1;
            m4aSongNumStop(MUS_INVINCIBILITY);
        } else if ((songHeader != gSongTable[MUS_1_UP].header)
                   && (songHeader != gSongTable[MUS_INVINCIBILITY].header)
                   && (gPlayer.unk37 & FLAG_PLAYER_x37__INVINCIBLE)
                   && (gUnknown_030054A8.unk2 == 0)) {
            gUnknown_030054A8.unk2 = 0;
            gUnknown_030054A8.unk5 = 1;
            m4aSongNumStart(MUS_INVINCIBILITY);
            MusManager_UpdateBgmParams();
        } else if (gUnknown_030054A8.unk2 != 0) {
            gUnknown_030054A8.unk2 = 0;
            gUnknown_030054A8.unk5 = 1;
            m4aSongNumStart(MUS_INVINCIBILITY);
        } else if (gUnknown_030054A8.unk3 != 0) {
            gUnknown_030054A8.unk3 = 0;
            gUnknown_030054A8.unk5 = 1;
            m4aSongNumStart(MUS_1_UP);
        } else if ((gUnknown_030054A8.unk1 & 0xF0) == 0x10) {
            u32 unk1 = gUnknown_030054A8.unk1 &= 0x0F;

            m4aSongNumStart(gLevelSongs[gCurrentLevel + unk1]);
        } else if (((gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK) == 0)
                   || (gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE)) {
            if ((gUnknown_030054A8.unk1 & 0xF0) == 0x20) {
                m4aSongNumStart(gUnknown_080D5254[gUnknown_030054A8.unk1]);

                MusManager_UpdateBgmParams();
            } else {
                m4aSongNumStartOrContinue(
                    gLevelSongs[gCurrentLevel + (gUnknown_030054A8.unk1 & 0x0F)]);

                if (gUnknown_030054A8.unk5 != 0) {
                    gUnknown_030054A8.unk5 = 0;
                    MusManager_UpdateBgmParams();
                }
            }
        }
    }
}

void CreateStageMusicManager(void)
{
    TaskCreate(Task_StageMusicManager, 0, 0x4000, 0, NULL);

    gUnknown_030054A8.unk0 = 0;
    gUnknown_030054A8.unk1 = 0;
    gUnknown_030054A8.unk2 = 0;
    gUnknown_030054A8.unk3 = 0;
    gUnknown_030054A8.unk4 = 0;
    gUnknown_030054A8.unk5 = 0;
    gUnknown_030054A8.unk6 = 0;
}

static void MusManager_UpdateBgmParams(void)
{
    struct MusicPlayerInfo *bgmInfo = &gMPlayInfo_BGM;

    m4aMPlayImmInit(bgmInfo);
    m4aMPlayVolumeControl(bgmInfo, 0xFF, 4);
    m4aMPlayFadeIn(bgmInfo, 4);

    if (gPlayer.unk37 & FLAG_PLAYER_x37__SPEEDUP) {
        m4aMPlayTempoControl(bgmInfo, 0x200);
    }
}

void sub_800BF74(u16 fadeoutSpeed)
{
    struct MusicPlayerInfo *bgmInfo = &gMPlayInfo_BGM;

    m4aMPlayFadeOutTemporarily(bgmInfo, fadeoutSpeed / 16);

    if (gPlayer.unk37 & FLAG_PLAYER_x37__SPEEDUP) {
        m4aMPlayTempoControl(bgmInfo, 0x200);
    }
}
