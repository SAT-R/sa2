#include "global.h"
#include "core.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/player.h"
#include "game/sa1_sa2_shared/music_manager.h"

#include "lib/m4a/m4a.h"

#include "constants/songs.h"

static void MusManager_UpdateBgmParams(void);
void MusManager_Fadeout(u16 fadeoutSpeed);

#if (GAME == GAME_SA1)
ALIGNED(4)
const u16 gLevelSongs[] = {
    MUS_NEO_GREEN_HILL__ACT_1,
    MUS_NEO_GREEN_HILL__ACT_2,
    MUS_SECRET_BASE__ACT_1,
    MUS_SECRET_BASE__ACT_2,
    MUS_CASINO_PARADISE__ACT_1,
    MUS_CASINO_PARADISE__ACT_2,
    MUS_ICE_MOUNTAIN__ACT_1,
    MUS_ICE_MOUNTAIN__ACT_2,
    MUS_ANGEL_ISLAND__ACT_1,
    MUS_ANGEL_ISLAND__ACT_2,
    MUS_EGG_ROCKET,
    MUS_COSMIC_ANGEL,
    MUS_X_ZONE,
    MUS_EXTRA_BOSS,

    // MP Chao Gardens
    MUS_NEO_GREEN_HILL__ACT_1,
    MUS_SECRET_BASE__ACT_1,
    MUS_CASINO_PARADISE__ACT_1,
    MUS_COSMIC_ANGEL,
};
#elif (GAME == GAME_SA2)
ALIGNED(4)
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
#endif

#if (GAME == GAME_SA1)
const u16 gUnkMusicMgrData[7] = { 0x001D, 0x001E, 0x001F, 0x0020, 0x0031, 0x0032, 0x0019 };
#elif (GAME == GAME_SA2)
// This data is unrelated to this module in SA2 but has been linked in here by some
// compilation quirk, see it's actual usage in input_buffer.c
#ifndef NON_MATCHING
const u16 gUnkMusicMgrData[7] = { 0x0104, 0xF000, 0x1008, 0x08F0, 0xF000, 0x1008, 0x01F0 };
#else
const u16 gUnkMusicMgrData[0] = {};
#endif
#endif

#if (GAME == GAME_SA1)
#define SET_UNK5(v)
#elif (GAME == GAME_SA2)
#define SET_UNK5(v) gMusicManagerState.unk5 = (v);
#endif

void Task_StageMusicManager(void)
{
#if (GAME == GAME_SA1)
    // TODO: Integrate SA2 version of sound lib!
    struct SongHeader *songHeader = gMPlayTable[0].info->songHeader;
#else
    struct MP2KSongHeader *songHeader = gMPlayTable[0].info->songHeader;
#endif

    if ((gMusicManagerState.unk0 == 0) && PLAYER_IS_ALIVE) {
#if (GAME == GAME_SA2)
        if ((gMusicManagerState.unk1 & (0x10 | 0x20 | 0x40 | 0x80)) == (0x10 | 0x20)) {
            MPlayStop(&gMPlayInfo_BGM);

            gMusicManagerState.unk0 = 0xFF;
            gMusicManagerState.unk1 &= 0x0F;
        } else if (gMusicManagerState.fadeoutSpeed != 0) {
            MusManager_Fadeout(gMusicManagerState.fadeoutSpeed);

            gMusicManagerState.unk0 = 0xFF;
            gMusicManagerState.fadeoutSpeed = 0;
            SET_UNK5(1);
        } else
#endif
            if ((songHeader == gSongTable[MUS_DROWNING].header) && (gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK)
                && !(gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE)) {
            SET_UNK5(1);
            gMusicManagerState.unk2 = 0;
            gMusicManagerState.unk3 = 0;
        } else if (gMusicManagerState.unk4 != 0) {
            gMusicManagerState.unk4 = 0;
            SET_UNK5(1);

            m4aSongNumStart(MUS_DROWNING);
        } else if ((songHeader == gSongTable[MUS_INVINCIBILITY].header) && (gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK)
                   && !(gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE) && !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            SET_UNK5(1);
            m4aSongNumStop(MUS_INVINCIBILITY);
        } else if ((songHeader != gSongTable[MUS_1_UP].header) && (songHeader != gSongTable[MUS_INVINCIBILITY].header)
                   && (gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) && (gMusicManagerState.unk2 == 0)) {
            gMusicManagerState.unk2 = 0;
            SET_UNK5(1);
            m4aSongNumStart(MUS_INVINCIBILITY);
            MusManager_UpdateBgmParams();
        } else if (gMusicManagerState.unk2 != 0) {
            gMusicManagerState.unk2 = 0;
            SET_UNK5(1);
            m4aSongNumStart(MUS_INVINCIBILITY);
        } else if (gMusicManagerState.unk3 != 0) {
            gMusicManagerState.unk3 = 0;
            SET_UNK5(1);
            m4aSongNumStart(MUS_1_UP);
        } else if ((gMusicManagerState.unk1 & (0x10 | 0x20 | 0x40 | 0x80)) == 0x10) {
            u32 offset = (gMusicManagerState.unk1 &= 0x0F);

#if (GAME == GAME_SA1)
            m4aSongNumStart(gUnkMusicMgrData[gMusicManagerState.unk1]);
            gMusicManagerState.unk1 |= 0x20;
#else
            m4aSongNumStart(gLevelSongs[gCurrentLevel + offset]);
#endif
#if (GAME == GAME_SA1)
        } else if ((gMusicManagerState.unk1 & (0x10 | 0x20 | 0x40 | 0x80)) == 0x30) {
            gMusicManagerState.unk1 &= 0xF;
            m4aSongNumStop(gUnkMusicMgrData[gMusicManagerState.unk1]);

            m4aSongNumStart(gLevelSongs[gCurrentLevel]);
            MusManager_UpdateBgmParams();

            if ((u8)(gMusicManagerState.unk1 - 4) > 1) {
                gMusicManagerState.unk0 = 0xFF;
            }
            gMusicManagerState.unk1 = 0;
#endif
        } else if (((gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_TRACK) == 0) || (gMPlayInfo_BGM.status & MUSICPLAYER_STATUS_PAUSE)) {
            if ((gMusicManagerState.unk1 & (0x10 | 0x20 | 0x40 | 0x80)) == 0x20) {
#if (GAME == GAME_SA1)
                m4aSongNumStart(gUnkMusicMgrData[gMusicManagerState.unk1 & 0xF]);
#else
                m4aSongNumStart(gUnkMusicMgrData[gMusicManagerState.unk1]);
#endif
                MusManager_UpdateBgmParams();
            } else {
#if (GAME == GAME_SA1)
                m4aSongNumStart(gLevelSongs[gCurrentLevel]);
                MusManager_UpdateBgmParams();
#elif (GAME == GAME_SA2)
                m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel + (gMusicManagerState.unk1 & 0x0F)]);
                if (gMusicManagerState.unk5 != 0) {
                    SET_UNK5(0)
                    MusManager_UpdateBgmParams();
                }
#endif
            }
        }
    }
}

void CreateStageMusicManager(void)
{
    TaskCreate(Task_StageMusicManager, 0, 0x4000, 0, NULL);

    gMusicManagerState.unk0 = 0;
    gMusicManagerState.unk1 = 0;
    gMusicManagerState.unk2 = 0;
    gMusicManagerState.unk3 = 0;
    gMusicManagerState.unk4 = 0;
#if (GAME == GAME_SA2)
    SET_UNK5(0)
    gMusicManagerState.fadeoutSpeed = 0;
#endif
}

static void MusManager_UpdateBgmParams(void)
{
#if (GAME == GAME_SA1)
    struct MusicPlayerInfo *bgmInfo = &gMPlayInfo_BGM;
#else
    struct MP2KPlayerState *bgmInfo = &gMPlayInfo_BGM;
#endif

    m4aMPlayImmInit(bgmInfo);
    m4aMPlayVolumeControl(bgmInfo, 0xFF, 4);
    m4aMPlayFadeIn(bgmInfo, 4);

    if (gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) {
        m4aMPlayTempoControl(bgmInfo, 0x200);
    }
}

#if (GAME == GAME_SA2)
void MusManager_Fadeout(u16 fadeoutSpeed)
{
#if (GAME == GAME_SA1)
    struct MusicPlayerInfo *bgmInfo = &gMPlayInfo_BGM;
#else
    struct MP2KPlayerState *bgmInfo = &gMPlayInfo_BGM;
#endif

    m4aMPlayFadeOutTemporarily(bgmInfo, fadeoutSpeed / 16);

    if (gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) {
        m4aMPlayTempoControl(bgmInfo, 0x200);
    }
}
#endif
