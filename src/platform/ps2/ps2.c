#include <stdio.h>
#include <stdlib.h>

// PS2 libs
#include <kernel.h>
#include <sifrpc.h>
#include <iopcontrol.h>
#include <sbv_patches.h>

#include <ps2_filesystem_driver.h>
#include <ps2_audio_driver.h>
#include <ps2_joystick_driver.h>
#include <libpad.h>
#include <libmtap.h>
#include <gsKit.h>
#include <audsrv.h>

// Game
#include "global.h"
#include "core.h"
#include "lib/agb_flash/flash_internal.h"

// Emulation
#include "platform/shared/dma.h"
#include "platform/shared/audio/cgb_audio.h"
#include "platform/shared/video/gpsp_renderer.h"

static GSGLOBAL *gsGlobal;
static GSTEXTURE screen;

ALIGNED(256) uint16_t gameImage[DISPLAY_WIDTH * (DISPLAY_HEIGHT + 1)];

struct VidMode {
    const char *name;
    s16 mode;
    s16 interlace;
    s16 field;
    int max_width;
    int max_height;
    int width;
    int height;
    int vck;
    int iPassCount;
    int x_off;
    int y_off;
};

static const struct VidMode vid_modes[] = {
    { "240p", GS_MODE_NTSC, GS_NONINTERLACED, GS_FRAME, 652, 224, 320, 224, 2, 1, 0, 0 },
#if !defined(VERSION_EU)
    // NTSC
    { "480i", GS_MODE_NTSC, GS_INTERLACED, GS_FIELD, 704, 480, 704, 452, 4, 1, 0, 0 },
    { "480p", GS_MODE_DTV_480P, GS_NONINTERLACED, GS_FRAME, 704, 480, 704, 452, 2, 1, 0, 0 },
#else
    // PAL
    { "576i", GS_MODE_PAL, GS_INTERLACED, GS_FIELD, 704, 576, 704, 536, 4, 1, 0, 0 },
    { "576p", GS_MODE_DTV_576P, GS_NONINTERLACED, GS_FRAME, 704, 576, 704, 536, 2, 1, 0, 0 },
#endif
    // HDTV
    { "720p", GS_MODE_DTV_720P, GS_NONINTERLACED, GS_FRAME, 1280, 720, 1280, 720, 1, 2, 0, 0 },
    { "1080i", GS_MODE_DTV_1080I, GS_INTERLACED, GS_FRAME, 1920, 1080, 1920, 1080, 1, 2, 0, 0 },
};

static const struct VidMode *vid_mode;
static bool use_hires = false;

static u8 padbuf[256] __attribute__((aligned(64)));
static int init_done = 0;

static int joy_port = -1;
static int joy_slot = -1;
static int joy_id = -1;
static struct padButtonStatus joy_buttons __attribute__((aligned(64)));

bool speedUp = false;
bool isRunning = true;
bool paused = false;
bool stepOneFrame = false;
bool headless = false;

double lastGameTime = 0;
double curGameTime = 0;
double fixedTimestep = 1.0 / 60.0; // 16.666667ms
double timeScale = 1.0;
double accumulator = 0.0;

static FILE *sSaveFile = NULL;

extern void AgbMain(void);

void VideoUpdateTexture(void);

static void ReadSaveFile(char *path);
static void StoreSaveFile(void);
static void CloseSaveFile(void);

u16 Platform_GetKeyInput(void);

// Audio

static bool AudioInit(void)
{
    if (init_audio_driver() != 0)
        return false;
    audsrv_set_volume(MAX_VOLUME);

    audsrv_fmt_t fmt;

    fmt.freq = 48000;
    fmt.bits = 16;
    fmt.channels = 2;

    if (audsrv_set_format(&fmt)) {
        printf("audio_ps2: unsupported sound format\n");
        audsrv_quit();
        return false;
    }

    return true;
}

static void AudioPlay(const uint8_t *buf, size_t len)
{
    if ((audsrv_queued() / 4) < 6000) {
        audsrv_play_audio(buf, len);
    }
}

// Video

void VideoInit(void)
{
    if (vid_mode == NULL) {
        vid_mode = &vid_modes[3]; // Standard def 480p
    } else {
        if (use_hires) {
            gsKit_hires_deinit_global(gsGlobal);
        } else {
            gsKit_deinit_global(gsGlobal);
        }
    }
    use_hires = (vid_mode->mode == GS_MODE_DTV_720P || vid_mode->mode == GS_MODE_DTV_1080I);

    if (use_hires) {
        gsGlobal = gsKit_hires_init_global();
    } else {
        gsGlobal = gsKit_init_global();
    }

    dmaKit_init(D_CTRL_RELE_OFF, D_CTRL_MFD_OFF, D_CTRL_STS_UNSPEC, D_CTRL_STD_OFF, D_CTRL_RCYC_8, 1 << DMA_CHANNEL_GIF);

    dmaKit_chan_init(DMA_CHANNEL_GIF);

    gsGlobal->Mode = vid_mode->mode;
    gsGlobal->Width = vid_mode->width;
    gsGlobal->Height = vid_mode->height;
    if (gsGlobal->Mode == GS_MODE_DTV_1080I) {
        gsGlobal->Height /= 2;
    }

    gsGlobal->Interlace = vid_mode->interlace;
    gsGlobal->Field = vid_mode->field;
    gsGlobal->ZBuffering = GS_SETTING_ON;
    gsGlobal->DoubleBuffering = GS_SETTING_ON;
    gsGlobal->PrimAAEnable = GS_SETTING_OFF;
    gsGlobal->Dithering = GS_SETTING_OFF;
    gsGlobal->PSM = GS_PSM_CT16;
    gsGlobal->PSMZ = GS_PSMZ_16;

    if (use_hires) {
        gsKit_hires_init_screen(gsGlobal, vid_mode->iPassCount);
    } else {
        gsKit_init_screen(gsGlobal);
    }
    // hires sets the texture pointer to the wrong location. Ensure it's correct.
    gsGlobal->TexturePointer = gsGlobal->CurrentPointer;
    gsKit_TexManager_init(gsGlobal);

    screen.Width = DISPLAY_WIDTH;
    screen.Height = DISPLAY_HEIGHT;
    screen.PSM = GS_PSM_CT16;
    screen.Mem = (void *)gameImage;
}

void VideoUpdateTexture(void)
{
    gsKit_TexManager_invalidate(gsGlobal, &screen);
    gsKit_TexManager_bind(gsGlobal, &screen);

    int startX = (gsGlobal->Width);
    int startY = (gsGlobal->Height);

    gsKit_clear(gsGlobal, GS_SETREG_RGBAQ(0, 0, 0, 0, 0));

    gsKit_prim_sprite_texture(gsGlobal, &screen,
                              0.0f, // X1
                              0.0f, // Y2
                              0.0f, // U1
                              0.0f, // V1
                              startX, // X2
                              startY, // Y2
                              gsGlobal->Width, // U2
                              gsGlobal->Height, // V2
                              0, GS_SETREG_RGBAQ(128, 128, 128, 0, 0));
}

// Controller

static inline int WaitPad(int tries)
{
    int state = padGetState(joy_port, joy_slot);
    if (state == PAD_STATE_DISCONN) {
        joy_id = -1;
        return -1;
    }

    while ((state != PAD_STATE_STABLE) && (state != PAD_STATE_FINDCTP1)) {
        state = padGetState(joy_port, joy_slot);
        if (--tries == 0)
            break;
    }

    return 0;
}

static int DetectPad(void)
{
    int id = padInfoMode(joy_port, joy_slot, PAD_MODECURID, 0);
    if (id <= 0)
        return -1;

    const int ext = padInfoMode(joy_port, joy_slot, PAD_MODECUREXID, 0);
    if (ext)
        id = ext;

    printf("ControllerInit: detected pad type %d\n", id);

    if (id == PAD_TYPE_DIGITAL || id == PAD_TYPE_DUALSHOCK)
        padSetMainMode(joy_port, joy_slot, PAD_MMODE_DUALSHOCK, PAD_MMODE_LOCK);

    return id;
}

static void ControllerInit(void)
{
    int ret = -1;

    // MEMORY CARD already initied SIO2MAN
    ret = init_joystick_driver(false);

    if (ret != 0) {
        printf("ControllerInit: failed to init joystick driver: %d\n", ret);
        return;
    }

    const int numports = padGetPortMax();
    // Find the first device connected
    for (int port = 0; port < numports && joy_port < 0; ++port) {
        if (joy_port == -1 && joy_slot == -1 && mtapPortOpen(port)) {
            const int maxslots = padGetSlotMax(port);
            for (int slot = 0; slot < maxslots; ++slot) {
                if (joy_port == -1 && joy_slot == -1 && padPortOpen(port, slot, padbuf) >= 0) {
                    joy_port = port;
                    joy_slot = slot;
                    printf("ControllerInit: using pad (%d, %d)\n", port, slot);
                    break;
                }
            }
        }
    }

    if (joy_slot < 0 || joy_port < 0) {
        printf("ControllerInit: could not open a single port\n");
        return;
    }

    init_done = 1;
}

static u16 ControllerRead(void)
{
    if (!init_done)
        return 0;

    if (WaitPad(10) < 0)
        return 0; // nothing received

    if (joy_id < 0) {
        // pad not detected yet, do it
        joy_id = DetectPad();
        if (joy_id < 0)
            return 0; // still nothing
        if (WaitPad(10) < 0)
            return 0;
    }

    if (padRead(joy_port, joy_slot, &joy_buttons)) {
        return 0xffff ^ joy_buttons.btns;
    }

    return 0;
}

// PS2 Drivers
void ResetIOP()
{
    SifInitRpc(0);
    while (!SifIopReset(NULL, 0)) { } // Comment this line if you want to "debug" through ps2link
    while (!SifIopSync()) { }
}

static void PrepareIOP()
{
    ResetIOP();
    SifInitRpc(0);
    sbv_patch_enable_lmb();
    sbv_patch_disable_prefix_check();
}

static void InitPS2Drivers()
{
    init_only_boot_ps2_filesystem_driver();
    init_memcard_driver(true);
}

static void deInitPS2Drivers()
{
    deinit_memcard_driver(true);
    deinit_only_boot_ps2_filesystem_driver();
}

int main(int argc, char **argv)
{
    PrepareIOP();
    InitPS2Drivers();

    // ReadSaveFile("sa2.sav");

    // Prevent the multiplayer screen from being drawn ( see core.c:EngineInit() )
    REG_RCNT = 0x8000;
    REG_KEYINPUT = 0x3FF;

    AudioInit();
    VideoInit();
    ControllerInit();

    cgb_audio_init(48000);

    VideoUpdateTexture();

    // Allow the game loop to take control
    AgbMain();

    return 0;
}

// GBA callbacks
void VBlankIntrWait(void)
{
#define HANDLE_VBLANK_INTRS()                                                                                                              \
    ({                                                                                                                                     \
        REG_VCOUNT = DISPLAY_HEIGHT + 1;                                                                                                   \
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

    if (isRunning) {
        REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();

        gpsp_draw_frame(gameImage);

        VideoUpdateTexture();
        HANDLE_VBLANK_INTRS();

        if (use_hires) {
            gsKit_hires_sync(gsGlobal);
            gsKit_hires_flip(gsGlobal);
            // TODO: use once released on the SDK
            // gsKit_hires_flip_ext(gsGlobal, GSFLIP_RATE_LIMIT_1);
        } else {
            gsKit_sync_flip(gsGlobal);
            gsKit_queue_exec(gsGlobal);
        }
        gsKit_TexManager_nextFrame(gsGlobal);
        return;
    }

    CloseSaveFile();

    deInitPS2Drivers();
    exit(0);
#undef HANDLE_VBLANK_INTRS
}

void Platform_StoreSaveFile(void) { StoreSaveFile(); }

s16 convertedAudio[4096];

void Platform_QueueAudio(const s16 *data, uint32_t bytesCount)
{
    if (headless) {
        return;
    }
    AudioPlay((uint8_t *)data, bytesCount);
}

u16 Platform_GetKeyInput(void)
{
    static struct {
        u16 gbaBtn;
        u16 sceBtn;
    } binds[] = {
        { A_BUTTON, PAD_CROSS },   { B_BUTTON, PAD_SQUARE }, { L_BUTTON, PAD_L2 },        { R_BUTTON, PAD_R2 },
        { L_BUTTON, PAD_L1 },      { R_BUTTON, PAD_R1 },     { START_BUTTON, PAD_START }, { DPAD_LEFT, PAD_LEFT },
        { DPAD_RIGHT, PAD_RIGHT }, { DPAD_UP, PAD_UP },      { DPAD_DOWN, PAD_DOWN },
    };

    u16 keys = 0;
    u16 btns = ControllerRead();

    for (int i = 0; i < ARRAY_COUNT(binds); ++i)
        if (btns & binds[i].sceBtn)
            keys |= binds[i].gbaBtn;

    return keys;
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

static void CloseSaveFile()
{
    if (sSaveFile != NULL) {
        fclose(sSaveFile);
    }
}
