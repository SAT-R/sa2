#include "global.h"
#include "lib/agb_flash/agb_flash.h"
#include "malloc_ewram.h"
#include "flags.h"
#include "game/save.h"
#include "lib/m4a/m4a.h"
#include "game/math.h"
#include "constants/text.h"
#include "constants/zones.h"

struct SaveSectorHeader {
    u32 security, version;
};

struct SaveSectorData {
    struct SaveSectorHeader header;
    u32 unk8;

    u16 playerName[MAX_PLAYER_NAME_LENGTH];

    u8 language;
    u8 gamePlayOptions;

    u8 completions;

    u8 unlocks;

    u8 jumpControl;
    u8 attackControl;
    u8 trickControl;

    u8 unlockedLevels[NUM_CHARACTERS];
    u8 chaosEmeralds[NUM_CHARACTERS];

    u8 multiplayerWins;
    u8 multiplayerLoses;
    u8 multiplayerDraws;

    // timeRecords
    struct TimeRecords timeRecords;

    struct MultiplayerScore multiplayerScores[NUM_MULTIPLAYER_SCORES];

    u32 id;

    u32 score;
    u32 checksum;
};

struct SaveGame *gLastWrittenSaveGame = NULL;
struct SaveGame *gLoadedSaveGame = NULL;
struct SaveSectorData *gSaveSectorDataBuffer = NULL;

static s16 FindNewestSaveGameSector(void);
static s16 FindOldestSaveGameSector(void);

static bool16 UnpackSaveSectorData(struct SaveGame *gameState, struct SaveSectorData *save);
static bool16 PackSaveSectorData(struct SaveSectorData *save, struct SaveGame *gameState);

static bool16 ReadSaveSectorAndVerifyChecksum(struct SaveSectorData *save, s16 sectorNum);
static u16 WriteToSaveSector(struct SaveSectorData *data, s16 sectorNum);
static u16 EraseSaveSector(s16 sectorNum);
static bool16 HasChangesToSave(void);
static bool16 StringEquals(u16 *string1, u16 *string2, s16 length);

#define CalcChecksum(save)                                                                                                                 \
    ({                                                                                                                                     \
        u32 j, checksum = 0;                                                                                                               \
        for (j = 0; j < SECTOR_CHECKSUM_OFFSET; j += sizeof(uintptr_t)) {                                                                  \
            checksum += *(uintptr_t *)((void *)(save) + j);                                                                                \
        }                                                                                                                                  \
        checksum;                                                                                                                          \
    })

#define UNLOCK_FLAG_CREAM       (1 << 0)
#define UNLOCK_FLAG_TAILS       (1 << 1)
#define UNLOCK_FLAG_KNUCKLES    (1 << 2)
#define UNLOCK_FLAG_AMY         (1 << 3)
#define UNLOCK_FLAG_BOSS_TA     (1 << 4)
#define UNLOCK_FLAG_SOUND_TEST  (1 << 5)
#define UNLOCK_FLAG_CHAO_GARDEN (1 << 6)

#define GAME_PLAY_OPTION_DIFFICULTY_EASY     1
#define GAME_PLAY_OPTION_TIME_LIMIT_DISABLED 2

#define PACKED_A_BUTTON 1
#define PACKED_B_BUTTON 2
#define PACKED_R_BUTTON 4

#define SECTOR_CHECKSUM_OFFSET offsetof(struct SaveSectorData, checksum)
#define NUM_SAVE_SECTORS       10

// If the sector's security field is not this value then the sector is either invalid or
// empty.
#if (GAME == GAME_SA1)
#define SECTOR_SECURITY_NUM 0x4F524950
#elif (GAME == GAME_SA2)
#define SECTOR_SECURITY_NUM 0x4547474D
#elif (GAME == GAME_SA3)
#define SECTOR_SECURITY_NUM 0x47544E4C
#endif

void InsertMultiplayerProfile(u32 playerId, u16 *name)
{
    s16 i, j;

    for (i = 0; i < 10; i++) {
        struct MultiplayerScore *score = &gLoadedSaveGame->multiplayerScores[i];
        if (playerId == score->playerId && StringEquals(name, score->playerName, MAX_PLAYER_NAME_LENGTH)) {
            struct MultiplayerScore scoreCopy;
            memcpy(&scoreCopy, score, sizeof(struct MultiplayerScore));

            for (j = i; j > 0; j--) {
                gLoadedSaveGame->multiplayerScores[j] = gLoadedSaveGame->multiplayerScores[j - 1];
            }
            memcpy(&gLoadedSaveGame->multiplayerScores[0], &scoreCopy, sizeof(struct MultiplayerScore));
            return;
        }
    }

    // otherwise, insert the score at the beginning
    for (i = 9; i > 0; i--) {
        gLoadedSaveGame->multiplayerScores[i] = gLoadedSaveGame->multiplayerScores[i - 1];
    }

    gLoadedSaveGame->multiplayerScores[0].playerId = playerId;
    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        gLoadedSaveGame->multiplayerScores[0].playerName[i] = name[i];
    }
    gLoadedSaveGame->multiplayerScores[0].slotFilled = TRUE;
    gLoadedSaveGame->multiplayerScores[0].wins = 0;
    gLoadedSaveGame->multiplayerScores[0].losses = 0;
    gLoadedSaveGame->multiplayerScores[0].draws = 0;
}

void RecordOwnMultiplayerResult(s16 result)
{
    switch (result) {
        case MULTIPLAYER_RESULT_WIN:
            if (gLoadedSaveGame->multiplayerWins < MAX_MULTIPLAYER_SCORE) {
                gLoadedSaveGame->multiplayerWins++;
            }
            break;
        case MULTIPLAYER_RESULT_LOSS:
            if (gLoadedSaveGame->multiplayerLoses < MAX_MULTIPLAYER_SCORE) {
                gLoadedSaveGame->multiplayerLoses++;
            }
            break;
        case MULTIPLAYER_RESULT_DRAW:
            if (gLoadedSaveGame->multiplayerDraws < MAX_MULTIPLAYER_SCORE) {
                gLoadedSaveGame->multiplayerDraws++;
            }
            break;
    }
}

void RecordMultiplayerResult(u32 id, u16 *name, s16 result)
{
    s16 i;

    for (i = 0; i < NUM_MULTIPLAYER_SCORES; i++) {
        struct MultiplayerScore *score = &gLoadedSaveGame->multiplayerScores[i];
        if (id == score->playerId && StringEquals(name, score->playerName, MAX_PLAYER_NAME_LENGTH)) {
            switch (result) {
                case MULTIPLAYER_RESULT_WIN:
                    if (score->wins < MAX_MULTIPLAYER_SCORE) {
                        score->wins++;
                    }
                    break;
                case MULTIPLAYER_RESULT_LOSS:
                    if (score->losses < MAX_MULTIPLAYER_SCORE) {
                        score->losses++;
                    }
                    break;
                case MULTIPLAYER_RESULT_DRAW:
                    if (score->draws < MAX_MULTIPLAYER_SCORE) {
                        score->draws++;
                    }
                    break;
            }
            return;
        }
    }
}

static void GenerateNewSaveGame(struct SaveGame *gameState)
{
    s16 i, *record;
    struct MultiplayerScore *multiplayerScore;
    struct ButtonConfig *buttonConfig;

    memset(gameState, 0, sizeof(struct SaveGame));

    gameState->id = 0;
    gameState->unlockedCharacters = CHARACTER_BIT(CHARACTER_SONIC);
    gameState->difficultyLevel = 0;
    gameState->timeLimitDisabled = 0;
#ifdef JAPAN
    gameState->language = LANG_JAPANESE;
#else
    gameState->language = LANG_ENGLISH;
#endif
    gameState->playerName[0] = PLAYER_NAME_END_CHAR;

    buttonConfig = &gameState->buttonConfig;

    buttonConfig->jump = A_BUTTON;
    buttonConfig->attack = B_BUTTON;
    buttonConfig->trick = R_BUTTON;

    record = (void *)gameState->timeRecords.table;
    for (i = 0; i < NUM_TIME_RECORD_ROWS; i++, record++) {
        *record = (s16)MAX_COURSE_TIME;
    }

    gameState->multiplayerWins = 0;
    gameState->multiplayerLoses = 0;
    gameState->multiplayerDraws = 0;

    multiplayerScore = gameState->multiplayerScores;
    for (i = 0; i < NUM_MULTIPLAYER_SCORES; i++, multiplayerScore++) {
        multiplayerScore->slotFilled = FALSE;
        multiplayerScore->wins = 0;
        multiplayerScore->losses = 0;
        multiplayerScore->draws = 0;
        multiplayerScore->playerName[0] = PLAYER_NAME_END_CHAR;
    }

    gameState->score = 0;
    gameState->completedCharacters[CHARACTER_AMY] = FALSE;
    gameState->extraZoneStatus = 0;
    gameState->extraEndingCreditsPlayed = FALSE;

    gameState->completedCharacters[CHARACTER_SONIC] = FALSE;
    gameState->completedCharacters[CHARACTER_CREAM] = FALSE;
    gameState->completedCharacters[CHARACTER_TAILS] = FALSE;
    gameState->completedCharacters[CHARACTER_KNUCKLES] = FALSE;
}

static void InitSaveGameSectorData(struct SaveSectorData *save)
{
    s16 i, *record;
    struct MultiplayerScore *p2;

    memset(save, 0, sizeof(struct SaveSectorData));

    save->header.security = SECTOR_SECURITY_NUM;
    save->header.version = 0;
    save->unk8 = 0;
    save->playerName[0] = PLAYER_NAME_END_CHAR;
#ifdef JAPAN
    save->language = LANG_JAPANESE;
#else
    save->language = LANG_ENGLISH;
#endif
    save->unlocks = 0;
    save->completions = 0;
    save->gamePlayOptions = 0;
    save->jumpControl = 1;
    save->attackControl = 2;
    save->trickControl = 4;
    save->multiplayerWins = 0;
    save->multiplayerLoses = 0;
    save->multiplayerDraws = 0;

    record = (s16 *)save->timeRecords.table;
    for (i = 0; i < NUM_TIME_RECORD_ROWS; i++, record++) {
        *record = (s16)MAX_COURSE_TIME;
    }

    p2 = save->multiplayerScores;
    for (i = 0; i < 10; i++, p2++) {
        p2->slotFilled = FALSE;
        p2->wins = 0;
        p2->losses = 0;
        p2->draws = 0;
        p2->playerName[0] = PLAYER_NAME_END_CHAR;
    }

    save->score = 0;
}

static s16 TryWriteSaveGame(void)
{
    s16 sectorToWrite, flashError;

    struct SaveGame *lastWrittenGameState, *gameState;
    struct SaveSectorData *save;

    gameState = gLoadedSaveGame;
    lastWrittenGameState = gLastWrittenSaveGame;
    save = gSaveSectorDataBuffer;

    if (gameState->id == 0) {
        gameState->id = Random32();
    }

    // Keep a copy of the last game state
    memcpy(lastWrittenGameState, gameState, sizeof(struct SaveGame));
    PackSaveSectorData(save, lastWrittenGameState);

    // Only write if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        sectorToWrite = FindOldestSaveGameSector();

        // Couldn't find an oldest sector
        if (sectorToWrite == -1) {
            sectorToWrite = 0;
        }

        flashError = WriteToSaveSector(save, sectorToWrite);

        if (!flashError) {
            return TRUE;
        }
    }

#if TAS_TESTING
    // Takes about 12 frames to write in the real gba
    gInputRecorder.playbackHead += 12;
#endif
    return FALSE;
}

static bool16 PackSaveSectorData(struct SaveSectorData *save, struct SaveGame *gameState)
{
    s16 i;
    u32 checksum, version;

    version = save->header.version;
    memset(save, 0, sizeof(struct SaveSectorData));

    save->header.security = SECTOR_SECURITY_NUM;
    save->header.version = version + 1;

    save->unk8 = gameState->id;
    memcpy(save->playerName, gameState->playerName, sizeof(gameState->playerName));
    save->language = gameState->language;

    save->gamePlayOptions = 0;
    if (gameState->difficultyLevel != 0) {
        save->gamePlayOptions |= GAME_PLAY_OPTION_DIFFICULTY_EASY;
    }

    if (gameState->timeLimitDisabled) {
        save->gamePlayOptions |= GAME_PLAY_OPTION_TIME_LIMIT_DISABLED;
    }

    save->completions = 0;
    if (gameState->completedCharacters[CHARACTER_AMY]) {
        save->completions |= 1;
    }
    if (gameState->extraZoneStatus) {
        save->completions |= (gameState->extraZoneStatus << 1) & 6;
    }
    if (gameState->extraEndingCreditsPlayed) {
        save->completions |= 8;
    }
    if (gameState->completedCharacters[CHARACTER_SONIC]) {
        save->completions |= 0x10;
    }
    if (gameState->completedCharacters[CHARACTER_CREAM]) {
        save->completions |= 0x20;
    }
    if (gameState->completedCharacters[CHARACTER_TAILS]) {
        save->completions |= 0x40;
    }
    if (gameState->completedCharacters[CHARACTER_KNUCKLES]) {
        save->completions |= 0x80;
    }

    save->unlocks = 0;
    if ((gameState->unlockedCharacters & CHARACTER_BIT(CHARACTER_CREAM))) {
        save->unlocks |= UNLOCK_FLAG_CREAM;
    }
    if ((gameState->unlockedCharacters & CHARACTER_BIT(CHARACTER_TAILS))) {
        save->unlocks |= UNLOCK_FLAG_TAILS;
    }
    if ((gameState->unlockedCharacters & CHARACTER_BIT(CHARACTER_KNUCKLES))) {
        save->unlocks |= UNLOCK_FLAG_KNUCKLES;
    }
    if ((gameState->unlockedCharacters & CHARACTER_BIT(CHARACTER_AMY))) {
        save->unlocks |= UNLOCK_FLAG_AMY;
    }
    if (gameState->soundTestUnlocked) {
        save->unlocks |= UNLOCK_FLAG_SOUND_TEST;
    }
    if (gameState->bossTimeAttackUnlocked) {
        save->unlocks |= UNLOCK_FLAG_BOSS_TA;
    }
    if (gameState->chaoGardenUnlocked) {
        save->unlocks |= UNLOCK_FLAG_CHAO_GARDEN;
    }

    switch (gameState->buttonConfig.jump) {
        case B_BUTTON:
            save->jumpControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->jumpControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->jumpControl = PACKED_R_BUTTON;
            break;
    }

    switch (gameState->buttonConfig.attack) {
        case B_BUTTON:
            save->attackControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->attackControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->attackControl = PACKED_R_BUTTON;
            break;
    }

    switch (gameState->buttonConfig.trick) {
        case B_BUTTON:
            save->trickControl = PACKED_B_BUTTON;
            break;
        case A_BUTTON:
            save->trickControl = PACKED_A_BUTTON;
            break;
        case R_BUTTON:
            save->trickControl = PACKED_R_BUTTON;
            break;
    }

    for (i = 0; i < NUM_CHARACTERS; i++) {
        save->unlockedLevels[i] = gameState->unlockedLevels[i];
    }

    for (i = 0; i < NUM_CHARACTERS; i++) {
        save->chaosEmeralds[i] = gameState->chaosEmeralds[i];
    }

    save->multiplayerWins = gameState->multiplayerWins;
    save->multiplayerLoses = gameState->multiplayerLoses;
    save->multiplayerDraws = gameState->multiplayerDraws;

    memcpy(&save->timeRecords, &gameState->timeRecords, sizeof(gameState->timeRecords));
    memcpy(save->multiplayerScores, gameState->multiplayerScores, sizeof(gameState->multiplayerScores));

    save->id = Random32();
    save->score = gameState->score;

    checksum = CalcChecksum(save);
    save->checksum = checksum;

    return TRUE;
}

static s16 FindOldestSaveGameSector(void)
{
    struct SaveSectorHeader sectors[10];
    s16 i;
    u32 maxVersion = 0, minVersion = 0xffffffff;
    s16 bestSector = 0xffff;

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));

        if (sectors[i].security != SECTOR_SECURITY_NUM) {
            // If this sector is empty, use it
            return i;
        }

        if (sectors[i].version > maxVersion) {
            maxVersion = sectors[i].version;
        }

        if (sectors[i].version < minVersion) {
            bestSector = i;
            minVersion = sectors[i].version;
        }
    }

    if (maxVersion != ~0) {
        return bestSector;
    }

    minVersion = 0xffff0000;
    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        if (minVersion > 0xffff0000 && sectors[i].version < minVersion) {
            bestSector = i;
            minVersion = sectors[i].version;
        }
    }

    if (minVersion != 0xffff0000) {
        return bestSector;
    }

    // Could not find a suitable sector
    return -1;
}

static u16 WriteToSaveSector(struct SaveSectorData *data, s16 sectorNum)
{
    u32 preIE;
    u32 preIME;
    u32 preDISPSTAT;
    u16 result;

    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    gFlags |= FLAGS_8000;

    preIE = REG_IE;
    preIME = REG_IME;
    preDISPSTAT = REG_DISPSTAT;

    REG_IE = 0;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    gFlags &= ~4;

    DmaStop(0);
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);

    result = ProgramFlashSectorAndVerifyNBytes(sectorNum, data, sizeof(struct SaveSectorData));

    REG_IE = preIE;
    REG_IME = preIME;
    REG_DISPSTAT = preDISPSTAT;

    m4aSoundVSyncOn();
    gFlags &= ~FLAGS_8000;

    return result;
}

static bool16 TryLoadLatestSaveGame(void)
{
    s16 sectorNum, i, successfulRead;

    struct SaveGame *lastSavedData, *gameState;
    struct SaveSectorData *save;

    gameState = gLoadedSaveGame;
    lastSavedData = gLastWrittenSaveGame;
    save = gSaveSectorDataBuffer;

    i = 0;

    // Keep a copy of the last game state
    memcpy(lastSavedData, gameState, sizeof(struct SaveGame));

    // Only read if we actually have game flash
    if (!(gFlags & FLAGS_NO_FLASH_MEMORY)) {
        // Get the last sector num where there is save data
        sectorNum = FindNewestSaveGameSector();
        do {
            successfulRead = ReadSaveSectorAndVerifyChecksum(save, sectorNum);
            if (!successfulRead) {
                i++;
                EraseSaveSector(sectorNum);
                // If we reach the first sector
                // loop back around so we get a
                // chence to try them all
                if (sectorNum == 0) {
                    sectorNum = 9;
                } else {
                    sectorNum--;
                };
            } else {
                // We had a success reading the data
                // to we can continue with the copied save data
                break;
            }
        } while (i < 10);

        if (successfulRead) {
            UnpackSaveSectorData(gameState, save);
            memcpy(lastSavedData, gameState, sizeof(struct SaveGame));
            return TRUE;
        }
    }

    return FALSE;
}

// When a save is made, we write to a new sector
// and keep the old game/save. Incase a save sector
// becomes corrupted we can always use the
// previous save instead
static s16 FindNewestSaveGameSector(void)
{
    // Thanks to jiang for the match on this one
    struct SaveSectorHeader sectors[10];
    s16 i;
    u32 maxVersion = 0, minVersion = 0xffffffff;
    s16 bestSector = 0;

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));
        // If the value we just read was this
        if (sectors[i].security == SECTOR_SECURITY_NUM) {
            if (sectors[i].version > maxVersion) {
                bestSector = i;
                maxVersion = sectors[i].version;
            }

            if (sectors[i].version < minVersion) {
                minVersion = sectors[i].version;
            }
        }
    }

    if (minVersion > 0) {
        return bestSector;
    }

    // if we found a min version number of 0
    // look through all the sectors for the highest
    // version number until we get to a version number
    // of <= 0xffff
    maxVersion = 0;
    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        if (maxVersion <= 0xFFFF && sectors[i].version > maxVersion) {
            bestSector = i;
            maxVersion = sectors[i].version;
        }
    }

    return bestSector;
}

static bool16 UnpackSaveSectorData(struct SaveGame *gameState, struct SaveSectorData *save)
{
    s16 i;

    memset(gameState, 0, sizeof(struct SaveGame));
    memcpy(gameState->playerName, save->playerName, sizeof(save->playerName));

    gameState->id = save->unk8;
    gameState->language = save->language;

    if (save->gamePlayOptions & GAME_PLAY_OPTION_DIFFICULTY_EASY) {
        gameState->difficultyLevel = 1;
    }

    if (save->gamePlayOptions & GAME_PLAY_OPTION_TIME_LIMIT_DISABLED) {
        gameState->timeLimitDisabled = TRUE;
    }

    if ((save->completions & 1)) {
        gameState->completedCharacters[CHARACTER_AMY] = TRUE;
    }
    if ((save->completions & 6)) {
        gameState->extraZoneStatus = (save->completions & 6) >> 1;
    }
    if ((save->completions & 8)) {
        gameState->extraEndingCreditsPlayed = TRUE;
    }
    if ((save->completions & 0x10)) {
        gameState->completedCharacters[CHARACTER_SONIC] = TRUE;
    }
    if ((save->completions & 0x20)) {
        gameState->completedCharacters[CHARACTER_CREAM] = TRUE;
    }
    if ((save->completions & 0x40)) {
        gameState->completedCharacters[CHARACTER_TAILS] = TRUE;
    }
    if ((save->completions & 0x80)) {
        gameState->completedCharacters[CHARACTER_KNUCKLES] = TRUE;
    }

    gameState->unlockedCharacters = CHARACTER_BIT(CHARACTER_SONIC);

    if (save->unlocks & UNLOCK_FLAG_CREAM) {
        gameState->unlockedCharacters |= CHARACTER_BIT(CHARACTER_CREAM);
    }
    if (save->unlocks & UNLOCK_FLAG_TAILS) {
        gameState->unlockedCharacters |= CHARACTER_BIT(CHARACTER_TAILS);
    }
    if (save->unlocks & UNLOCK_FLAG_KNUCKLES) {
        gameState->unlockedCharacters |= CHARACTER_BIT(CHARACTER_KNUCKLES);
    }
    if (save->unlocks & UNLOCK_FLAG_AMY) {
        gameState->unlockedCharacters |= CHARACTER_BIT(CHARACTER_AMY);
    }

    if (save->unlocks & UNLOCK_FLAG_SOUND_TEST) {
        gameState->soundTestUnlocked = TRUE;
    } else {
        gameState->soundTestUnlocked = FALSE;
    }

    if (save->unlocks & UNLOCK_FLAG_BOSS_TA) {
        gameState->bossTimeAttackUnlocked = TRUE;
    } else {
        gameState->bossTimeAttackUnlocked = FALSE;
    }

    if (save->unlocks & UNLOCK_FLAG_CHAO_GARDEN) {
        gameState->chaoGardenUnlocked = TRUE;
    } else {
        gameState->chaoGardenUnlocked = FALSE;
    }

    switch (save->jumpControl) {
        case PACKED_R_BUTTON:
            gameState->buttonConfig.jump = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->buttonConfig.jump = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->buttonConfig.jump = A_BUTTON;
            break;
    }
    switch (save->attackControl) {
        case PACKED_R_BUTTON:
            gameState->buttonConfig.attack = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->buttonConfig.attack = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->buttonConfig.attack = A_BUTTON;
            break;
    }
    switch (save->trickControl) {
        case PACKED_R_BUTTON:
            gameState->buttonConfig.trick = R_BUTTON;
            break;
        case PACKED_B_BUTTON:
            gameState->buttonConfig.trick = B_BUTTON;
            break;
        case PACKED_A_BUTTON:
            gameState->buttonConfig.trick = A_BUTTON;
            break;
    }

    for (i = 0; i < NUM_CHARACTERS; i++) {
        gameState->unlockedLevels[i] = save->unlockedLevels[i];
    }

    for (i = 0; i < 5; i++) {
        gameState->chaosEmeralds[i] = save->chaosEmeralds[i];
    }

    gameState->multiplayerWins = save->multiplayerWins;
    gameState->multiplayerLoses = save->multiplayerLoses;
    gameState->multiplayerDraws = save->multiplayerDraws;
    gameState->timeRecords = save->timeRecords;

    memcpy(gameState->multiplayerScores, save->multiplayerScores, sizeof(save->multiplayerScores));
    gameState->score = save->score;
    return TRUE;
}

static s16 CreateAndTryWriteNewSaveGame(void)
{
    s16 i;
    u16 flashError;

    struct SaveGame *gameState = gLoadedSaveGame;
    struct SaveGame *lastWrittenGameState = gLastWrittenSaveGame;
    struct SaveSectorData *save = gSaveSectorDataBuffer;

    u8 language = gameState->language;
    u32 score = gameState->score;

    GenerateNewSaveGame(gameState);

    gameState->language = language;
    gameState->score = score;

    memcpy(lastWrittenGameState, gameState, sizeof(struct SaveGame));

    if ((gFlags & FLAGS_NO_FLASH_MEMORY)) {
        return 0;
    }

    save->header.version = 0;

    PackSaveSectorData(save, lastWrittenGameState);

    // Write to sector 0, and erase other
    // flash sectors so we know this save will be used
    flashError = WriteToSaveSector(save, 0);
    if (flashError) {
        return 0;
    }

    for (i = 1; i < NUM_SAVE_SECTORS; i++) {
        flashError = EraseSaveSector(i);
        if (flashError) {
            return 0;
        }
    }

    return 1;
}

static u16 EraseSaveSector(s16 sectorNum)
{
    u32 preIE;
    u32 preIME;
    u32 preDISPSTAT;
    u16 result;

    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    gFlags |= FLAGS_8000;

    preIE = REG_IE;
    preIME = REG_IME;
    preDISPSTAT = REG_DISPSTAT;

    REG_IE = 0;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    gFlags &= ~4;

    DmaStop(0);
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);

    result = EraseFlashSector(sectorNum);

    REG_IE = preIE;
    REG_IME = preIME;
    REG_DISPSTAT = preDISPSTAT;

    m4aSoundVSyncOn();
    gFlags &= ~FLAGS_8000;

    return result;
}

static void GenerateCompletedSaveGame(struct SaveGame *gameState)
{
    s16 i;

    if (gameState->id == 0) {
        // id?
        gameState->id = Random32();
    }

    gameState->score = 0;

    for (i = 0; i < 5; i++) {
        gameState->unlockedLevels[i]
            = i == CHARACTER_SONIC ? LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) + 1 : LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE) + 1;
        gameState->chaosEmeralds[i] = ALL_ZONE_CHAOS_EMERALDS | CHAOS_EMERALDS_COMPLETED;
    }

    gameState->unlockedCharacters = MAIN_CHARACTERS | CHARACTER_BIT(CHARACTER_AMY);
    gameState->soundTestUnlocked = TRUE;
    gameState->bossTimeAttackUnlocked = TRUE;
    gameState->chaoGardenUnlocked = TRUE;

    gameState->completedCharacters[CHARACTER_AMY] = TRUE;
    gameState->extraZoneStatus = 2;
    gameState->extraEndingCreditsPlayed = TRUE;
    gameState->completedCharacters[CHARACTER_SONIC] = TRUE;
    gameState->completedCharacters[CHARACTER_CREAM] = TRUE;
    gameState->completedCharacters[CHARACTER_TAILS] = TRUE;
    gameState->completedCharacters[CHARACTER_KNUCKLES] = TRUE;
}

// Exported functions

void SaveInit(void)
{
    gLoadedSaveGame = EwramMalloc(sizeof(struct SaveGame));
    gLastWrittenSaveGame = EwramMalloc(sizeof(struct SaveGame));
    gSaveSectorDataBuffer = EwramMalloc(sizeof(struct SaveSectorData));

    // Why not just generate for 1 and copy...
    GenerateNewSaveGame(gLoadedSaveGame);
    GenerateNewSaveGame(gLastWrittenSaveGame);
    InitSaveGameSectorData(gSaveSectorDataBuffer);
}

// Check if the any of the first 10 sectors of flash
// data contain a save
bool16 SaveGameExists(void)
{
    // Not sure why this is 16 long
    struct SaveSectorHeader sectors[16];
    s16 i;

    if (gFlags & FLAGS_NO_FLASH_MEMORY) {
        return FALSE;
    };

    for (i = 0; i < NUM_SAVE_SECTORS; i++) {
        ReadFlash(i, 0, &sectors[i], sizeof(struct SaveSectorHeader));

        if (sectors[i].security == SECTOR_SECURITY_NUM) {
            return TRUE;
        }
    }

    return FALSE;
}

s16 LoadSaveGame(void) { return TryLoadLatestSaveGame(); }

bool32 WriteSaveGame(void)
{
    if (!HasChangesToSave() && gLoadedSaveGame->id) {
        return TRUE;
    } else {
        return TryWriteSaveGame();
    }
}

s16 NewSaveGame(void) { return CreateAndTryWriteNewSaveGame(); }

// Initialise a completed game state
void LoadCompletedSaveGame(void) { GenerateCompletedSaveGame(gLoadedSaveGame); }

// End of exported functions

// Check if we need to save any changes
static bool16 HasChangesToSave(void)
{
    u16 *pCurrent = (u16 *)gLoadedSaveGame;
    u16 *pSaved = (u16 *)gLastWrittenSaveGame;

    s16 i = 0;
    u16 size = sizeof(struct SaveGame) / sizeof(u16);

    do {
        if (*pCurrent == *pSaved) {
            i++, pCurrent++, pSaved++;
        } else {
            return TRUE;
        }
    } while (i < size);

    return FALSE;
}

UNUSED static u32 CalculateChecksum(void *data) { return CalcChecksum(data); }

// Read flash data at given sector into data
// and verify integrity
static bool16 ReadSaveSectorAndVerifyChecksum(struct SaveSectorData *save, s16 sectorNum)
{
    u32 i;
    u32 sum;
    u32 *expected;

    ReadFlash(sectorNum, 0, save, sizeof(struct SaveSectorData));
    expected = &save->checksum;

    sum = CalcChecksum(save);

    if (*expected != sum) {
        return 0;
    }

    return 1;
}

static bool16 StringEquals(u16 *string1Char, u16 *string2Char, s16 length)
{
    s16 i;
    for (i = 0; i < length; i++, string1Char++, string2Char++) {
        if (*string1Char != *string2Char) {
            return FALSE;
        }
    }
    return TRUE;
}
