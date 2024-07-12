#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#ifdef _WIN32
#include <windows.h>
#include <xinput.h>
#endif

#define ENABLE_AUDIO 0

#include <SDL.h>

#include "global.h"
#include "core.h"
#include "gba/defines.h"
#include "gba/flash_internal.h"
#include "gba/io_reg.h"
#include "gba/types.h"
#include "gba/m4a_internal.h"
#define DMA_DEST_MASK 0x0060
#define DMA_SRC_MASK  0x0180
#if ENABLE_AUDIO
#include "cgb_audio.h"
#endif

extern IntrFunc gIntrTable[16];
;

#if 0
extern u16 INTR_CHECK;
extern void *INTR_VECTOR;
extern unsigned char REG_BASE[0x400];
extern unsigned char PLTT[PLTT_SIZE];
extern unsigned char VRAM_[VRAM_SIZE];
extern unsigned char OAM[OAM_SIZE];
extern unsigned char FLASH_BASE[131072];
#endif
extern uint8_t EWRAM_START[EWRAM_SIZE];
extern uint8_t IWRAM_START[IWRAM_SIZE];
// TODO: REG_BASE needs to be u8, because of the address macro definitions
extern uint8_t REG_BASE[IO_SIZE];
extern uint16_t PLTT[PLTT_SIZE / sizeof(uint16_t)];
extern uint8_t VRAM[VRAM_SIZE];
extern uint8_t OAM[OAM_SIZE];
extern uint8_t FLASH_BASE[FLASH_ROM_SIZE_1M * SECTORS_PER_BANK];
ALIGNED(256) uint16_t gameImage[DISPLAY_WIDTH * DISPLAY_HEIGHT];

#define DMA_COUNT 4

struct DMATransfer {
    union {
        const void *src;
        const u16 *src16;
        const u32 *src32;
    };
    union {
        void *dst;
        vu16 *dst16;
        vu32 *dst32;
    };
    u32 size;
    u16 control;
} DMAList[DMA_COUNT];

enum { DMA_NOW, DMA_VBLANK, DMA_HBLANK, DMA_SPECIAL };

struct scanlineData {
    uint16_t layers[4][DISPLAY_WIDTH];
    uint16_t spriteLayers[4][DISPLAY_WIDTH];
    uint16_t bgcnts[4];
    uint16_t winMask[DISPLAY_WIDTH];
    // priority bookkeeping
    char bgtoprio[4]; // background to priority
    char prioritySortedBgs[4][4];
    char prioritySortedBgsCount[4];
};

struct bgPriority {
    char priority;
    char subPriority;
};

SDL_Thread *mainLoopThread;
SDL_Window *sdlWindow;
SDL_Renderer *sdlRenderer;
SDL_Texture *sdlTexture;
SDL_sem *vBlankSemaphore;
SDL_atomic_t isFrameAvailable;
bool speedUp = false;
#define INITIAL_VIDEO_SCALE 1
unsigned int videoScale = INITIAL_VIDEO_SCALE;
unsigned int preFullscreenVideoScale = INITIAL_VIDEO_SCALE;
bool videoScaleChanged = false;
bool isRunning = true;
bool paused = false;
double simTime = 0;
double lastGameTime = 0;
double curGameTime = 0;
double fixedTimestep = 1.0 / 60.0; // 16.666667ms
double timeScale = 1.0;
// struct SiiRtcInfo internalClock;

static FILE *sSaveFile = NULL;

extern void AgbMain(void);
void DoSoftReset(void) {};

int DoMain(void *param);
void ProcessEvents(void);
void VDraw(SDL_Texture *texture);

static void ReadSaveFile(char *path);
static void StoreSaveFile(void);
static void CloseSaveFile(void);

static void UpdateInternalClock(void);
static void RunDMAs(u32 type);

u16 Platform_GetKeyInput(void);

int main(int argc, char **argv)
{
    // Open an output console on Windows
#ifdef _WIN32
    AllocConsole();
    AttachConsole(GetCurrentProcessId());
    freopen("CON", "w", stdout);
#endif

    ReadSaveFile("pokeemerald.sav");

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) < 0) {
        fprintf(stderr, "SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

#ifdef TITLE_BAR
    const char *title = STR(TITLE_BAR);
#else
    const char *title = "SAT-R sa2";
#endif

    sdlWindow = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, DISPLAY_WIDTH * videoScale,
                                 DISPLAY_HEIGHT * videoScale, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (sdlWindow == NULL) {
        fprintf(stderr, "Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, SDL_RENDERER_PRESENTVSYNC);
    if (sdlRenderer == NULL) {
        fprintf(stderr, "Renderer could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    SDL_SetRenderDrawColor(sdlRenderer, 255, 255, 255, 255);
    SDL_RenderClear(sdlRenderer);
    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "0");
    SDL_RenderSetLogicalSize(sdlRenderer, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    sdlTexture = SDL_CreateTexture(sdlRenderer, SDL_PIXELFORMAT_ABGR1555, SDL_TEXTUREACCESS_STREAMING, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    if (sdlTexture == NULL) {
        fprintf(stderr, "Texture could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    simTime = curGameTime = lastGameTime = SDL_GetPerformanceCounter();

    isFrameAvailable.value = 0;
    vBlankSemaphore = SDL_CreateSemaphore(0);
    if (vBlankSemaphore == NULL) {
        SDL_LogError(SDL_LOG_CATEGORY_ERROR, "Failed to create Semaphore:\n  %s", SDL_GetError());
    }

#if ENABLE_AUDIO
    SDL_AudioSpec want;

    SDL_memset(&want, 0, sizeof(want)); /* or SDL_zero(want) */
    want.freq = 42048;
    want.format = AUDIO_F32;
    want.channels = 2;
    want.samples = 1024;
    cgb_audio_init(want.freq);

    if (SDL_OpenAudio(&want, 0) < 0)
        SDL_Log("Failed to open audio: %s", SDL_GetError());
    else {
        if (want.format != AUDIO_F32) /* we let this one thing change. */
            SDL_Log("We didn't get Float32 audio format.");
        SDL_PauseAudio(0);
    }
#endif

    VDraw(sdlTexture);
    mainLoopThread = SDL_CreateThread(DoMain, "AgbMain", NULL);

    double accumulator = 0.0;

#if 0
    memset(&internalClock, 0, sizeof(internalClock));
    internalClock.status = SIIRTCINFO_24HOUR;
    UpdateInternalClock();
#endif

    // Prevent the multiplayer screen from being drawn ( see core.c:GameInit() )
    REG_RCNT = 0x8000;
    REG_KEYINPUT = 0x3FF;

    while (isRunning) {
        ProcessEvents();

        if (!paused) {
            double dt = fixedTimestep / timeScale; // TODO: Fix speedup

            curGameTime = SDL_GetPerformanceCounter();
            double deltaTime = (double)((curGameTime - lastGameTime) / (double)SDL_GetPerformanceFrequency());
            if (deltaTime > (dt * 5))
                deltaTime = dt;
            lastGameTime = curGameTime;

            accumulator += deltaTime;

            while (accumulator >= dt) {
                REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();
                if (SDL_AtomicGet(&isFrameAvailable)) {
                    VDraw(sdlTexture);
                    SDL_RenderClear(sdlRenderer);
                    SDL_RenderCopy(sdlRenderer, sdlTexture, NULL, NULL);
                    SDL_AtomicSet(&isFrameAvailable, 0);

                    REG_DISPSTAT |= INTR_FLAG_VBLANK;

                    RunDMAs(DMA_HBLANK);

                    if (REG_DISPSTAT & DISPSTAT_VBLANK_INTR)
                        gIntrTable[INTR_INDEX_VBLANK]();
                    REG_DISPSTAT &= ~INTR_FLAG_VBLANK;

                    SDL_SemPost(vBlankSemaphore);

                    accumulator -= dt;
                }
            }
        }

        if (videoScaleChanged) {
            SDL_SetWindowSize(sdlWindow, DISPLAY_WIDTH * videoScale, DISPLAY_HEIGHT * videoScale);
            videoScaleChanged = false;
        }

        SDL_RenderPresent(sdlRenderer);
    }

    // StoreSaveFile();
    CloseSaveFile();

    SDL_DestroyWindow(sdlWindow);
    SDL_Quit();
    return 0;
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

// Key mappings
#define KEY_A_BUTTON      SDLK_z
#define KEY_B_BUTTON      SDLK_x
#define KEY_START_BUTTON  SDLK_RETURN
#define KEY_SELECT_BUTTON SDLK_BACKSLASH
#define KEY_L_BUTTON      SDLK_a
#define KEY_R_BUTTON      SDLK_s
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

static u16 keys;

u32 fullScreenFlags = 0;
static SDL_DisplayMode sdlDispMode = { 0 };

void ProcessEvents(void)
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
                                timeScale = 5.0;
                                SDL_PauseAudio(1);
                            }
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

#ifdef _WIN32
#define STICK_THRESHOLD 0.5f
u16 GetXInputKeys()
{
    XINPUT_STATE state;
    ZeroMemory(&state, sizeof(XINPUT_STATE));

    DWORD dwResult = XInputGetState(0, &state);
    u16 xinputKeys = 0;

    if (dwResult == ERROR_SUCCESS) {
        /* A */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_A) >> 12;
        /* B */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_X) >> 13;
        /* Start */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_START) >> 1;
        /* Select */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_BACK) >> 3;
        /* L */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_LEFT_SHOULDER) << 1;
        /* R */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER) >> 1;
        /* Up */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_UP) << 6;
        /* Down */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_DOWN) << 6;
        /* Left */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_LEFT) << 3;
        /* Right */ xinputKeys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_RIGHT) << 1;

        /* Control Stick */
        float xAxis = (float)state.Gamepad.sThumbLX / (float)SHRT_MAX;
        float yAxis = (float)state.Gamepad.sThumbLY / (float)SHRT_MAX;

        if (xAxis < -STICK_THRESHOLD)
            xinputKeys |= DPAD_LEFT;
        if (xAxis > STICK_THRESHOLD)
            xinputKeys |= DPAD_RIGHT;
        if (yAxis < -STICK_THRESHOLD)
            xinputKeys |= DPAD_DOWN;
        if (yAxis > STICK_THRESHOLD)
            xinputKeys |= DPAD_UP;

        /* Speedup */
        // Note: 'speedup' variable is only (un)set on keyboard input
        double oldTimeScale = timeScale;
        timeScale = (state.Gamepad.bRightTrigger > 0x80 || speedUp) ? 5.0 : 1.0;

        if (oldTimeScale != timeScale) {
            if (timeScale > 1.0) {
                SDL_PauseAudio(1);
            } else {
                SDL_ClearQueuedAudio(1);
                SDL_PauseAudio(0);
            }
        }
    }

    return xinputKeys;
}
#endif // _WIN32

u16 Platform_GetKeyInput(void)
{
#ifdef _WIN32
    u16 gamepadKeys = GetXInputKeys();
    return (gamepadKeys != 0) ? gamepadKeys : keys;
#endif

    return keys;
}

// BIOS function implementations are based on the VBA-M source code.

static uint32_t CPUReadMemory(const void *src) { return *(uint32_t *)src; }

static void CPUWriteMemory(void *dest, uint32_t val) { *(uint32_t *)dest = val; }

static uint16_t CPUReadHalfWord(const void *src) { return *(uint16_t *)src; }

static void CPUWriteHalfWord(void *dest, uint16_t val) { *(uint16_t *)dest = val; }

static uint8_t CPUReadByte(const void *src) { return *(uint8_t *)src; }

static void CPUWriteByte(void *dest, uint8_t val) { *(uint8_t *)dest = val; }

static void RunDMAs(u32 type)
{
    for (int dmaNum = 0; dmaNum < DMA_COUNT; dmaNum++) {
        struct DMATransfer *dma = &DMAList[dmaNum];
#if PLATFORM_GBA
        // Regular GBA order
        u32 dmaCntReg = (&REG_DMA0CNT)[dmaNum * 3];
#else
        // "64 bit" order
        u32 dmaCntReg = (&REG_DMA0CNT)[dmaNum];
#endif
        if (!((dmaCntReg >> 16) & DMA_ENABLE)) {
            dma->control &= ~DMA_ENABLE;
        }

        if ((dma->control & DMA_ENABLE) && (((dma->control & DMA_START_MASK) >> 12) == type)) {
            // printf("DMA%d src=%p, dest=%p, control=%d\n", dmaNum, dma->src, dma->dest,
            // dma->control);
            for (int i = 0; i < (dma->size); i++) {
                if ((dma->control) & DMA_32BIT)
                    *dma->dst32 = *dma->src32;
                else
                    *dma->dst16 = *dma->src16;

                // process destination pointer changes
                if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_INC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32++;
                    else
                        dma->dst16++;
                } else if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_DEC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32--;
                    else
                        dma->dst16--;
                } else if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_RELOAD) // TODO
                {
                    if ((dma->control) & DMA_32BIT)
                        dma->dst32++;
                    else
                        dma->dst16++;
                }

                // process source pointer changes
                if (((dma->control) & DMA_SRC_MASK) == DMA_SRC_INC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->src32++;
                    else
                        dma->src16++;
                } else if (((dma->control) & DMA_SRC_MASK) == DMA_SRC_DEC) {
                    if ((dma->control) & DMA_32BIT)
                        dma->src32--;
                    else
                        dma->src16--;
                }
            }

            if (dma->control & DMA_REPEAT) {
                dma->size = ((&REG_DMA0CNT)[dmaNum * 3] & 0x1FFFF);
                if (((dma->control) & DMA_DEST_MASK) == DMA_DEST_RELOAD) {
#if PLATFORM_GBA
                    dma->dst = (void *)(uintptr_t)(&REG_DMA0DAD)[dmaNum * 3];
#else
                    dma->dst = (void *)(uintptr_t)(&REG_DMA0DAD)[dmaNum * 2];
#endif
                }
            } else {
                dma->control &= ~DMA_ENABLE;
            }
        }
    }
}

#if PLATFORM_GBA
s32 Div(s32 num, s32 denom)
{
    if (denom != 0) {
        return num / denom;
    } else {
        return 0;
    }
}

s32 Mod(s32 num, s32 denom)
{
    if (denom != 0) {
        return num % denom;
    } else {
        return 0;
    }
}
#endif

int MultiBoot(struct MultiBootParam *mp) { return 0; }

#ifdef DmaSet
#undef DmaSet
#endif
void DmaSet(int dmaNum, const void *src, void *dest, u32 control)
{
    if (dmaNum >= DMA_COUNT) {
        fprintf(stderr, "DmaSet with invalid DMA number: dmaNum=%d, src=%p, dest=%p, control=%d\n", dmaNum, src, dest, control);
        return;
    }

#if PLATFORM_GBA
    // Regular GBA order
    (&REG_DMA0SAD)[dmaNum * 3] = (uintptr_t)src;
    (&REG_DMA0DAD)[dmaNum * 3] = (uintptr_t)dest;
    (&REG_DMA0CNT)[dmaNum * 3] = (size_t)control;
#else
    // "64 bit" order
    (&REG_DMA0SAD)[dmaNum * 2] = (uintptr_t)src;
    (&REG_DMA0DAD)[dmaNum * 2] = (uintptr_t)dest;
    (&REG_DMA0CNT)[dmaNum] = (size_t)control;
#endif

    struct DMATransfer *dma = &DMAList[dmaNum];
    dma->src = src;
    dma->dst = dest;
    dma->size = control & 0x1ffff;
    dma->control = control >> 16;

    // printf("\nDMA%d: S:%p %p -> %p\n", dmaNum, src, dest, dest + dma->size);

    RunDMAs(DMA_NOW);
}

void DmaStop(int dmaNum)
{
    (&REG_DMA0CNT)[dmaNum] &= ~((DMA_ENABLE | DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT) << 16);

    struct DMATransfer *dma = &DMAList[dmaNum];
    dma->control &= ~(DMA_ENABLE | DMA_START_MASK | DMA_DREQ_ON | DMA_REPEAT);
}

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
    int padding = (4 - remaining) & 0x3;
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
    while (padding--) {
        CPUWriteByte(dest, 0);
        dest++;
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

static const uint16_t bgMapSizes[][2] = {
    { 32, 32 },
    { 64, 32 },
    { 32, 64 },
    { 64, 64 },
};

#define mosaicBGEffectX                      (REG_MOSAIC & 0xF)
#define mosaicBGEffectY                      ((REG_MOSAIC >> 4) & 0xF)
#define mosaicSpriteEffectX                  ((REG_MOSAIC >> 8) & 0xF)
#define mosaicSpriteEffectY                  ((REG_MOSAIC >> 12) & 0xF)
#define applyBGHorizontalMosaicEffect(x)     (x - (x % (mosaicBGEffectX + 1)))
#define applyBGVerticalMosaicEffect(y)       (y - (y % (mosaicBGEffectY + 1)))
#define applySpriteHorizontalMosaicEffect(x) (x - (x % (mosaicSpriteEffectX + 1)))
#define applySpriteVerticalMosaicEffect(y)   (y - (y % (mosaicSpriteEffectY + 1)))

static void RenderBGScanline(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *line)
{
    unsigned int charBaseBlock = (control >> 2) & 3;
    unsigned int screenBaseBlock = (control >> 8) & 0x1F;
    unsigned int bitsPerPixel = ((control >> 7) & 1) ? 8 : 4;
    unsigned int mapWidth = bgMapSizes[control >> 14][0];
    unsigned int mapHeight = bgMapSizes[control >> 14][1];
    unsigned int mapWidthInPixels = mapWidth * 8;
    unsigned int mapHeightInPixels = mapHeight * 8;

    uint8_t *bgtiles = (uint8_t *)BG_CHAR_ADDR(charBaseBlock);
    uint16_t *pal = (uint16_t *)PLTT;

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);

    hoffs &= 0x1FF;
    voffs &= 0x1FF;

    for (unsigned int x = 0; x < DISPLAY_WIDTH; x++) {
        uint16_t *bgmap = (uint16_t *)BG_SCREEN_ADDR(screenBaseBlock);
        // adjust for scroll
        unsigned int xx;
        if (control & BGCNT_MOSAIC)
            xx = (applyBGHorizontalMosaicEffect(x) + hoffs) & 0x1FF;
        else
            xx = (x + hoffs) & 0x1FF;

        unsigned int yy = (lineNum + voffs) & 0x1FF;

        // if x or y go above 255 pixels it goes to the next screen base which are 0x400
        // WORDs long
        if (xx > 255 && mapWidthInPixels > 256) {
            bgmap += 0x400;
        }

        if (yy > 255 && mapHeightInPixels > 256) {
            // the width check is for 512x512 mode support, it jumps by two screen bases
            // instead
            bgmap += (mapWidthInPixels > 256) ? 0x800 : 0x400;
        }

        // maximum width for bgtile block is 256
        xx &= 0xFF;
        yy &= 0xFF;

        unsigned int mapX = xx / 8;
        unsigned int mapY = yy / 8;
        uint16_t entry = bgmap[mapY * 32 + mapX];

        unsigned int tileNum = entry & 0x3FF;
        unsigned int paletteNum = (entry >> 12) & 0xF;

        unsigned int tileX = xx % 8;
        unsigned int tileY = yy % 8;

        // Flip if necessary
        if (entry & (1 << 10))
            tileX = 7 - tileX;
        if (entry & (1 << 11))
            tileY = 7 - tileY;

        uint16_t tileLoc = tileNum * (bitsPerPixel * 8);
        uint16_t tileLocY = tileY * bitsPerPixel;
        uint16_t tileLocX = tileX;
        if (bitsPerPixel == 4)
            tileLocX /= 2;

        uint8_t pixel = bgtiles[tileLoc + tileLocY + tileLocX];

        if (bitsPerPixel == 4) {
            if (tileX & 1)
                pixel >>= 4;
            else
                pixel &= 0xF;

            if (pixel != 0)
                line[x] = pal[16 * paletteNum + pixel] | 0x8000;
        } else {
            line[x] = pal[pixel] | 0x8000;
        }
    }
}

static inline uint32_t getBgX(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2X;
    } else if (bgNumber == 3) {
        return REG_BG3X;
    }

    return 0;
}

static inline uint32_t getBgY(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2Y;
    } else if (bgNumber == 3) {
        return REG_BG3Y;
    }

    return 0;
}

static inline uint16_t getBgPA(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2PA;
    } else if (bgNumber == 3) {
        return REG_BG3PA;
    }
    return 0;
}

static inline uint16_t getBgPB(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2PB;
    } else if (bgNumber == 3) {
        return REG_BG3PB;
    }

    return 0;
}

static inline uint16_t getBgPC(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2PC;
    } else if (bgNumber == 3) {
        return REG_BG3PC;
    }

    return 0;
}

static inline uint16_t getBgPD(int bgNumber)
{
    if (bgNumber == 2) {
        return REG_BG2PD;
    } else if (bgNumber == 3) {
        return REG_BG3PD;
    }

    return 0;
}

static void RenderRotScaleBGScanline(int bgNum, uint16_t control, uint16_t x, uint16_t y, int lineNum, uint16_t *line)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;
    unsigned int charBaseBlock = bgcnt->charBaseBlock;
    unsigned int screenBaseBlock = bgcnt->screenBaseBlock;
    unsigned int mapWidth = 1 << (4 + (bgcnt->screenSize)); // number of tiles

    uint8_t *bgtiles = (uint8_t *)(VRAM + charBaseBlock * 0x4000);
    uint8_t *bgmap = (uint8_t *)(VRAM + screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);

    s16 pa = getBgPA(bgNum);
    s16 pb = getBgPB(bgNum);
    s16 pc = getBgPC(bgNum);
    s16 pd = getBgPD(bgNum);

    int sizeX = 128;
    int sizeY = 128;

    switch (bgcnt->screenSize) {
        case 0:
            break;
        case 1:
            sizeX = sizeY = 256;
            break;
        case 2:
            sizeX = sizeY = 512;
            break;
        case 3:
            sizeX = sizeY = 1024;
            break;
    }

    int maskX = sizeX - 1;
    int maskY = sizeY - 1;

    int yshift = ((control >> 14) & 3) + 4;

    /*int dx = pa & 0x7FFF;
    if (pa & 0x8000)
        dx |= 0xFFFF8000;
    int dmx = pb & 0x7FFF;
    if (pb & 0x8000)
        dmx |= 0xFFFF8000;
    int dy = pc & 0x7FFF;
    if (pc & 0x8000)
        dy |= 0xFFFF8000;
    int dmy = pd & 0x7FFF;
    if (pd & 0x8000)
        dmy |= 0xFFFF8000;*/

    s32 currentX = getBgX(bgNum);
    s32 currentY = getBgY(bgNum);
    // sign extend 28 bit number
    currentX = ((currentX & (1 << 27)) ? currentX | 0xF0000000 : currentX);
    currentY = ((currentY & (1 << 27)) ? currentY | 0xF0000000 : currentY);

    currentX += lineNum * pb;
    currentY += lineNum * pd;

    int realX = currentX;
    int realY = currentY;

    if (bgcnt->areaOverflowMode) {
        for (int x = 0; x < DISPLAY_WIDTH; x++) {
            int xxx = (realX >> 8) & maskX;
            int yyy = (realY >> 8) & maskY;

            int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

            int tileX = xxx & 7;
            int tileY = yyy & 7;

            uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

            if (pixel != 0) {
                line[x] = pal[pixel] | 0x8000;
            }

            realX += pa;
            realY += pc;
        }
    } else {
        for (int x = 0; x < DISPLAY_WIDTH; x++) {
            int xxx = (realX >> 8);
            int yyy = (realY >> 8);

            if (xxx < 0 || yyy < 0 || xxx >= sizeX || yyy >= sizeY) {
                // line[x] = 0x80000000;
            } else {
                int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

                int tileX = xxx & 7;
                int tileY = yyy & 7;

                uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

                if (pixel != 0) {
                    line[x] = pal[pixel] | 0x8000;
                }
            }
            realX += pa;
            realY += pc;
        }
    }
    // the only way i could figure out how to get accurate mosaic on affine bgs
    // luckily i dont think pokemon emerald uses mosaic on affine bgs
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0) {
        for (int x = 0; x < DISPLAY_WIDTH; x++) {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
        }
    }
}

const u8 spriteSizes[][2] = {
    { 8, 16 },
    { 8, 32 },
    { 16, 32 },
    { 32, 64 },
};

#define getAlphaBit(x)     ((x >> 15) & 1)
#define getRedChannel(x)   ((x >> 0) & 0x1F)
#define getGreenChannel(x) ((x >> 5) & 0x1F)
#define getBlueChannel(x)  ((x >> 10) & 0x1F)
#define isbgEnabled(x)     ((REG_DISPCNT >> 8) & 0xF) & (1 << x)

static uint16_t alphaBlendColor(uint16_t targetA, uint16_t targetB)
{
    unsigned int eva = REG_BLDALPHA & 0x1F;
    unsigned int evb = (REG_BLDALPHA >> 8) & 0x1F;
    // shift right by 4 = division by 16
    unsigned int r = ((getRedChannel(targetA) * eva) + (getRedChannel(targetB) * evb)) >> 4;
    unsigned int g = ((getGreenChannel(targetA) * eva) + (getGreenChannel(targetB) * evb)) >> 4;
    unsigned int b = ((getBlueChannel(targetA) * eva) + (getBlueChannel(targetB) * evb)) >> 4;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | (1 << 15);
}

static uint16_t alphaBrightnessIncrease(uint16_t targetA)
{
    unsigned int evy = (REG_BLDY & 0x1F);
    unsigned int r = getRedChannel(targetA) + (31 - getRedChannel(targetA)) * evy / 16;
    unsigned int g = getGreenChannel(targetA) + (31 - getGreenChannel(targetA)) * evy / 16;
    unsigned int b = getBlueChannel(targetA) + (31 - getBlueChannel(targetA)) * evy / 16;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | (1 << 15);
}

static uint16_t alphaBrightnessDecrease(uint16_t targetA)
{
    unsigned int evy = (REG_BLDY & 0x1F);
    unsigned int r = getRedChannel(targetA) - getRedChannel(targetA) * evy / 16;
    unsigned int g = getGreenChannel(targetA) - getGreenChannel(targetA) * evy / 16;
    unsigned int b = getBlueChannel(targetA) - getBlueChannel(targetA) * evy / 16;

    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

    return r | (g << 5) | (b << 10) | (1 << 15);
}

// outputs the blended pixel in colorOutput, the prxxx are the bg priority and
// subpriority, pixelpos is pixel offset in scanline
static bool alphaBlendSelectTargetB(struct scanlineData *scanline, uint16_t *colorOutput, char prnum, char prsub, int pixelpos,
                                    bool spriteBlendEnabled)
{
    // iterate trough every possible bg to blend with, starting from specified priorities
    // from arguments
    for (unsigned int blndprnum = prnum; blndprnum <= 3; blndprnum++) {
        // check if sprite is available to blend with, if sprite blending is enabled
        if (spriteBlendEnabled == true && getAlphaBit(scanline->spriteLayers[blndprnum][pixelpos]) == 1) {
            *colorOutput = scanline->spriteLayers[blndprnum][pixelpos];
            return true;
        }

        for (unsigned int blndprsub = prsub; blndprsub < scanline->prioritySortedBgsCount[blndprnum]; blndprsub++) {
            char currLayer = scanline->prioritySortedBgs[blndprnum][blndprsub];
            if (getAlphaBit(scanline->layers[currLayer][pixelpos]) == 1 && REG_BLDCNT & (1 << (8 + currLayer)) && isbgEnabled(currLayer)) {
                *colorOutput = scanline->layers[currLayer][pixelpos];
                return true;
            }
            // if we hit a non target layer we should bail
            if (getAlphaBit(scanline->layers[currLayer][pixelpos]) == 1 && isbgEnabled(currLayer) && prnum != blndprnum) {
                return false;
            }
        }
        prsub = 0; // start from zero in the next iteration
    }
    // no background got hit, check if backdrop is enabled and return it if enabled
    // otherwise fail
    if (REG_BLDCNT & BLDCNT_TGT2_BD) {
        *colorOutput = *(uint16_t *)PLTT;
        return true;
    } else {
        return false;
    }
}

#define WINMASK_BG0    (1 << 0)
#define WINMASK_BG1    (1 << 1)
#define WINMASK_BG2    (1 << 2)
#define WINMASK_BG3    (1 << 3)
#define WINMASK_OBJ    (1 << 4)
#define WINMASK_CLR    (1 << 5)
#define WINMASK_WINOUT (1 << 6)

// checks if window horizontal is in bounds and takes account WIN wraparound
static bool winCheckHorizontalBounds(u16 left, u16 right, u16 xpos)
{
    if (left > right)
        return (xpos >= left || xpos < right);
    else
        return (xpos >= left && xpos < right);
}

// Parts of this code heavily borrowed from NanoboyAdvance.
static void DrawSprites(struct scanlineData *scanline, uint16_t vcount, bool windowsEnabled)
{
    int i;
    unsigned int x;
    unsigned int y;
    void *objtiles = VRAM + 0x10000;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    bool winShouldBlendPixel = true;

    int16_t matrix[2][2] = {};

    if (!(REG_DISPCNT & (1 << 6))) {
        puts("2-D OBJ Character mapping not supported.");
    }

    for (i = OAM_ENTRY_COUNT - 1; i >= 0; i--) {
        OamData *oam = &((OamData *)OAM)[i];
        unsigned int width;
        unsigned int height;
        uint16_t *pixels;

        bool isAffine = oam->split.affineMode & 1;
        bool doubleSizeOrDisabled = (oam->split.affineMode >> 1) & 1;
        bool isSemiTransparent = (oam->split.objMode == 1);
        bool isObjWin = (oam->split.objMode == 2);

        if (!(isAffine) && doubleSizeOrDisabled) // disable for non-affine
        {
            continue;
        }

        if (oam->split.shape == 0) {
            width = (1 << oam->split.size) * 8;
            height = (1 << oam->split.size) * 8;
        } else if (oam->split.shape == 1) // wide
        {
            width = spriteSizes[oam->split.size][1];
            height = spriteSizes[oam->split.size][0];
        } else if (oam->split.shape == 2) // tall
        {
            width = spriteSizes[oam->split.size][0];
            height = spriteSizes[oam->split.size][1];
        } else {
            continue; // prohibited, do not draw
        }

        int rect_width = width;
        int rect_height = height;

        int half_width = width / 2;
        int half_height = height / 2;

        pixels = scanline->spriteLayers[oam->split.priority];

        int32_t x = oam->split.x;
        int32_t y = oam->split.y;

        if (x >= DISPLAY_WIDTH)
            x -= 512;
        if (y >= DISPLAY_HEIGHT)
            y -= 256;

        if (isAffine) {
            // TODO: there is probably a better way to do this
            u8 matrixNum = oam->split.matrixNum * 4;

            OamData *oam1 = &((OamData *)OAM)[matrixNum];
            OamData *oam2 = &((OamData *)OAM)[matrixNum + 1];
            OamData *oam3 = &((OamData *)OAM)[matrixNum + 2];
            OamData *oam4 = &((OamData *)OAM)[matrixNum + 3];

            matrix[0][0] = oam1->all.affineParam;
            matrix[0][1] = oam2->all.affineParam;
            matrix[1][0] = oam3->all.affineParam;
            matrix[1][1] = oam4->all.affineParam;

            if (doubleSizeOrDisabled) // double size for affine
            {
                rect_width *= 2;
                rect_height *= 2;
                half_width *= 2;
                half_height *= 2;
            }
        } else {
            // Identity
            matrix[0][0] = 0x100;
            matrix[0][1] = 0;
            matrix[1][0] = 0;
            matrix[1][1] = 0x100;
        }

        x += half_width;
        y += half_height;

        // Does this sprite actually draw on this scanline?
        if (vcount >= (y - half_height) && vcount < (y + half_height)) {
            int local_y = (oam->split.mosaic == 1) ? applySpriteVerticalMosaicEffect(vcount) - y : vcount - y;
            int number = oam->split.tileNum;
            int palette = oam->split.paletteNum;
            bool flipX = !isAffine && ((oam->split.matrixNum >> 3) & 1);
            bool flipY = !isAffine && ((oam->split.matrixNum >> 4) & 1);
            bool is8BPP = oam->split.bpp & 1;

            for (int local_x = -half_width; local_x <= half_width; local_x++) {
                uint8_t *tiledata = (uint8_t *)objtiles;
                uint16_t *palette = (uint16_t *)(PLTT + (0x200 / 2));
                int local_mosaicX;
                int tex_x;
                int tex_y;

                unsigned int global_x = local_x + x;

                if (global_x < 0 || global_x >= DISPLAY_WIDTH)
                    continue;

                if (oam->split.mosaic == 1) {
                    // mosaic effect has to be applied to global coordinates otherwise
                    // the mosaic will scroll
                    local_mosaicX = applySpriteHorizontalMosaicEffect(global_x) - x;
                    tex_x = ((matrix[0][0] * local_mosaicX + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_mosaicX + matrix[1][1] * local_y) >> 8) + (height / 2);
                } else {
                    tex_x = ((matrix[0][0] * local_x + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_x + matrix[1][1] * local_y) >> 8) + (height / 2);
                }

                /* Check if transformed coordinates are inside bounds. */

                if (tex_x >= width || tex_y >= height || tex_x < 0 || tex_y < 0)
                    continue;

                if (flipX)
                    tex_x = width - tex_x - 1;
                if (flipY)
                    tex_y = height - tex_y - 1;

                int tile_x = tex_x % 8;
                int tile_y = tex_y % 8;
                int block_x = tex_x / 8;
                int block_y = tex_y / 8;
                int block_offset = ((block_y * (REG_DISPCNT & 0x40 ? (width / 8) : 16)) + block_x);
                uint16_t pixel = 0;

                if (!is8BPP) {
                    pixel = tiledata[(block_offset + oam->split.tileNum) * 32 + (tile_y * 4) + (tile_x / 2)];
                    if (tile_x & 1)
                        pixel >>= 4;
                    else
                        pixel &= 0xF;
                    palette += oam->split.paletteNum * 16;
                } else {
                    pixel = tiledata[(block_offset * 2 + oam->split.tileNum) * 32 + (tile_y * 8) + tile_x];
                }

                if (pixel != 0) {
                    uint16_t color = palette[pixel];
                    ;

                    // if sprite mode is 2 then write to the window mask instead
                    if (isObjWin) {
                        if (scanline->winMask[global_x] & WINMASK_WINOUT)
                            scanline->winMask[global_x] = (REG_WINOUT >> 8) & 0x3F;
                        continue;
                    }
                    // this code runs if pixel is to be drawn
                    if (global_x < DISPLAY_WIDTH && global_x >= 0) {
                        // check if its enabled in the window (if window is enabled)
                        winShouldBlendPixel = (windowsEnabled == false || scanline->winMask[global_x] & WINMASK_CLR);

                        // has to be separated from the blend mode switch statement
                        // because of OBJ semi transparancy feature
                        if ((blendMode == 1 && REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) || isSemiTransparent) {
                            uint16_t targetA = color;
                            uint16_t targetB = 0;
                            if (alphaBlendSelectTargetB(scanline, &targetB, oam->split.priority, 0, global_x, false)) {
                                color = alphaBlendColor(targetA, targetB);
                            }
                        } else if (REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) {
                            switch (blendMode) {
                                case 2:
                                    color = alphaBrightnessIncrease(color);
                                    break;
                                case 3:
                                    color = alphaBrightnessDecrease(color);
                                    break;
                            }
                        }

                        // write pixel to pixel framebuffer
                        pixels[global_x] = color | (1 << 15);
                    }
                }
            }
        }
    }
}

static void DrawScanline(uint16_t *pixels, uint16_t vcount)
{
    unsigned int mode = REG_DISPCNT & 3;
    unsigned char numOfBgs = (mode == 0 ? 4 : 3);
    int bgnum, prnum;
    struct scanlineData scanline;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    unsigned int xpos;

    // initialize all priority bookkeeping data
    memset(scanline.layers, 0, sizeof(scanline.layers));
    memset(scanline.winMask, 0, sizeof(scanline.winMask));
    memset(scanline.spriteLayers, 0, sizeof(scanline.spriteLayers));
    memset(scanline.prioritySortedBgsCount, 0, sizeof(scanline.prioritySortedBgsCount));

    for (bgnum = 0; bgnum < numOfBgs; bgnum++) {
        uint16_t bgcnt = *(uint16_t *)(REG_ADDR_BG0CNT + bgnum * 2);
        uint16_t priority;
        scanline.bgcnts[bgnum] = bgcnt;
        scanline.bgtoprio[bgnum] = priority = (bgcnt & 3);

        char priorityCount = scanline.prioritySortedBgsCount[priority];
        scanline.prioritySortedBgs[priority][priorityCount] = bgnum;
        scanline.prioritySortedBgsCount[priority]++;
    }

    switch (mode) {
        case 0:
            // All backgrounds are text mode
            for (bgnum = 3; bgnum >= 0; bgnum--) {
                if (isbgEnabled(bgnum)) {
                    uint16_t bghoffs = *(uint16_t *)(REG_ADDR_BG0HOFS + bgnum * 4);
                    uint16_t bgvoffs = *(uint16_t *)(REG_ADDR_BG0VOFS + bgnum * 4);

                    RenderBGScanline(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, scanline.layers[bgnum]);
                }
            }

            break;
        case 1:
            // BG2 is affine
            bgnum = 2;
            if (isbgEnabled(bgnum)) {
                RenderRotScaleBGScanline(bgnum, scanline.bgcnts[bgnum], REG_BG2X, REG_BG2Y, vcount, scanline.layers[bgnum]);
            }
            // BG0 and BG1 are text mode
            for (bgnum = 1; bgnum >= 0; bgnum--) {
                if (isbgEnabled(bgnum)) {
                    uint16_t bghoffs = *(uint16_t *)(REG_ADDR_BG0HOFS + bgnum * 4);
                    uint16_t bgvoffs = *(uint16_t *)(REG_ADDR_BG0VOFS + bgnum * 4);

                    RenderBGScanline(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, scanline.layers[bgnum]);
                }
            }
            break;
        default:
            printf("Video mode %u is unsupported.\n", mode);
            break;
    }

    bool windowsEnabled = false;
    uint16_t WIN0bottom, WIN0top, WIN0right, WIN0left;
    uint16_t WIN1bottom, WIN1top, WIN1right, WIN1left;
    bool WIN0enable, WIN1enable;
    WIN0enable = false;
    WIN1enable = false;

    // figure out if WIN0 masks on this scanline
    if (REG_DISPCNT & DISPCNT_WIN0_ON) {
        // acquire the window coordinates
        WIN0bottom = (REG_WIN0V & 0xFF); // y2;
        WIN0top = (REG_WIN0V & 0xFF00) >> 8; // y1;
        WIN0right = (REG_WIN0H & 0xFF); // x2
        WIN0left = (REG_WIN0H & 0xFF00) >> 8; // x1

        // figure out WIN Y wraparound and check bounds accordingly
        if (WIN0top > WIN0bottom) {
            if (vcount >= WIN0top || vcount < WIN0bottom)
                WIN0enable = true;
        } else {
            if (vcount >= WIN0top && vcount < WIN0bottom)
                WIN0enable = true;
        }

        windowsEnabled = true;
    }
    // figure out if WIN1 masks on this scanline
    if (REG_DISPCNT & DISPCNT_WIN1_ON) {
        WIN1bottom = (REG_WIN0V & 0xFF); // y2;
        WIN1top = (REG_WIN0V & 0xFF00) >> 8; // y1;
        WIN1right = (REG_WIN0H & 0xFF); // x2
        WIN1left = (REG_WIN0H & 0xFF00) >> 8; // x1

        if (WIN1top > WIN1bottom) {
            if (vcount >= WIN1top || vcount < WIN1bottom)
                WIN1enable = true;
        } else {
            if (vcount >= WIN1top && vcount < WIN1bottom)
                WIN1enable = true;
        }

        windowsEnabled = true;
    }
    // enable windows if OBJwin is enabled
    if (REG_DISPCNT & DISPCNT_OBJWIN_ON && REG_DISPCNT & DISPCNT_OBJ_ON) {
        windowsEnabled = true;
    }

    // draw to pixel mask
    if (windowsEnabled) {
        for (xpos = 0; xpos < DISPLAY_WIDTH; xpos++) {
            // win0 checks
            if (WIN0enable && winCheckHorizontalBounds(WIN0left, WIN0right, xpos))
                scanline.winMask[xpos] = REG_WININ & 0x3F;
            // win1 checks
            else if (WIN1enable && winCheckHorizontalBounds(WIN1left, WIN1right, xpos))
                scanline.winMask[xpos] = (REG_WININ >> 8) & 0x3F;
            else
                scanline.winMask[xpos] = (REG_WINOUT & 0x3F) | WINMASK_WINOUT;
        }
    }

    if (REG_DISPCNT & DISPCNT_OBJ_ON)
        DrawSprites(&scanline, vcount, windowsEnabled);

    // iterate trough every priority in order
    for (prnum = 3; prnum >= 0; prnum--) {
        for (char prsub = scanline.prioritySortedBgsCount[prnum] - 1; prsub >= 0; prsub--) {
            char bgnum = scanline.prioritySortedBgs[prnum][prsub];
            // if background is enabled then draw it
            if (isbgEnabled(bgnum)) {
                uint16_t *src = scanline.layers[bgnum];
                // copy all pixels to framebuffer
                for (xpos = 0; xpos < DISPLAY_WIDTH; xpos++) {
                    uint16_t color = src[xpos];
                    bool winEffectEnable = true;

                    if (!getAlphaBit(color))
                        continue; // do nothing if alpha bit is not set

                    if (windowsEnabled) {
                        winEffectEnable = ((scanline.winMask[xpos] & WINMASK_CLR) >> 5);
                        // if bg is disabled inside the window then do not draw the pixel
                        if (!(scanline.winMask[xpos] & 1 << bgnum))
                            continue;
                    }

                    // blending code
                    if (blendMode != 0 && REG_BLDCNT & (1 << bgnum) && winEffectEnable) {
                        uint16_t targetA = color;
                        uint16_t targetB = 0;
                        char isSpriteBlendingEnabled;

                        switch (blendMode) {
                            case 1:
                                isSpriteBlendingEnabled = REG_BLDCNT & BLDCNT_TGT2_OBJ ? 1 : 0;
                                // find targetB and blend it
                                if (alphaBlendSelectTargetB(&scanline, &targetB, prnum, prsub + 1, xpos, isSpriteBlendingEnabled)) {
                                    color = alphaBlendColor(targetA, targetB);
                                }
                                break;
                            case 2:
                                color = alphaBrightnessIncrease(targetA);
                                break;
                            case 3:
                                color = alphaBrightnessDecrease(targetA);
                                break;
                        }
                    }
                    // write the pixel to scanline buffer output
                    pixels[xpos] = color;
                }
            }
        }
        // draw sprites on current priority
        uint16_t *src = scanline.spriteLayers[prnum];
        for (xpos = 0; xpos < DISPLAY_WIDTH; xpos++) {
            if (getAlphaBit(src[xpos])) {
                // check if sprite pixel draws inside window
                if (windowsEnabled && !(scanline.winMask[xpos] & WINMASK_OBJ))
                    continue;
                // draw the pixel
                pixels[xpos] = src[xpos];
            }
        }
    }
}

uint16_t *memsetu16(uint16_t *dst, uint16_t fill, size_t count)
{
    for (int i = 0; i < count; i++) {
        *dst++ = fill;
    }

    return 0;
}

static void DrawFrame(uint16_t *pixels)
{
    int i;
    int j;
    static uint16_t scanlines[DISPLAY_HEIGHT][DISPLAY_WIDTH];
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    uint16_t backdropColor = *(uint16_t *)PLTT;

    // backdrop color brightness effects
    if (REG_BLDCNT & BLDCNT_TGT1_BD) {
        switch (blendMode) {
            case 2:
                backdropColor = alphaBrightnessIncrease(backdropColor);
                break;
            case 3:
                backdropColor = alphaBrightnessDecrease(backdropColor);
                break;
        }

        // Make sure to push the backdrop color back to PLTT mem.
        *(uint16_t *)PLTT = backdropColor;
    }

    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        REG_VCOUNT = i;
        if (((REG_DISPSTAT >> 8) & 0xFF) == REG_VCOUNT) {
            REG_DISPSTAT |= INTR_FLAG_VCOUNT;
            if (REG_DISPSTAT & DISPSTAT_VCOUNT_INTR)
                gIntrTable[INTR_INDEX_VCOUNT]();
        }

        // Render the backdrop color before the each individual scanline.
        // HBlank interrupt code could have changed it inbetween lines.
        memsetu16(scanlines[i], *(uint16_t *)PLTT, DISPLAY_WIDTH);
        DrawScanline(scanlines[i], i);

        REG_DISPSTAT |= INTR_FLAG_HBLANK;

        RunDMAs(DMA_HBLANK);

        if (REG_DISPSTAT & DISPSTAT_HBLANK_INTR)
            gIntrTable[INTR_INDEX_HBLANK]();

        REG_DISPSTAT &= ~INTR_FLAG_HBLANK;
        REG_DISPSTAT &= ~INTR_FLAG_VCOUNT;
    }

    // Copy to screen
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        uint16_t *src = scanlines[i];
        for (j = 0; j < DISPLAY_WIDTH; j++) {
            pixels[i * DISPLAY_WIDTH + j] = src[j];
        }
    }
}

void VDraw(SDL_Texture *texture)
{
    memset(gameImage, 0, sizeof(gameImage));
    DrawFrame(gameImage);
    SDL_UpdateTexture(texture, NULL, gameImage, DISPLAY_WIDTH * sizeof(Uint16));
    REG_VCOUNT = 161; // prep for being in VBlank period
}

int DoMain(void *data)
{
    AgbMain();
    return 0;
}

void VBlankIntrWait(void)
{
    SDL_AtomicSet(&isFrameAvailable, 1);
    SDL_SemWait(vBlankSemaphore);
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
