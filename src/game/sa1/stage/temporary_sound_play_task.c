#include "global.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/special_stage/main.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/songs.h"

typedef struct {
    struct MP2KPlayerState *songInfo;
    struct MP2KSongHeader *songHeader;
    u16 songId;
    u16 resumeSongId;
} TrickField;

void Task_TempSound(void);
void Task_8025884(void);
void Task_8025898(void);
void Task_SpStageTrick(void);
extern struct MP2KSongHeader mus_sp_stage_trick;

u8 gUnknown_03005730 = 0;

void Task_TempSound(void)
{
    TrickField *field = TASK_DATA(gCurTask);
    struct MP2KPlayerState *info = field->songInfo;
    u32 songStatus = info->status;

    if (((s32)songStatus < 0) || ((songStatus & 0xFFFF) == 0)) {
        struct MP2KPlayerState *info2;
        info2 = gMPlayTable[gSongTable[field->songId].ms].info;

        if (info2->songHeader == gSongTable[field->songId].header) {
            if ((field->songHeader == gSongTable[MUS_INVINCIBILITY].header) && !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                MPlayStart(info, field->songHeader);
                m4aMPlayImmInit(field->songInfo);
                m4aMPlayVolumeControl(field->songInfo, 0xFF, 4);
                MPlayStop(field->songInfo);
                TaskDestroy(gCurTask);
                return;
            } else {
                MPlayStart(field->songInfo, field->songHeader);
                m4aMPlayImmInit(field->songInfo);

                if (gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) {
                    m4aMPlayTempoControl(&gMPlayInfo_BGM, Q(2));
                }

                m4aMPlayVolumeControl(field->songInfo, 0xFF, 4);
                m4aMPlayFadeIn(field->songInfo, 4);
                TaskDestroy(gCurTask);
                return;
            }
        }
    }
}

void Task_CallTempSoundTask(void) { gCurTask->main = Task_TempSound; }

void Task_CallSpStageTrickTask(void) { gCurTask->main = Task_SpStageTrick; }

void Task_SpStageTrick(void)
{
    TrickField *field = TASK_DATA(gCurTask);
    struct MP2KPlayerState *info = field->songInfo;
    u32 songStatus = info->status;

    if (((s32)songStatus < 0) || ((songStatus & 0xFFFF) == 0)) {
        struct MP2KPlayerState *resumeInfo;
        m4aSongNumStartOrContinue(field->resumeSongId);

        resumeInfo = gMPlayTable[gSongTable[field->resumeSongId].ms].info;
        m4aMPlayVolumeControl(resumeInfo, 0xFF, 4);
        m4aMPlayFadeIn(resumeInfo, 4);
        TaskDestroy(gCurTask);

        gUnknown_03005730 = 0;
    }
}

// NOTE: Seems to be unused.
void CreateTempSoundTask(u16 songId)
{
    struct MP2KPlayerState *info = gMPlayTable[gSongTable[songId].ms].info;
    struct MP2KSongHeader *songHeader = info->songHeader;

    if (info->songHeader != gSongTable[songId].header) {
        Task *t = TaskCreate(Task_CallTempSoundTask, sizeof(TrickField), 0x3000, 0, NULL);
        TrickField *field = TASK_DATA(t);

        field->songInfo = info;
        field->songHeader = songHeader;
        field->songId = songId;
        m4aSongNumStart(songId);
    }
}

void CreateSpStageTrickSoundTask(u16 expectedSongId, u16 resumeSongId)
{
    struct MP2KPlayerState *info = gMPlayTable[MUSIC_PLAYER_SE3].info;
    struct MP2KSongHeader *songHeader = info->songHeader;

    if (songHeader != gSongTable[expectedSongId].header) {
        Task *t = TaskCreate(Task_CallSpStageTrickTask, sizeof(TrickField), 0x3000, 0, NULL);
        TrickField *field = TASK_DATA(t);

        field->songInfo = info;
        field->songHeader = songHeader;
        field->songId = expectedSongId;
        field->resumeSongId = resumeSongId;

        gUnknown_03005730 = 0xFF;
        MPlayStart(&gMPlayInfo_SE3, &mus_sp_stage_trick);
    }
}