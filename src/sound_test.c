#include "global.h"
#include "sound_test.h"
#include "profile.h"
#include "task.h"
#include "data.h"
#include "m4a.h"
#include "input.h"
#include "constants/songs.h"

struct SoundTestScreen_UNK718 {
    u32 unk0;
    u8 filler4[4];
};

struct SoundTestScreen {
    struct OptionsScreen* optionsScreen;
    struct UNK_802D4CC_UNK270 unk4;
    struct UNK_3005B80_UNK4 unk10;

    u8 filler48[128];
    struct UNK_0808B3FC_UNK240 unkC8;
    struct UNK_0808B3FC_UNK240 unkF8;
    struct UNK_0808B3FC_UNK240 unk128;
    struct UNK_0808B3FC_UNK240 unk158;
    struct UNK_0808B3FC_UNK240 unk188;
    struct UNK_0808B3FC_UNK240 unk1B8[4];

    struct UNK_0808B3FC_UNK240 unk278;
    struct UNK_0808B3FC_UNK240 unk2A8;
    struct UNK_0808B3FC_UNK240* unk2D8;
    struct UNK_0808B3FC_UNK240 unk2DC;
    struct UNK_0808B3FC_UNK240 unk30C;
    struct UNK_0808B3FC_UNK240 unk33C[3];

    struct UNK_802D4CC_UNK270 unk3CC[4];

    struct UNK_0808B3FC_UNK240 unk3FC[16];

    u8 unk6FC;
    u8 unk6FD[3];

    u32 unk700;
    u32 unk704;
    u8 unk708;
    u8 unk709;

    u8 unk70A;

    u8 unk70B;
    u8 unk70C;
    u8 unk70D;
    s16 unk70E;
    u16 unk710;
    u8 unk712;

    u8 filler713[5];

    void* unk718[8];
    void* unk738[8];
    u8 unk758;
}; /* size 0x75C */

void sub_808AF74(void);
void sub_808B2B0(struct Task* t);
void sub_808B2F4(struct Task* t);
static void sub_808A3B4(struct Task* t);

extern const u8 gUnknown_080E0C38[12];
extern const u8 gUnknown_08C8796C[140];

void CreateSoundTestScreen(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(sub_808AF74, sizeof(struct SoundTestScreen), 0x1800, TASK_x0004, sub_808B2B0);
    struct SoundTestScreen* soundTestScreen = TaskGetStructPtr(t, soundTestScreen);
    struct UNK_802D4CC_UNK270* unk4;
    struct UNK_3005B80_UNK4* unk10;
    u32 i;
    
    
    unk4 = &soundTestScreen->unk4;
    unk10 = &soundTestScreen->unk10;
    m4aMPlayAllStop();

    soundTestScreen->optionsScreen = optionsScreen;
    soundTestScreen->unk6FC = 0;
    soundTestScreen->unk700 = 0;
    soundTestScreen->unk704 = 0x10000;
    soundTestScreen->unk70B = 1;
    soundTestScreen->unk709 = 0;
    soundTestScreen->unk708 = 0;
    soundTestScreen->unk2D8 = &soundTestScreen->unk278;
    soundTestScreen->unk70C = 0;
    soundTestScreen->unk70D = 0;
    soundTestScreen->unk70E = 0;
    soundTestScreen->unk710 = 0;
    soundTestScreen->unk712 = 0;
    soundTestScreen->unk758 = optionsScreen->language;
        
    for (i = 0; i < 8; i++) {
        soundTestScreen->unk718[i] = NULL;
        soundTestScreen->unk738[i] = NULL;
    }

    ResetProfileScreensVram();
    sub_808B2F4(t);
    sub_808A3B4(t);
   
    unk4->unk0 = 0;
    unk4->unk2 = 2;
    unk4->unk4 = 0;
    unk4->unk6 = 0x100;
    unk4->unkA = 0;
    unk4->unk8 = 0xff;

    unk10->unk0 = 0;
    unk10->unk2 = 0;
    unk10->unkC = 1;
    unk10->unkD = 1;
    unk10->unkE = 1;
    unk10->unk1 = 0;

    unk10->unk4 = gUnknown_080E0C38;
    unk10->unk8 = gUnknown_08C8796C;

    unk10->unk34 = 0;

    gUnknown_03005B80.unk0 = unk10;
}

extern const u32 gUnknown_080E0C44[NUM_LANGUAGES * 3];
extern const u32 gUnknown_080E0C8C[NUM_LANGUAGES * 3];
extern const u32 gUnknown_080E0CD4[NUM_LANGUAGES * 3 * 2];

extern const u8 gUnknown_080E05E4[68][16];
extern const u8 gUnknown_080E0BB8[63];

void sub_808A3B4(struct Task* t) {
    struct SoundTestScreen* soundTestScreen = TaskGetStructPtr(t, soundTestScreen);

    struct UNK_0808B3FC_UNK240* unkC8 = &soundTestScreen->unkC8;
    struct UNK_0808B3FC_UNK240* unkF8 = &soundTestScreen->unkF8;
    struct UNK_0808B3FC_UNK240* unk30C = &soundTestScreen->unk30C;
    struct UNK_0808B3FC_UNK240* unk1B8 = soundTestScreen->unk1B8;
    struct UNK_0808B3FC_UNK240* unk33C = soundTestScreen->unk33C;
    struct UNK_0808B3FC_UNK240* unk2DC = &soundTestScreen->unk2DC;
    struct UNK_0808B3FC_UNK240* unk278 = &soundTestScreen->unk278;
    struct UNK_0808B3FC_UNK240* unk188 = &soundTestScreen->unk188;
    struct UNK_802D4CC_UNK270* unk3CC = soundTestScreen->unk3CC;

    s16 i, xPos, yPos;

    // jiang: "the language stuff is definitely fake but I don't want to waste my time experimenting expression elimination tricks"
    s8 *language = &soundTestScreen->unk758;
    const u32 *r6 = gUnknown_080E0C44;
    s32 langOffset = *language * 3;

    sub_806A568(
        unkC8,
        RENDER_TARGET_SCREEN,
        r6[langOffset],
        gUnknown_080E0C44[langOffset + 1],
        0x1000,
        10,
        0x10,
        5,
        gUnknown_080E0C44[langOffset + 2],
        0
    );
    sub_806A568(unkF8,RENDER_TARGET_SCREEN,0x60,0x3C9,0x1000,0,0,6,0,0);

    // required for match
    unkF8 = &soundTestScreen->unk128;
    sub_806A568(
        unkF8,
        RENDER_TARGET_SCREEN,
        gUnknown_080E0C8C[langOffset],
        gUnknown_080E0C8C[langOffset + 1],
        0x1000, 10, 0x86, 5,
        gUnknown_080E0C8C[langOffset + 2],
        0);
    
    sub_806A568(
        unk30C,
        RENDER_TARGET_SCREEN,
        gUnknown_080E0CD4[langOffset * 2 + 3],
        gUnknown_080E0CD4[langOffset * 2 + 4],
        0x1000, 
        0x5A, 
        0x86, 
        5,
        gUnknown_080E0CD4[langOffset * 2 + 5],
        0
    );
    sub_806A568(unk188,RENDER_TARGET_SCREEN,1,0x3C5,0x1000,0x5A,0x5A,5,2,0);

    for (i = 0, xPos = 80, yPos = 96; i < 3; i++, unk33C++, xPos -= 8) {
        if (i == 0) {
            sub_806A568(unk33C,RENDER_TARGET_SCREEN,2,0x45f,0x1000,xPos,yPos,5,0x11,0);
        } else {
            sub_806A568(unk33C,RENDER_TARGET_SCREEN,2,0x45f,0x1000,xPos,yPos,5,0x10,0);
        }
    }

    for (i = 0; i < 4; i++) {
        sub_806A568(&unk1B8[i],RENDER_TARGET_SCREEN,0x40,0x3ce,i | 0x1060,0x4c,0x5a,6,0,0);
    }

    for (i = 0; i < 4; i++) {
        unk3CC[i].unk0 = i << 8;
        unk3CC[i].unk2 = 0x100;
        unk3CC[i].unk4 = 0x100;
        unk3CC[i].unk6 = 0x4C;
        unk3CC[i].unk8 = 0x5A;
    }

    unk3CC[1].unk6--;
    unk3CC[2].unk8--;
    unk3CC[2].unk6--;
    unk3CC[3].unk8--;

    sub_806A568(unk2DC,RENDER_TARGET_SCREEN,0x14,0x3CC,0x1000,0xB4,0x8C,6,0,4);
    sub_806A568(unk278,RENDER_TARGET_SCREEN,0x40,0x3CA,0x1000,0xB4,0x74,5,0,0);
    unk278++;
    sub_806A568(unk278,RENDER_TARGET_SCREEN,0x48,0x3C8,0x1000,0xB4,0x74,5,0,0);

    
    for (i = 0; i < 0x10; i++) {
        sub_806A568(
            &soundTestScreen->unk3FC[i],
            RENDER_TARGET_SCREEN,
            2,
            0x45F,
            0x1000,
            0,
            0,
            5,
            gUnknown_080E05E4[gUnknown_080E0BB8[0]][i] - 0x20,
            0
        );
    }
}

extern const u8 gUnknown_080E0BF7[57];
extern const u32 gUnknown_080E0AAC[67];
extern const u16 gUnknown_080E0A24[68];

void sub_808B18C(void);

void sub_808B3A0(u8);
void sub_808B030(u8);

void sub_808B350(u8, s16, u8);
void sub_808AB08();

void sub_808A720(void) {
    struct SoundTestScreen* soundTestScreen = TaskGetStructPtr(gCurTask, soundTestScreen);

    struct UNK_0808B3FC_UNK240* unk33C = soundTestScreen->unk33C;
    struct UNK_0808B3FC_UNK240* unk30C = &soundTestScreen->unk30C;
    struct UNK_802D4CC_UNK270* unk4 = &soundTestScreen->unk4;

    const u8* sounds;
    u8 numSounds;

    if (gLoadedSaveGame->unk7[0] >= 30) {
        sounds = gUnknown_080E0BB8;
        numSounds = ARRAY_COUNT(gUnknown_080E0BB8);
    } else {
        sounds = gUnknown_080E0BF7;
        numSounds = ARRAY_COUNT(gUnknown_080E0BF7);
    }

    sub_808B18C();

    if (gRepeatedKeys & DPAD_ANY) {
        u8 prev70B = soundTestScreen->unk70B;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (gRepeatedKeys & DPAD_LEFT) {
            soundTestScreen->unk70B--;
        }

        if (gRepeatedKeys & DPAD_RIGHT) {
            soundTestScreen->unk70B++;
        }

        if (gRepeatedKeys & DPAD_UP) {
            soundTestScreen->unk70B += 10;
        }
        
        if (gRepeatedKeys & DPAD_DOWN) {
            if (soundTestScreen->unk70B - 10 < 0) {
                soundTestScreen->unk70B = numSounds;
            } else {
                soundTestScreen->unk70B -= 10;
            }
        }

        if (soundTestScreen->unk70B == 0) {
            soundTestScreen->unk70B = numSounds;
        }
        
        if (soundTestScreen->unk70B > numSounds) {
            soundTestScreen->unk70B = 1;
        }

        if (soundTestScreen->unk70B % 10 > prev70B % 10) {
            soundTestScreen->unk70C = 0xF9;
        } else if (soundTestScreen->unk70B % 10 < prev70B % 10) {
            soundTestScreen->unk70C = 7;
        }

        if ((soundTestScreen->unk70B / 10) % 10 > (prev70B / 10) % 10) {
            soundTestScreen->unk70D = 0xF9;
        } else if ((soundTestScreen->unk70B / 10) % 10 < (prev70B / 10) % 10){
            soundTestScreen->unk70D = 7;
        }

        unk33C[0].unk20 = soundTestScreen->unk70B % 10 + 16;
        unk33C[1].unk20 = soundTestScreen->unk70B / 10 % 10 + 16;
        unk33C[2].unk20 = soundTestScreen->unk70B / 100 % 10 + 16;

        sub_8004558(unk33C);
        sub_8004558(&unk33C[1]);
        sub_8004558(&unk33C[2]);

        if (soundTestScreen->unk709 == 0) {
            sub_808B3A0(sounds[soundTestScreen->unk70B - 1]);
        }
    }

    if (soundTestScreen->unk709 == 1 && gMPlayTable[0].info->status == MUSICPLAYER_STATUS_PAUSE) {
        soundTestScreen->unk709 = 0;
        unk30C->unk20 = 1;
        sub_8004558(unk30C);
        m4aMPlayAllStop();
        soundTestScreen->unk6FC = 0;
        soundTestScreen->unk700 = 0;
        sub_808B030(5);
    }
    
    if (gPressedKeys & A_BUTTON) {
        u32 songTitle;
        soundTestScreen->unk704 = songTitle = gUnknown_080E0AAC[sounds[soundTestScreen->unk70B - 1]];
        soundTestScreen->unk2A8.unk22 = songTitle >> 12;
        m4aMPlayAllStop();

        MPlayStart(&gMPlayInfo_BGM, gSongTable[gUnknown_080E0A24[sounds[soundTestScreen->unk70B - 1]]].header);

        soundTestScreen->unk709 = 1;
        unk30C->unk20 = 0;
        soundTestScreen->unk6FC = 0;
        soundTestScreen->unk700 = 0;
        soundTestScreen->unk708 = 0;
        soundTestScreen->unk70A = 0;

        sub_8004558(unk30C); 

        sub_808B3A0(sounds[soundTestScreen->unk70B - 1]);
        sub_808B030(2);
    }

    if (gPressedKeys & B_BUTTON) {
        if (soundTestScreen->unk709 == 1) {
            soundTestScreen->unk709 = 0;
            unk30C->unk20 = 1;
            sub_8004558(unk30C);
            m4aMPlayAllStop();
            soundTestScreen->unk6FC = 0;
            soundTestScreen->unk700 = 0;
            sub_808B030(5);
        } else {
            sub_808B030(0);
            m4aSongNumStart(SE_RETURN);
            unk4->unk0 = 0;
            unk4->unk2 = 1;
            unk4->unk4 = 0;
            unk4->unk6 = 0x100;
            unk4->unkA = 0;
            unk4->unk8 = 0xFF;

            soundTestScreen->unk6FC = 0;
            soundTestScreen->unk700 = 0;
            soundTestScreen->unk709 = 2;
            gCurTask->main = sub_808AF74;
        }
    }

    if (++soundTestScreen->unk70E > 400) {
        soundTestScreen->unk70E = 0;
    }

    sub_808B350(sounds[soundTestScreen->unk70B - 1], 0x100 - soundTestScreen->unk70E, 0x9E);
    sub_808AB08();
}
