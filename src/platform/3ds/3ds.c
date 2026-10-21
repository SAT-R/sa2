#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include <3ds.h>
#include <sys/stat.h>
#include <citro3d.h>
#include <citro2d.h>

#include <SDL.h>

#include "global.h"
#include "core.h"
#include "lib/agb_flash/flash_internal.h"
#include "platform/shared/dma.h"
#include "platform/shared/input.h"
#include "platform/shared/video/gpsp_renderer.h"

#if ENABLE_AUDIO
#include "platform/shared/audio/cgb_audio.h"
#endif

uint16_t gameImage[DISPLAY_WIDTH * DISPLAY_HEIGHT];

C3D_RenderTarget *top;
C2D_Image screen;

#define INITIAL_VIDEO_SCALE 1
unsigned int videoScale = INITIAL_VIDEO_SCALE;
unsigned int preFullscreenVideoScale = INITIAL_VIDEO_SCALE;

bool speedUp = false;
bool isRunning = true;
bool paused = false;
bool stepOneFrame = false;
// bool headless = false;

double lastGameTime = 0;
double curGameTime = 0;
double fixedTimestep = 1.0 / 60.0; // 16.666667ms
double timeScale = 1.0;
double accumulator = 0.0;

static FILE *sSaveFile = NULL;

extern void AgbMain(void);
void DoSoftReset(void) {};

void VDraw();

static void ReadSaveFile(char *path);
static void StoreSaveFile(void);
static void CloseSaveFile(void);

u16 Platform_GetKeyInput(void);

static size_t posToTex(size_t index)
{
    const int width = 512;
    const int x = index % DISPLAY_WIDTH;
    const int y = index / DISPLAY_WIDTH;

    // printf("%i , %i \n", x, y);

    return ((((y >> 3) * (width >> 3) + (x >> 3)) << 5)
            + (((x & 1) >> 1) | ((y & 1)) | ((x & 2)) | ((y & 2) << 1) | ((x & 4) << 1) | ((y & 4) << 2)));
}

static u16 texMap[400 * 240 / 2];

int main(int argc, char **argv)
{
    gfxInitDefault();
    C3D_Init(C3D_DEFAULT_CMDBUF_SIZE);
    C2D_Init(C2D_DEFAULT_MAX_OBJECTS);
    C2D_Prepare();
    // osSetSpeedupEnable(true);
    consoleInit(GFX_BOTTOM, NULL);

    // const char *headlessEnv = getenv("HEADLESS");

    // if (headlessEnv && strcmp(headlessEnv, "true") == 0) {
    //     headless = true;
    // }

    // const char *parentEnv = getenv("SIO_PARENT");

    // if (parentEnv && strcmp(parentEnv, "true") == 0) {
    //     SIO_MULTI_CNT->id = 0;
    //     SIO_MULTI_CNT->si = 1;
    //     SIO_MULTI_CNT->sd = 1;
    //     SIO_MULTI_CNT->enable = false;
    // }

    mkdir("/3ds/SonicAdvance", 0755);
    ReadSaveFile("/3ds/SonicAdvance/sa2.sav");

    // Prevent the multiplayer screen from being drawn ( see core.c:EngineInit() )
    REG_RCNT = 0x8000;
    REG_KEYINPUT = 0x3FF;

    //     if (headless) {
    // #if ENABLE_AUDIO
    //         // Required or it makes an infinite loop
    //         cgb_audio_init(48000);
    // #endif
    //         AgbMain();
    //         return 1;
    //     }

    if (SDL_Init(SDL_INIT_AUDIO) < 0) {
        fprintf(stderr, "SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    top = C2D_CreateScreenTarget(GFX_TOP, GFX_LEFT);
    C2D_TargetClear(top, C2D_Color32f(0.0f, 0.f, 0.0f, 1.0f));

    screen.tex = malloc(sizeof(C3D_Tex));
    C3D_TexInit(screen.tex, 512, 256, GPU_RGBA5551);
    C3D_TexSetFilter(screen.tex, GPU_NEAREST, GPU_NEAREST);
    memset(screen.tex->data, 0, 512 * 256 * 2);

    for(int i = 0; i < DISPLAY_WIDTH * DISPLAY_HEIGHT/2; i++) {
        texMap[i] = posToTex(i*2);
    }

    Tex3DS_SubTexture *subtex = malloc(sizeof(Tex3DS_SubTexture));
    subtex->width = 512;
    subtex->height = 256;
    subtex->top = 1.f;
    subtex->right = 1.f;
    screen.subtex = subtex;

#if ENABLE_AUDIO
    SDL_AudioSpec want;

    SDL_memset(&want, 0, sizeof(want)); /* or SDL_zero(want) */
    want.freq = 48000;
    want.format = AUDIO_S16;
    want.channels = 2;
    want.samples = (want.freq / 60);
    cgb_audio_init(want.freq);

    if (SDL_OpenAudio(&want, 0) < 0) {
        SDL_Log("Failed to open audio: %s", SDL_GetError());
    } else {
        if (want.format != AUDIO_S16) /* we let this one thing change. */
            SDL_Log("We didn't get S16 audio format.");
        SDL_PauseAudio(0);
    }
#endif

    VDraw();
    AgbMain();

    return 0;
}

bool newFrameRequested = FALSE;

// called every gba frame. we process sdl events and render as many times
// as vsync needs, then return when a new game frame is needed.
void VBlankIntrWait(void)
{
#define HANDLE_VBLANK_INTRS()                                                                                                              \
    ({                                                                                                                                     \
        REG_DISPSTAT |= INTR_FLAG_VBLANK;                                                                                                  \
        RunDMAs(DMA_VBLANK);                                                                                                               \
        if (REG_DISPSTAT & DISPSTAT_VBLANK_INTR)                                                                                           \
            gIntrTable[INTR_INDEX_VBLANK]();                                                                                               \
        REG_DISPSTAT &= ~INTR_FLAG_VBLANK;                                                                                                 \
    })

    // if (headless) {
    //     REG_VCOUNT = DISPLAY_HEIGHT + 1;
    //     HANDLE_VBLANK_INTRS();
    //     return;
    // }

    bool frameAvailable = TRUE;
    bool frameDrawn = false;

    while (isRunning) {

        if (!paused || stepOneFrame) {
            // double dt = fixedTimestep / timeScale; // TODO: Fix speedup

            // don't accumulate time if we already requested a new frame
            // this frame cycle (emulates threaded sdl behavior)
            // if (!newFrameRequested) {
            //     double deltaTime = 0;

            //     curGameTime = SDL_GetPerformanceCounter();
            //     if (stepOneFrame) {
            //         deltaTime = dt;
            //     } else {
            //         deltaTime = (double)((curGameTime - lastGameTime) / (double)SDL_GetPerformanceFrequency());
            //         if (deltaTime > (dt * 5))
            //             deltaTime = dt * 5;
            //     }
            //     lastGameTime = curGameTime;

            //     accumulator += deltaTime;
            // } else {
            //     newFrameRequested = FALSE;
            // }

            // while (accumulator >= dt && aptMainLoop()) {
            REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();
            if (frameAvailable) {
                VDraw();
                frameAvailable = FALSE;
                frameDrawn = true;

                HANDLE_VBLANK_INTRS();

                // accumulator -= dt;
            } else {
                newFrameRequested = TRUE;
                return;
            }
            // }

            if (paused && stepOneFrame) {
                stepOneFrame = false;
            }
        }

        // present
        C3D_FrameBegin(C3D_FRAME_SYNCDRAW);
        // C2D_TargetClear(top, C2D_Color32f(0.0f, 0.f, 0.0f, 1.0f));
        C2D_SceneBegin(top);
        C2D_DrawImageAt(screen, 0, 0, 0, NULL, 1.f, 1.f);
        C3D_FrameEnd(0);

        isRunning = aptMainLoop();
    }

    CloseSaveFile();

    // SDL_DestroyWindow(sdlWindow);
    free((void *)screen.tex);
    free((void *)screen.subtex);
    C2D_Fini();
    C3D_Fini();
    SDL_Quit();
    gfxExit();
    exit(0);
#undef HANDLE_VBLANK_INTRS
}

static void ReadSaveFile(char *path)
{
    // Check whether the saveFile exists, and create it if not
    sSaveFile = fopen(path, "r+b");
    if (sSaveFile == NULL) {
        sSaveFile = fopen(path, "w+b");
    }

    fseek(sSaveFile, 0, SEEK_END);
    int fileSize = ftell(sSaveFile);
    fseek(sSaveFile, 0, SEEK_SET);

    // Only read as many bytes as fit inside the buffer
    // or as many bytes as are in the file
    int bytesToRead = (fileSize < sizeof(FLASH_BASE)) ? fileSize : sizeof(FLASH_BASE);

    int bytesRead = fread(FLASH_BASE, 1, bytesToRead, sSaveFile);

    // Fill the buffer if the savefile was just created or smaller than the buffer itself
    for (int i = bytesRead; i < sizeof(FLASH_BASE); i++) {
        FLASH_BASE[i] = 0xFF;
    }
}

static void StoreSaveFile()
{
    if (sSaveFile != NULL) {
        fseek(sSaveFile, 0, SEEK_SET);
        fwrite(FLASH_BASE, 1, sizeof(FLASH_BASE), sSaveFile);
    }
}

void Platform_StoreSaveFile(void) { StoreSaveFile(); }

static void CloseSaveFile()
{
    if (sSaveFile != NULL) {
        fclose(sSaveFile);
    }
}

u16 Platform_GetKeyInput(void)
{
    u32 newKeys = 0;
    //    if (joystick == NULL)
    //        return newKeys;

    hidScanInput();
    const u32 kHeld = hidKeysHeld();

    // if (kHeld & KEY_A)
    //     newKeys |= A_BUTTON;
    // if (kHeld & KEY_B)
    //     newKeys |= B_BUTTON;
    // if (kHeld & KEY_Y)
    //     newKeys |= A_BUTTON;
    // if (kHeld & KEY_SELECT)
    //     newKeys |= SELECT_BUTTON;
    // if (kHeld & KEY_START)
    //     newKeys |= START_BUTTON;
    // if (kHeld & KEY_R)
    //     newKeys |= R_BUTTON;
    // if (kHeld & KEY_L)
    //     newKeys |= L_BUTTON;
    // if (kHeld & KEY_UP)
    //     newKeys |= DPAD_UP;
    // if (kHeld & KEY_DOWN)
    //     newKeys |= DPAD_DOWN;
    // if (kHeld & KEY_LEFT)
    //     newKeys |= DPAD_LEFT;
    // if (kHeld & KEY_RIGHT)
    //     newKeys |= DPAD_RIGHT;

    newKeys = kHeld
        & 0b1111111111; // buttons that are on the GBA and 3DS are mapped the same way, so this way will save instructions from 35 to 9
    newKeys |= (kHeld >> 24) & 0xF0; // allow circle pad to act as DPAD
    if (kHeld & KEY_Y) // psp did this too so might aswell
        newKeys |= A_BUTTON;
    return (u16)newKeys;
}

void Platform_QueueAudio(const s16 *data, uint32_t bytesCount)
{
    // if (headless) {
    //     return;
    // }
    // Reset the audio buffer if we are 10 frames out of sync
    // If this happens it suggests there was some OS level lag
    // in playing audio. The queue length should remain stable at < 10 otherwise
    if (SDL_GetQueuedAudioSize(1) > (bytesCount * 10)) {
        SDL_ClearQueuedAudio(1);
    }

    SDL_QueueAudio(1, data, bytesCount);
    // printf("Queueing %d\n, QueueSize %d\n", bytesCount, SDL_GetQueuedAudioSize(1));
}

// when i tried to time this on a 3ds, the lookup table and calculating manually both took the same amount of ticks and time so I have no
// clue which is faster but the lookup table was faster on azahar
void VDraw()
{
    gpsp_draw_frame(gameImage);

    // for (int i = 0; i < DISPLAY_WIDTH * DISPLAY_HEIGHT; i++) {
    //     // const u8 red = gameImage[i] & 0x1F;
    //     // const u8 green = (gameImage[i] >> 5) & 0x1F;
    //     // const u8 blue = (gameImage[i] >> 10) & 0x1F;
    //     // const u8 alpha = (gameImage[i] >> 15) & 0x1;
    //     // ((u16 *)screen.tex->data)[posToTex[i]] = 1 | (blue << 1) | (green << 6) | (red << 11);
    // }

    // for (int i = 0; i < (DISPLAY_WIDTH * DISPLAY_HEIGHT) / 2; i++) {
    //     const u32 pixelPair = ((u32 *)gameImage)[i];
    //     ((u32 *)screen.tex->data)[posToTex(i * 2)]
    //         = 0x10001 | ((pixelPair >> 9) & 0x3E003E) | ((pixelPair << 1) & 0x7C007C0) | ((pixelPair << 11) & 0xF800F800);
    // }

    for (int i = 0; i < (DISPLAY_WIDTH * DISPLAY_HEIGHT) / 2; i++) {
        const u32 pixelPair = ((u32 *)gameImage)[i];
        ((u32 *)screen.tex->data)[texMap[i]]
            = 0x10001 | ((pixelPair >> 9) & 0x3E003E) | ((pixelPair << 1) & 0x7C007C0) | ((pixelPair << 11) & 0xF800F800);
    }

    REG_VCOUNT = DISPLAY_HEIGHT + 1; // prep for being in VBlank period
}