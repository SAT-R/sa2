#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#ifdef _WIN32
#include <windows.h>
#include <xinput.h>
#endif

#ifdef __PSP__
#include <pspkernel.h>
#include <pspdebug.h>
#include <pspgu.h>
#endif

#include <SDL.h>

#include "global.h"
#include "core.h"
#include "multi_sio.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "gba/types.h"
#include "lib/agb_flash/flash_internal.h"
#include "platform/shared/dma.h"
#include "platform/shared/input.h"
#include "platform/shared/video/gpsp_renderer.h"

#if ENABLE_AUDIO
#include "platform/shared/audio/cgb_audio.h"
#endif

ALIGNED(256) uint16_t gameImage[DISPLAY_WIDTH * DISPLAY_HEIGHT];

#if ENABLE_VRAM_VIEW
uint16_t vramBuffer[VRAM_VIEW_WIDTH * VRAM_VIEW_HEIGHT];
#endif

SDL_Window *sdlWindow;
SDL_Renderer *sdlRenderer;
SDL_Texture *sdlTexture;
#if ENABLE_VRAM_VIEW
SDL_Window *vramWindow;
SDL_Renderer *vramRenderer;
SDL_Texture *vramTexture;
#endif
#define INITIAL_VIDEO_SCALE 1
unsigned int videoScale = INITIAL_VIDEO_SCALE;
unsigned int preFullscreenVideoScale = INITIAL_VIDEO_SCALE;

bool speedUp = false;
bool videoScaleChanged = false;
bool isRunning = true;
bool paused = false;
bool stepOneFrame = false;
bool headless = false;

#ifdef __PSP__
static SDL_Joystick *joystick = NULL;
static SDL_Rect pspDestRect;
#endif

double lastGameTime = 0;
double curGameTime = 0;
double fixedTimestep = 1.0 / 60.0; // 16.666667ms
double timeScale = 1.0;
double accumulator = 0.0;

static FILE *sSaveFile = NULL;

extern void AgbMain(void);
void DoSoftReset(void) {};

void ProcessSDLEvents(void);
void VDraw(SDL_Texture *texture);
void VramDraw(SDL_Texture *texture);

static void ReadSaveFile(char *path);
static void StoreSaveFile(void);
static void CloseSaveFile(void);

u16 Platform_GetKeyInput(void);

#ifdef _WIN32
void *Platform_malloc(size_t numBytes) { return HeapAlloc(GetProcessHeap(), HEAP_GENERATE_EXCEPTIONS | HEAP_ZERO_MEMORY, numBytes); }
void Platform_free(void *ptr) { HeapFree(GetProcessHeap(), 0, ptr); }
#endif

#ifdef __PSP__
PSP_MODULE_INFO("SonicAdvance2", 0, 1, 0);
PSP_MAIN_THREAD_ATTR(THREAD_ATTR_USER | THREAD_ATTR_VFPU);
PSP_HEAP_SIZE_KB(-1024);

unsigned int sce_newlib_stack_size = 512 * 1024;

extern bool isRunning;

int exitCallback(int arg1, int arg2, void *common)
{
    (void)arg1;
    (void)arg2;
    (void)common;
    isRunning = false;
    return 0;
}

int callbackThread(SceSize args, void *argp)
{
    (void)args;
    (void)argp;
    int cbid = sceKernelCreateCallback("Exit Callback", exitCallback, NULL);
    sceKernelRegisterExitCallback(cbid);
    sceKernelSleepThreadCB();
    return 0;
}

int setupPspCallbacks(void)
{
    int thid = sceKernelCreateThread("update_thread", callbackThread, 0x11, 0xFA0, 0, 0);
    if (thid >= 0) {
        sceKernelStartThread(thid, 0, 0);
    }
    return thid;
}
#endif

int main(int argc, char **argv)
{
#ifdef __PSP__
    setupPspCallbacks();
#endif

    const char *headlessEnv = getenv("HEADLESS");

    if (headlessEnv && strcmp(headlessEnv, "true") == 0) {
        headless = true;
    }

    const char *parentEnv = getenv("SIO_PARENT");

    if (parentEnv && strcmp(parentEnv, "true") == 0) {
        SIO_MULTI_CNT->id = 0;
        SIO_MULTI_CNT->si = 1;
        SIO_MULTI_CNT->sd = 1;
        SIO_MULTI_CNT->enable = false;
    }

    // Open an output console on Windows
#if (defined _WIN32) && (DEBUG != 0)
    AllocConsole();
    AttachConsole(GetCurrentProcessId());
    freopen("CON", "w", stdout);
#endif

    ReadSaveFile("sa2.sav");

    // Prevent the multiplayer screen from being drawn ( see core.c:EngineInit() )
    REG_RCNT = 0x8000;
    REG_KEYINPUT = 0x3FF;

    if (headless) {
#if ENABLE_AUDIO
        // Required or it makes an infinite loop
        cgb_audio_init(48000);
#endif
        AgbMain();
        return 1;
    }

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_JOYSTICK) < 0) {
        fprintf(stderr, "SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

#ifdef __PSP__
    if (SDL_NumJoysticks() > 0) {
        joystick = SDL_JoystickOpen(0);
    }
#endif

#ifdef TITLE_BAR
    const char *title = STR(TITLE_BAR);
#else
    const char *title = "SAT-R sa2";
#endif

#ifdef __PSP__
    sdlWindow = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 480, 272, SDL_WINDOW_SHOWN);
#else
    sdlWindow = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, DISPLAY_WIDTH * videoScale,
                                 DISPLAY_HEIGHT * videoScale, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
#endif
    if (sdlWindow == NULL) {
        fprintf(stderr, "Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

#if ENABLE_VRAM_VIEW
    int mainWindowX;
    int mainWindowWidth;
    SDL_GetWindowPosition(sdlWindow, &mainWindowX, NULL);
    SDL_GetWindowSize(sdlWindow, &mainWindowWidth, NULL);
    int vramWindowX = mainWindowX + mainWindowWidth;
    u16 vramWindowWidth = VRAM_VIEW_WIDTH;
    u16 vramWindowHeight = VRAM_VIEW_HEIGHT;
    vramWindow = SDL_CreateWindow("VRAM View", vramWindowX, SDL_WINDOWPOS_CENTERED, vramWindowWidth, vramWindowHeight,
                                  SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (vramWindow == NULL) {
        fprintf(stderr, "VRAM Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
#endif

#ifdef __PSP__
    sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (sdlRenderer == NULL)
        sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, SDL_RENDERER_ACCELERATED);
    if (sdlRenderer == NULL)
        sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, 0);
#else
    sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, SDL_RENDERER_PRESENTVSYNC);
#endif
    if (sdlRenderer == NULL) {
        fprintf(stderr, "Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

#if ENABLE_VRAM_VIEW
    vramRenderer = SDL_CreateRenderer(vramWindow, -1, SDL_RENDERER_PRESENTVSYNC);
    if (vramRenderer == NULL) {
        fprintf(stderr, "VRAM Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
#endif

    SDL_SetRenderDrawColor(sdlRenderer, 0, 0, 0, 255);
    SDL_RenderClear(sdlRenderer);
    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "0");
#ifdef __PSP__
    // SDL_RenderSetLogicalSize is broken on PSP, stretch to fill manually
    pspDestRect = (SDL_Rect) { 0, 0, GU_SCR_WIDTH, GU_SCR_HEIGHT };
#else
    SDL_RenderSetLogicalSize(sdlRenderer, DISPLAY_WIDTH, DISPLAY_HEIGHT);
#endif
#if ENABLE_VRAM_VIEW
    SDL_SetRenderDrawColor(vramRenderer, 0, 0, 0, 255);
    SDL_RenderClear(vramRenderer);
    SDL_RenderSetLogicalSize(vramRenderer, vramWindowWidth, vramWindowHeight);
#endif

    sdlTexture = SDL_CreateTexture(sdlRenderer, SDL_PIXELFORMAT_ABGR1555, SDL_TEXTUREACCESS_STREAMING, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    if (sdlTexture == NULL) {
        fprintf(stderr, "Texture could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

#if ENABLE_VRAM_VIEW
    vramTexture = SDL_CreateTexture(vramRenderer, SDL_PIXELFORMAT_ABGR1555, SDL_TEXTUREACCESS_STREAMING, vramWindowWidth, vramWindowHeight);
    if (vramTexture == NULL) {
        fprintf(stderr, "Texture could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }
#endif

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

    VDraw(sdlTexture);
#if ENABLE_VRAM_VIEW
    VramDraw(vramTexture);
#endif
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

    if (headless) {
        REG_VCOUNT = DISPLAY_HEIGHT + 1;
        HANDLE_VBLANK_INTRS();
        return;
    }

    bool frameAvailable = TRUE;
    bool frameDrawn = false;

    while (isRunning) {
#ifndef __PSP__
        ProcessSDLEvents();
#endif

        if (!paused || stepOneFrame) {
            double dt = fixedTimestep / timeScale; // TODO: Fix speedup

            // don't accumulate time if we already requested a new frame
            // this frame cycle (emulates threaded sdl behavior)
            if (!newFrameRequested) {
                double deltaTime = 0;

                curGameTime = SDL_GetPerformanceCounter();
                if (stepOneFrame) {
                    deltaTime = dt;
                } else {
                    deltaTime = (double)((curGameTime - lastGameTime) / (double)SDL_GetPerformanceFrequency());
                    if (deltaTime > (dt * 5))
                        deltaTime = dt * 5;
                }
                lastGameTime = curGameTime;

                accumulator += deltaTime;
            } else {
                newFrameRequested = FALSE;
            }

            while (accumulator >= dt) {
                REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();
                if (frameAvailable) {
                    VDraw(sdlTexture);
                    frameAvailable = FALSE;
                    frameDrawn = true;

                    HANDLE_VBLANK_INTRS();

                    accumulator -= dt;
                } else {
                    newFrameRequested = TRUE;
                    return;
                }
            }

            if (paused && stepOneFrame) {
                stepOneFrame = false;
            }
        }

        // present
#ifdef __PSP__
        // manual blit since SDL_RenderSetLogicalSize doesn't work on psp
        SDL_RenderCopy(sdlRenderer, sdlTexture, NULL, &pspDestRect);
        SDL_RenderPresent(sdlRenderer);
#else
        SDL_RenderClear(sdlRenderer);
        SDL_RenderCopy(sdlRenderer, sdlTexture, NULL, NULL);

#if ENABLE_VRAM_VIEW
        VramDraw(vramTexture);
        SDL_RenderClear(vramRenderer);
        SDL_RenderCopy(vramRenderer, vramTexture, NULL, NULL);
#endif
        if (videoScaleChanged) {
            SDL_SetWindowSize(sdlWindow, DISPLAY_WIDTH * videoScale, DISPLAY_HEIGHT * videoScale);
            videoScaleChanged = false;
        }

        SDL_RenderPresent(sdlRenderer);
#if ENABLE_VRAM_VIEW
        SDL_RenderPresent(vramRenderer);
#endif
#endif
    }

    CloseSaveFile();

    SDL_DestroyWindow(sdlWindow);
    SDL_Quit();
#ifdef __PSP__
    sceKernelExitGame();
#endif
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

static u16 keys;

// Key mappings
#define KEY_A_BUTTON      SDLK_c
#define KEY_B_BUTTON      SDLK_x
#define KEY_START_BUTTON  SDLK_RETURN
#define KEY_SELECT_BUTTON SDLK_BACKSLASH
#define KEY_L_BUTTON      SDLK_s
#define KEY_R_BUTTON      SDLK_d
#define KEY_DPAD_UP       SDLK_UP
#define KEY_DPAD_DOWN     SDLK_DOWN
#define KEY_DPAD_LEFT     SDLK_LEFT
#define KEY_DPAD_RIGHT    SDLK_RIGHT

#define HANDLE_KEYUP(key)                                                                                                                  \
    case KEY_##key:                                                                                                                        \
        keys &= ~key;                                                                                                                      \
        break;

#define HANDLE_KEYDOWN(key)                                                                                                                \
    case KEY_##key:                                                                                                                        \
        keys |= key;                                                                                                                       \
        break;

#ifdef __PSP__
#define BTN_TRIANGLE 0
#define BTN_CIRCLE   1
#define BTN_CROSS    2
#define BTN_SQUARE   3
#define BTN_LTRIGGER 4
#define BTN_RTRIGGER 5
#define BTN_DOWN     6
#define BTN_LEFT     7
#define BTN_UP       8
#define BTN_RIGHT    9
#define BTN_SELECT   10
#define BTN_START    11

static u16 PollJoystickButtons(void)
{
    u16 newKeys = 0;
    if (joystick == NULL)
        return newKeys;

    SDL_JoystickUpdate();

    if (SDL_JoystickGetButton(joystick, BTN_CROSS))
        newKeys |= A_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_CIRCLE))
        newKeys |= B_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_SQUARE))
        newKeys |= B_BUTTON; // Square also B
    if (SDL_JoystickGetButton(joystick, BTN_START))
        newKeys |= START_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_SELECT))
        newKeys |= SELECT_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_LTRIGGER))
        newKeys |= L_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_RTRIGGER))
        newKeys |= R_BUTTON;
    if (SDL_JoystickGetButton(joystick, BTN_UP))
        newKeys |= DPAD_UP;
    if (SDL_JoystickGetButton(joystick, BTN_DOWN))
        newKeys |= DPAD_DOWN;
    if (SDL_JoystickGetButton(joystick, BTN_LEFT))
        newKeys |= DPAD_LEFT;
    if (SDL_JoystickGetButton(joystick, BTN_RIGHT))
        newKeys |= DPAD_RIGHT;

    return newKeys;
}

#endif

u32 fullScreenFlags = 0;
static SDL_DisplayMode sdlDispMode = { 0 };

void Platform_QueueAudio(const s16 *data, uint32_t bytesCount)
{
    if (headless) {
        return;
    }
    // Reset the audio buffer if we are 10 frames out of sync
    // If this happens it suggests there was some OS level lag
    // in playing audio. The queue length should remain stable at < 10 otherwise
    if (SDL_GetQueuedAudioSize(1) > (bytesCount * 10)) {
        SDL_ClearQueuedAudio(1);
    }

    SDL_QueueAudio(1, data, bytesCount);
    // printf("Queueing %d\n, QueueSize %d\n", bytesCount, SDL_GetQueuedAudioSize(1));
}

void ProcessSDLEvents(void)
{
    SDL_Event event;

    while (SDL_PollEvent(&event)) {
        SDL_Keycode keyCode = event.key.keysym.sym;
        Uint16 keyMod = event.key.keysym.mod;

        switch (event.type) {
            case SDL_QUIT:
                isRunning = false;
                break;
            case SDL_KEYUP:
                switch (event.key.keysym.sym) {
                    HANDLE_KEYUP(A_BUTTON)
                    HANDLE_KEYUP(B_BUTTON)
                    HANDLE_KEYUP(START_BUTTON)
                    HANDLE_KEYUP(SELECT_BUTTON)
                    HANDLE_KEYUP(L_BUTTON)
                    HANDLE_KEYUP(R_BUTTON)
                    HANDLE_KEYUP(DPAD_UP)
                    HANDLE_KEYUP(DPAD_DOWN)
                    HANDLE_KEYUP(DPAD_LEFT)
                    HANDLE_KEYUP(DPAD_RIGHT)
                    case SDLK_SPACE:
                        if (speedUp) {
                            speedUp = false;
                            timeScale = 1.0;
                            SDL_ClearQueuedAudio(1);
                            SDL_PauseAudio(0);
                        }
                        break;
                }
                break;
            case SDL_KEYDOWN:
                if (keyCode == SDLK_RETURN && (keyMod & KMOD_ALT)) {
                    fullScreenFlags ^= SDL_WINDOW_FULLSCREEN_DESKTOP;
                    if (fullScreenFlags & SDL_WINDOW_FULLSCREEN_DESKTOP) {
                        SDL_GetWindowDisplayMode(sdlWindow, &sdlDispMode);
                        preFullscreenVideoScale = videoScale;
                    } else {
                        SDL_SetWindowDisplayMode(sdlWindow, &sdlDispMode);
                        videoScale = preFullscreenVideoScale;
                    }
                    SDL_SetWindowFullscreen(sdlWindow, fullScreenFlags);

                    SDL_SetWindowSize(sdlWindow, DISPLAY_WIDTH * videoScale, DISPLAY_HEIGHT * videoScale);
                    videoScaleChanged = FALSE;
                } else
                    switch (event.key.keysym.sym) {
                        HANDLE_KEYDOWN(A_BUTTON)
                        HANDLE_KEYDOWN(B_BUTTON)
                        HANDLE_KEYDOWN(START_BUTTON)
                        HANDLE_KEYDOWN(SELECT_BUTTON)
                        HANDLE_KEYDOWN(L_BUTTON)
                        HANDLE_KEYDOWN(R_BUTTON)
                        HANDLE_KEYDOWN(DPAD_UP)
                        HANDLE_KEYDOWN(DPAD_DOWN)
                        HANDLE_KEYDOWN(DPAD_LEFT)
                        HANDLE_KEYDOWN(DPAD_RIGHT)
                        case SDLK_r:
                            if (event.key.keysym.mod & (KMOD_LCTRL | KMOD_RCTRL)) {
                                DoSoftReset();
                            }
                            break;
                        case SDLK_p:
                            if (event.key.keysym.mod & (KMOD_LCTRL | KMOD_RCTRL)) {
                                paused = !paused;
                            }
                            break;
                        case SDLK_SPACE:
                            if (!speedUp) {
                                speedUp = true;
                                timeScale = SPEEDUP_SCALE;
                                SDL_PauseAudio(1);
                            }
                            break;
                        case SDLK_F10:
                            paused = true;
                            stepOneFrame = true;
                            break;
                    }
                break;
            case SDL_WINDOWEVENT:
                if (event.window.event == SDL_WINDOWEVENT_SIZE_CHANGED) {
                    unsigned int w = event.window.data1;
                    unsigned int h = event.window.data2;

                    videoScale = 0;
                    if (w / DISPLAY_WIDTH > videoScale)
                        videoScale = w / DISPLAY_WIDTH;
                    if (h / DISPLAY_HEIGHT > videoScale)
                        videoScale = h / DISPLAY_HEIGHT;
                    if (videoScale < 1)
                        videoScale = 1;

                    videoScaleChanged = true;
                }
                break;
        }
    }
}

u16 Platform_GetKeyInput(void)
{
#ifdef _WIN32
    SharedKeys gamepadKeys = GetXInputKeys();

    speedUp = (gamepadKeys & KEY_SPEEDUP) ? true : false;

    if (speedUp) {
        timeScale = SPEEDUP_SCALE;
        SDL_PauseAudio(1);
    } else {
        timeScale = 1.0f;
        SDL_PauseAudio(0);
    }

    return (gamepadKeys != 0) ? gamepadKeys : keys;
#endif

#ifdef __PSP__
    return keys | PollJoystickButtons();
#endif

    return keys;
}

// BIOS function implementations are based on the VBA-M source code.

// safe unaligned access for MIPS
static uint32_t CPUReadMemory(const void *src)
{
    uint32_t val;
    memcpy(&val, src, sizeof(val));
    return val;
}

static void CPUWriteMemory(void *dest, uint32_t val) { memcpy(dest, &val, sizeof(val)); }

static uint16_t CPUReadHalfWord(const void *src)
{
    uint16_t val;
    memcpy(&val, src, sizeof(val));
    return val;
}

static void CPUWriteHalfWord(void *dest, uint16_t val) { memcpy(dest, &val, sizeof(val)); }

static uint8_t CPUReadByte(const void *src) { return *(uint8_t *)src; }

static void CPUWriteByte(void *dest, uint8_t val) { *(uint8_t *)dest = val; }

void CpuSet(const void *src, void *dst, u32 cnt)
{
    if (dst == NULL) {
        puts("Attempted to CpuSet to NULL\n");
        return;
    }

    int count = cnt & 0x1FFFFF;

    const u8 *source = src;
    u8 *dest = dst;

    // 32-bit ?
    if ((cnt >> 26) & 1) {
        // assert(((uintptr_t)src & ~3) == (uintptr_t)src);
        // assert(((uintptr_t)dst & ~3) == (uintptr_t)dst);

        // needed for 32-bit mode!
        // source = (u8 *)((uint32_t )source & ~3);
        // dest = (u8 *)((uint32_t )dest & ~3);

        // fill ?
        if ((cnt >> 24) & 1) {
            uint32_t value = CPUReadMemory(source);
            while (count) {
                CPUWriteMemory(dest, value);
                dest += 4;
                count--;
            }
        } else {
            // copy
            while (count) {
                CPUWriteMemory(dest, CPUReadMemory(source));
                source += 4;
                dest += 4;
                count--;
            }
        }
    } else {
        // No align on 16-bit fill?
        // assert(((uintptr_t)src & ~1) == (uintptr_t)src);
        // assert(((uintptr_t)dst & ~1) == (uintptr_t)dst);

        // 16-bit fill?
        if ((cnt >> 24) & 1) {
            uint16_t value = CPUReadHalfWord(source);
            while (count) {
                CPUWriteHalfWord(dest, value);
                dest += 2;
                count--;
            }
        } else {
            // copy
            while (count) {
                CPUWriteHalfWord(dest, CPUReadHalfWord(source));
                source += 2;
                dest += 2;
                count--;
            }
        }
    }
}

void CpuFastSet(const void *src, void *dst, u32 cnt)
{
    if (dst == NULL) {
        puts("Attempted to CpuFastSet to NULL\n");
        return;
    }

    int count = cnt & 0x1FFFFF;

    const u8 *source = src;
    u8 *dest = dst;

    // source = (u8 *)((uint32_t )source & ~3);
    // dest = (u8 *)((uint32_t )dest & ~3);

    // fill?
    if ((cnt >> 24) & 1) {
        uint32_t value = CPUReadMemory(source);
        while (count > 0) {
            // BIOS always transfers 32 bytes at a time
            for (int i = 0; i < 8; i++) {
                CPUWriteMemory(dest, value);
                dest += 4;
            }
            count -= 8;
        }
    } else {
        // copy
        while (count > 0) {
            // BIOS always transfers 32 bytes at a time
            for (int i = 0; i < 8; i++) {
                uint32_t value = CPUReadMemory(source);
                CPUWriteMemory(dest, value);
                source += 4;
                dest += 4;
            }
            count -= 8;
        }
    }
}

void LZ77UnCompVram(const void *src_, void *dest_)
{
    const u8 *src = (const u8 *)src_;
    u8 *dest = dest_;
    int destSize = (src[3] << 16) | (src[2] << 8) | src[1];
    int srcPos = 4;
    int destPos = 0;

    for (;;) {
        unsigned char flags = src[srcPos++];

        for (int i = 0; i < 8; i++) {
            if (flags & 0x80) {
                int blockSize = (src[srcPos] >> 4) + 3;
                int blockDistance = (((src[srcPos] & 0xF) << 8) | src[srcPos + 1]) + 1;

                srcPos += 2;

                int blockPos = destPos - blockDistance;

                // Some Ruby/Sapphire tilesets overflow.
                if (destPos + blockSize > destSize) {
                    blockSize = destSize - destPos;
                    // fprintf(stderr, "Destination buffer overflow.\n");
                    puts("Destination buffer overflow.\n");
                }

                if (blockPos < 0)
                    goto fail;

                for (int j = 0; j < blockSize; j++)
                    dest[destPos++] = dest[blockPos + j];
            } else {
                if (destPos >= destSize)
                    goto fail;

                dest[destPos++] = src[srcPos++];
            }

            if (destPos == destSize) {
                return;
            }

            flags <<= 1;
        }
    }

fail:
    puts("Fatal error while decompressing LZ file.\n");
}

void LZ77UnCompWram(const void *src, void *dst)
{
    const uint8_t *source = src;
    uint8_t *dest = dst;

    uint32_t header = CPUReadMemory(source);
    source += 4;

    int len = header >> 8;

    while (len > 0) {
        uint8_t d = CPUReadByte(source++);

        if (d) {
            for (int i = 0; i < 8; i++) {
                if (d & 0x80) {
                    uint16_t data = CPUReadByte(source++) << 8;
                    data |= CPUReadByte(source++);
                    int length = (data >> 12) + 3;
                    int offset = (data & 0x0FFF);
                    uint8_t *windowOffset = dest - offset - 1;
                    for (int i2 = 0; i2 < length; i2++) {
                        CPUWriteByte(dest++, CPUReadByte(windowOffset++));
                        len--;
                        if (len == 0)
                            return;
                    }
                } else {
                    CPUWriteByte(dest++, CPUReadByte(source++));
                    len--;
                    if (len == 0)
                        return;
                }
                d <<= 1;
            }
        } else {
            for (int i = 0; i < 8; i++) {
                CPUWriteByte(dest++, CPUReadByte(source++));
                len--;
                if (len == 0)
                    return;
            }
        }
    }
}

void RLUnCompWram(const void *src, void *dest)
{
    int remaining = CPUReadMemory(src) >> 8;
    int blockHeader;
    int block;
    src += 4;
    while (remaining > 0) {
        blockHeader = CPUReadByte(src);
        src++;
        if (blockHeader & 0x80) // Compressed?
        {
            blockHeader &= 0x7F;
            blockHeader += 3;
            block = CPUReadByte(src);
            src++;
            while (blockHeader-- && remaining) {
                remaining--;
                CPUWriteByte(dest, block);
                dest++;
            }
        } else // Uncompressed
        {
            blockHeader++;
            while (blockHeader-- && remaining) {
                remaining--;
                u8 byte = CPUReadByte(src);
                src++;
                CPUWriteByte(dest, byte);
                dest++;
            }
        }
    }
}

void RLUnCompVram(const void *src, void *dest)
{
    int remaining = CPUReadMemory(src) >> 8;
    int padding = (4 - remaining) & 0x3;
    int blockHeader;
    int block;
    int halfWord = 0;
    src += 4;
    while (remaining > 0) {
        blockHeader = CPUReadByte(src);
        src++;
        if (blockHeader & 0x80) // Compressed?
        {
            blockHeader &= 0x7F;
            blockHeader += 3;
            block = CPUReadByte(src);
            src++;
            while (blockHeader-- && remaining) {
                remaining--;
                if ((uintptr_t)dest & 1) {
                    halfWord |= block << 8;
                    CPUWriteHalfWord((void *)((uintptr_t)dest ^ 1), halfWord);
                } else
                    halfWord = block;
                dest++;
            }
        } else // Uncompressed
        {
            blockHeader++;
            while (blockHeader-- && remaining) {
                remaining--;
                u8 byte = CPUReadByte(src);
                src++;
                if ((uintptr_t)dest & 1) {
                    halfWord |= byte << 8;
                    CPUWriteHalfWord((void *)((uintptr_t)dest ^ 1), halfWord);
                } else
                    halfWord = byte;
                dest++;
            }
        }
    }
    if ((uintptr_t)dest & 1) {
        padding--;
        dest++;
    }
    for (; padding > 0; padding -= 2, dest += 2)
        CPUWriteHalfWord(dest, 0);
}

const s16 sineTable[256]
    = { (s16)0x0000, (s16)0x0192, (s16)0x0323, (s16)0x04B5, (s16)0x0645, (s16)0x07D5, (s16)0x0964, (s16)0x0AF1, (s16)0x0C7C, (s16)0x0E05,
        (s16)0x0F8C, (s16)0x1111, (s16)0x1294, (s16)0x1413, (s16)0x158F, (s16)0x1708, (s16)0x187D, (s16)0x19EF, (s16)0x1B5D, (s16)0x1CC6,
        (s16)0x1E2B, (s16)0x1F8B, (s16)0x20E7, (s16)0x223D, (s16)0x238E, (s16)0x24DA, (s16)0x261F, (s16)0x275F, (s16)0x2899, (s16)0x29CD,
        (s16)0x2AFA, (s16)0x2C21, (s16)0x2D41, (s16)0x2E5A, (s16)0x2F6B, (s16)0x3076, (s16)0x3179, (s16)0x3274, (s16)0x3367, (s16)0x3453,
        (s16)0x3536, (s16)0x3612, (s16)0x36E5, (s16)0x37AF, (s16)0x3871, (s16)0x392A, (s16)0x39DA, (s16)0x3A82, (s16)0x3B20, (s16)0x3BB6,
        (s16)0x3C42, (s16)0x3CC5, (s16)0x3D3E, (s16)0x3DAE, (s16)0x3E14, (s16)0x3E71, (s16)0x3EC5, (s16)0x3F0E, (s16)0x3F4E, (s16)0x3F84,
        (s16)0x3FB1, (s16)0x3FD3, (s16)0x3FEC, (s16)0x3FFB, (s16)0x4000, (s16)0x3FFB, (s16)0x3FEC, (s16)0x3FD3, (s16)0x3FB1, (s16)0x3F84,
        (s16)0x3F4E, (s16)0x3F0E, (s16)0x3EC5, (s16)0x3E71, (s16)0x3E14, (s16)0x3DAE, (s16)0x3D3E, (s16)0x3CC5, (s16)0x3C42, (s16)0x3BB6,
        (s16)0x3B20, (s16)0x3A82, (s16)0x39DA, (s16)0x392A, (s16)0x3871, (s16)0x37AF, (s16)0x36E5, (s16)0x3612, (s16)0x3536, (s16)0x3453,
        (s16)0x3367, (s16)0x3274, (s16)0x3179, (s16)0x3076, (s16)0x2F6B, (s16)0x2E5A, (s16)0x2D41, (s16)0x2C21, (s16)0x2AFA, (s16)0x29CD,
        (s16)0x2899, (s16)0x275F, (s16)0x261F, (s16)0x24DA, (s16)0x238E, (s16)0x223D, (s16)0x20E7, (s16)0x1F8B, (s16)0x1E2B, (s16)0x1CC6,
        (s16)0x1B5D, (s16)0x19EF, (s16)0x187D, (s16)0x1708, (s16)0x158F, (s16)0x1413, (s16)0x1294, (s16)0x1111, (s16)0x0F8C, (s16)0x0E05,
        (s16)0x0C7C, (s16)0x0AF1, (s16)0x0964, (s16)0x07D5, (s16)0x0645, (s16)0x04B5, (s16)0x0323, (s16)0x0192, (s16)0x0000, (s16)0xFE6E,
        (s16)0xFCDD, (s16)0xFB4B, (s16)0xF9BB, (s16)0xF82B, (s16)0xF69C, (s16)0xF50F, (s16)0xF384, (s16)0xF1FB, (s16)0xF074, (s16)0xEEEF,
        (s16)0xED6C, (s16)0xEBED, (s16)0xEA71, (s16)0xE8F8, (s16)0xE783, (s16)0xE611, (s16)0xE4A3, (s16)0xE33A, (s16)0xE1D5, (s16)0xE075,
        (s16)0xDF19, (s16)0xDDC3, (s16)0xDC72, (s16)0xDB26, (s16)0xD9E1, (s16)0xD8A1, (s16)0xD767, (s16)0xD633, (s16)0xD506, (s16)0xD3DF,
        (s16)0xD2BF, (s16)0xD1A6, (s16)0xD095, (s16)0xCF8A, (s16)0xCE87, (s16)0xCD8C, (s16)0xCC99, (s16)0xCBAD, (s16)0xCACA, (s16)0xC9EE,
        (s16)0xC91B, (s16)0xC851, (s16)0xC78F, (s16)0xC6D6, (s16)0xC626, (s16)0xC57E, (s16)0xC4E0, (s16)0xC44A, (s16)0xC3BE, (s16)0xC33B,
        (s16)0xC2C2, (s16)0xC252, (s16)0xC1EC, (s16)0xC18F, (s16)0xC13B, (s16)0xC0F2, (s16)0xC0B2, (s16)0xC07C, (s16)0xC04F, (s16)0xC02D,
        (s16)0xC014, (s16)0xC005, (s16)0xC000, (s16)0xC005, (s16)0xC014, (s16)0xC02D, (s16)0xC04F, (s16)0xC07C, (s16)0xC0B2, (s16)0xC0F2,
        (s16)0xC13B, (s16)0xC18F, (s16)0xC1EC, (s16)0xC252, (s16)0xC2C2, (s16)0xC33B, (s16)0xC3BE, (s16)0xC44A, (s16)0xC4E0, (s16)0xC57E,
        (s16)0xC626, (s16)0xC6D6, (s16)0xC78F, (s16)0xC851, (s16)0xC91B, (s16)0xC9EE, (s16)0xCACA, (s16)0xCBAD, (s16)0xCC99, (s16)0xCD8C,
        (s16)0xCE87, (s16)0xCF8A, (s16)0xD095, (s16)0xD1A6, (s16)0xD2BF, (s16)0xD3DF, (s16)0xD506, (s16)0xD633, (s16)0xD767, (s16)0xD8A1,
        (s16)0xD9E1, (s16)0xDB26, (s16)0xDC72, (s16)0xDDC3, (s16)0xDF19, (s16)0xE075, (s16)0xE1D5, (s16)0xE33A, (s16)0xE4A3, (s16)0xE611,
        (s16)0xE783, (s16)0xE8F8, (s16)0xEA71, (s16)0xEBED, (s16)0xED6C, (s16)0xEEEF, (s16)0xF074, (s16)0xF1FB, (s16)0xF384, (s16)0xF50F,
        (s16)0xF69C, (s16)0xF82B, (s16)0xF9BB, (s16)0xFB4B, (s16)0xFCDD, (s16)0xFE6E };

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count)
{
    for (s32 i = 0; i < count; i++) {
        s32 cx = src[i].texX;
        s32 cy = src[i].texY;
        s16 dispx = src[i].scrX;
        s16 dispy = src[i].scrY;
        s16 rx = src[i].sx;
        s16 ry = src[i].sy;
        u16 theta = src[i].alpha >> 8;
        s32 a = sineTable[(theta + 0x40) & 255];
        s32 b = sineTable[theta];

        s16 dx = (rx * a) >> 14;
        s16 dmx = (rx * b) >> 14;
        s16 dy = (ry * b) >> 14;
        s16 dmy = (ry * a) >> 14;

        dest[i].pa = dx;
        dest[i].pb = -dmx;
        dest[i].pc = dy;
        dest[i].pd = dmy;

        s32 startx = cx - dx * dispx + dmx * dispy;
        s32 starty = cy - dy * dispx - dmy * dispy;

        dest[i].dx = startx;
        dest[i].dy = starty;
    }
}

void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset)
{
    for (s32 i = 0; i < count; i++) {
        s16 rx = src[i].xScale;
        s16 ry = src[i].yScale;
        u16 theta = src[i].rotation >> 8;

        s32 a = (s32)sineTable[(theta + 64) & 255];
        s32 b = (s32)sineTable[theta];

        s16 dx = ((s32)rx * a) >> 14;
        s16 dmx = ((s32)rx * b) >> 14;
        s16 dy = ((s32)ry * b) >> 14;
        s16 dmy = ((s32)ry * a) >> 14;

        CPUWriteHalfWord(dest, dx);
        dest += offset;
        CPUWriteHalfWord(dest, -dmx);
        dest += offset;
        CPUWriteHalfWord(dest, dy);
        dest += offset;
        CPUWriteHalfWord(dest, dmy);
        dest += offset;
    }
}

void SoftReset(u32 resetFlags) { }

void SoftResetExram(u32 resetFlags) { }

#if ENABLE_VRAM_VIEW
void VramDraw(SDL_Texture *texture)
{
    memset(vramBuffer, 0, sizeof(vramBuffer));
    gpsp_draw_vram_view(vramBuffer);
    SDL_UpdateTexture(texture, NULL, vramBuffer, VRAM_VIEW_WIDTH * sizeof(Uint16));
}
#endif

void VDraw(SDL_Texture *texture)
{
    gpsp_draw_frame(gameImage);
    SDL_UpdateTexture(texture, NULL, gameImage, DISPLAY_WIDTH * sizeof(Uint16));
    REG_VCOUNT = DISPLAY_HEIGHT + 1; // prep for being in VBlank period
}

u8 BinToBcd(u8 bin)
{
    int placeCounter = 1;
    u8 out = 0;
    do {
        out |= (bin % 10) * placeCounter;
        placeCounter *= 16;
    } while ((bin /= 10) > 0);

    return out;
}

// Following functions taken from mGBA's source
u16 ArcTan(s16 i)
{
    s32 a = -((i * i) >> 14);
    s32 b = ((0xA9 * a) >> 14) + 0x390;
    b = ((b * a) >> 14) + 0x91C;
    b = ((b * a) >> 14) + 0xFB6;
    b = ((b * a) >> 14) + 0x16AA;
    b = ((b * a) >> 14) + 0x2081;
    b = ((b * a) >> 14) + 0x3651;
    b = ((b * a) >> 14) + 0xA2F9;

    return (i * b) >> 16;
}

u16 ArcTan2(s16 x, s16 y)
{
    if (!y) {
        if (x >= 0)
            return 0;
        return 0x8000;
    }
    if (!x) {
        if (y >= 0)
            return 0x4000;
        return 0xC000;
    }
    if (y >= 0) {
        if (x >= 0) {
            if (x >= y)
                return ArcTan((y << 14) / x);
        } else if (-x >= y)
            return ArcTan((y << 14) / x) + 0x8000;
        return 0x4000 - ArcTan((x << 14) / y);
    } else {
        if (x <= 0) {
            if (-x > -y)
                return ArcTan((y << 14) / x) + 0x8000;
        } else if (x >= -y)
            return ArcTan((y << 14) / x) + 0x10000;
        return 0xC000 - ArcTan((x << 14) / y);
    }
}

u16 Sqrt(u32 num)
{
    if (!num)
        return 0;
    u32 lower;
    u32 upper = num;
    u32 bound = 1;
    while (bound < upper) {
        upper >>= 1;
        bound <<= 1;
    }
    while (1) {
        upper = num;
        u32 accum = 0;
        lower = bound;
        while (1) {
            u32 oldLower = lower;
            if (lower <= upper >> 1)
                lower <<= 1;
            if (oldLower >= upper >> 1)
                break;
        }
        while (1) {
            accum <<= 1;
            if (upper >= lower) {
                ++accum;
                upper -= lower;
            }
            if (lower == bound)
                break;
            lower >>= 1;
        }
        u32 oldBound = bound;
        bound += accum;
        bound >>= 1;
        if (bound >= oldBound) {
            bound = oldBound;
            break;
        }
    }
    return bound;
}

int MultiBoot(struct MultiBootParam *mp) { return 0; }
