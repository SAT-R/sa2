#include <stdio.h>
#include <stdlib.h>

#include <kernel.h>
#include <sifrpc.h>
#include <iopcontrol.h>
#include <sbv_patches.h>
#include <ps2_filesystem_driver.h>
#include <ps2_audio_driver.h>

#include <gsKit.h>
#include "audsrv.h"

#include "global.h"
#include "core.h"
#include "multi_sio.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "gba/types.h"
#include "lib/agb_flash/flash_internal.h"
#include "platform/shared/dma.h"

static GSGLOBAL *gsGlobal;
static GSTEXTURE screen;

#include "platform/shared/audio/cgb_audio.h"

#ifndef TILE_WIDTH
#define TILE_WIDTH 8
#endif

extern IntrFunc gIntrTable[16];

ALIGNED(256) uint16_t gameImage[DISPLAY_WIDTH * DISPLAY_HEIGHT];

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

static int vsync_sema_1st_id;
static int vsync_sema_2nd_id;
static int vsync_sema_id = -1;
static int vsync_id = -1;

static const struct VidMode *vid_mode;
static bool use_hires = false;

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
void DoSoftReset(void) {};

void VDraw(void);
void UpdateTexture(void);

static void ReadSaveFile(char *path);
static void StoreSaveFile(void);
static void CloseSaveFile(void);

u16 Platform_GetKeyInput(void);

#define SAMPLES_HIGH 544
#define SAMPLES_LOW  528

static bool audio_ps2_init(void)
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

static int audio_ps2_buffered(void) { return audsrv_queued() / 4; }

static void audio_ps2_play(const uint8_t *buf, size_t len)
{
    if (audio_ps2_buffered() < 6000) {
        audsrv_play_audio(buf, len);
    }
}

void reset_IOP()
{
    SifInitRpc(0);
    while (!SifIopReset(NULL, 0)) { } // Comment this line if you want to "debug" through ps2link
    while (!SifIopSync()) { }
}

static void prepare_IOP()
{
    reset_IOP();
    SifInitRpc(0);
    sbv_patch_enable_lmb();
    sbv_patch_disable_prefix_check();
}

static void init_drivers()
{
    init_only_boot_ps2_filesystem_driver();
    init_memcard_driver(true);
}

static void deinit_drivers()
{
    deinit_memcard_driver(true);
    deinit_only_boot_ps2_filesystem_driver();
}

void platform_video_init(void)
{
    if (vid_mode == NULL) {
        vid_mode = &vid_modes[3]; // Standard def 480p
    } else {
        if (use_hires) {
            gsKit_hires_deinit_global(gsGlobal);
        } else {
            gsKit_deinit_global(gsGlobal);
            if (vsync_id != -1) {
                gsKit_remove_vsync_handler(vsync_id);
            }
            vsync_sema_id = -1;
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

int main(int argc, char **argv)
{
    prepare_IOP();
    init_drivers();

    // ReadSaveFile("sa2.sav");

    // Prevent the multiplayer screen from being drawn ( see core.c:EngineInit() )
    REG_RCNT = 0x8000;
    REG_KEYINPUT = 0x3FF;

    audio_ps2_init();
    platform_video_init();
    // controller init

    cgb_audio_init(48000);

    VDraw();
    // while (true) {
    //     UpdateTexture();
    //     gsKit_sync_flip(gsGlobal);
    //     gsKit_queue_exec(gsGlobal);
    // }
    AgbMain();

    return 0;
}

bool newFrameRequested = FALSE;
int skipFrame = 0;

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

    bool frameAvailable = TRUE;
    bool frameDrawn = false;
    static int frames_skipped = 0;
    if (isRunning) {
        REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();

        // Only render 30fps when in widescreen as the draw func is too slow for the ps2
        // #if DISPLAY_WIDTH > 240
        //         skipFrame++;
        //         skipFrame %= 2;
        // #endif
        if (skipFrame == 0) {
            VDraw();
        } else {
            UpdateTexture();
        }
        HANDLE_VBLANK_INTRS();
        if (skipFrame != 0) {
            return;
        }

        if (use_hires) {
            gsKit_hires_flip_ext(gsGlobal, GSFLIP_RATE_LIMIT_1);
        } else {
            gsKit_sync_flip(gsGlobal);
            gsKit_queue_exec(gsGlobal);
        }
        gsKit_TexManager_nextFrame(gsGlobal);
        return;
    }
    // #define MAX_FRAME_SKIP 2

    // while (isRunning) {
    //     if (!paused || stepOneFrame) {
    //         double dt = fixedTimestep / timeScale; // TODO: Fix speedup

    //         // don't accumulate time if we already requested a new frame
    //         // this frame cycle (emulates threaded sdl behavior)
    //         if (!newFrameRequested) {
    //             double deltaTime = 0;

    //             // TODO: fix
    //             curGameTime += dt;
    //             if (stepOneFrame) {
    //                 deltaTime = dt;
    //             } else {
    //                 // TODO: divide by expected frequency
    //                 deltaTime = (double)((curGameTime - lastGameTime) / 1);
    //                 if (deltaTime > (dt * 5))
    //                     deltaTime = dt * 5;
    //             }
    //             lastGameTime = curGameTime;

    //             accumulator += deltaTime;
    //         } else {
    //             newFrameRequested = FALSE;
    //         }

    //         while (accumulator >= dt) {
    //             REG_KEYINPUT = KEYS_MASK ^ Platform_GetKeyInput();
    //             if (frameAvailable) {
    //                 // frame skip: let game logic catch up when behind
    //                 if (accumulator >= dt * 2.0 && frames_skipped < MAX_FRAME_SKIP) {
    //                     frames_skipped++;
    //                     frameAvailable = FALSE;
    //                     HANDLE_VBLANK_INTRS();
    //                     accumulator -= dt;
    //                     newFrameRequested = TRUE;
    //                     return;
    //                 }
    //                 frames_skipped = 0;
    //                 VDraw();
    //                 frameAvailable = FALSE;
    //                 frameDrawn = true;

    //                 HANDLE_VBLANK_INTRS();

    //                 accumulator -= dt;
    //             } else {
    //                 newFrameRequested = TRUE;
    //                 return;
    //             }
    //         }

    //         if (paused && stepOneFrame) {
    //             stepOneFrame = false;
    //         }
    //     }

    //     if (use_hires) {
    //         gsKit_hires_flip_ext(gsGlobal, GSFLIP_RATE_LIMIT_1);
    //     } else {
    //         // gsKit_flip(gs_global);
    //         gsKit_sync_flip(gsGlobal);
    //         gsKit_queue_exec(gsGlobal);
    //     }
    //     gsKit_TexManager_nextFrame(gsGlobal);
    // }

    CloseSaveFile();

    deinit_drivers();
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

s16 converted_audio[4096];

void float_audio_to_s16(const float *input, int16_t *output, size_t length)
{
    if (!input || !output)
        return;

    for (size_t i = 0; i < length; i++) {
        float sample = input[i];

        if (sample > 1.0f)
            sample = 1.0f;
        else if (sample < -1.0f)
            sample = -1.0f;

        output[i] = (int16_t)(sample * 32767.0f + (sample >= 0 ? 0.5f : -0.5f));
    }
}

void Platform_QueueAudio(const float *data, uint32_t bytesCount)
{
    float_audio_to_s16(data, converted_audio, bytesCount / sizeof(float));
    audio_ps2_play((void *)converted_audio, bytesCount / sizeof(float) * sizeof(u16));
}

// TODO: handle input
u16 Platform_GetKeyInput(void) { return 0; }

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

void VDraw(void)
{
    extern void DrawFrame_Fast(uint16_t * pixels);
    DrawFrame_Fast(gameImage);
    UpdateTexture();
    REG_VCOUNT = DISPLAY_HEIGHT + 1; // prep for being in VBlank period
}

void UpdateTexture(void)
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
