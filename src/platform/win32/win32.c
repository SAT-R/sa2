#include <windows.h>
#include <stdio.h>

#include "global.h"
#include "core.h"
#include "gba/io_reg.h"

#if (RENDERER == RENDERER_OPENGL)
#include <GL/gl.h>
#include "platform/shared/opengl.h"
#endif

#include "platform/shared/input.h"

extern void GameInit(void);

DWORD WINAPI GameThread(void *pThreadParam);
LRESULT CALLBACK Win32_WindowCallback(HWND window, UINT message, WPARAM wParam, LPARAM lParam);
static void Win32_ProcessPendingMessages(HWND window);
static RECT Win32_GetWindowDimension(HWND Window);

#if (RENDERER == RENDERER_OPENGL)
static void Win32_InitOpenGL(HWND window);
#endif

static u16 ALIGNED(8) sImageBuffer[DISPLAY_WIDTH * DISPLAY_HEIGHT] = {
    RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN,
    RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN,
};
static BITMAPINFO sBMInfo = { 0 };
static bool32 sRunning = TRUE;
static HWND sWindowHandle = 0;
static HDC sDeviceContext = 0;
static u16 sInputKeys = 0;

#define ENABLE_RESIZE TRUE

enum { DMA_NOW, DMA_VBLANK, DMA_HBLANK, DMA_SPECIAL };

typedef union {
    struct {
        u16 unused : 5;
        u16 dstCtrl : 2;
        u16 srcCtrl : 2;
        u16 repeat : 1;
        u16 is32bit : 1;
        u16 pakDRQ : 1;
        u16 startTiming : 2;
        u16 irqAtEnd : 1;
        u16 enable : 1;
    } split;

    u16 raw;
} DMACtrl;

int WINAPI WinMain(HINSTANCE instance, HINSTANCE prevInstance, LPSTR lpCmdLine, int nShowCmd)
{
    // Allocate a console.
    // This is necessary for using print functions when using an application with the
    // WinMain() entry point.
#if 1
    AllocConsole();
    AttachConsole(GetCurrentProcessId());
    freopen("CON", "w", stdout);
    printf("Console initialized.\n");
#endif

    /* Initialize the window */
    WNDCLASS WindowClass = {};
    WindowClass.style = CS_HREDRAW | CS_VREDRAW;
    WindowClass.lpfnWndProc = Win32_WindowCallback;
    WindowClass.hInstance = instance;
    WindowClass.lpszClassName = "MainGameWindowClass";

    if (RegisterClass(&WindowClass)) {
        RECT WantedCliRect = { 0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT };
#if ENABLE_RESIZE
        DWORD WantedWindowStyle = WS_OVERLAPPEDWINDOW | WS_VISIBLE;
#else
        // WS_THICKFRAME disables resizing the window
        DWORD WantedWindowStyle = (WS_OVERLAPPEDWINDOW ^ WS_THICKFRAME) | WS_VISIBLE;
#endif // ENABLE_RESIZE

        // NOTE: The sizes passed to CreateWindow are not the ones to the client area RECT.
        //       A call to AdjustWindowRect() fixes that.
        AdjustWindowRect(&WantedCliRect, WantedWindowStyle, FALSE);

        sWindowHandle
            = CreateWindow(WindowClass.lpszClassName, "", WantedWindowStyle, CW_USEDEFAULT, CW_USEDEFAULT, // x, y
                           (WantedCliRect.right - WantedCliRect.left), (WantedCliRect.bottom - WantedCliRect.top), 0, 0, instance, 0);

        if (sWindowHandle) {
            sDeviceContext = GetDC(sWindowHandle);

#if (RENDERER == RENDERER_OPENGL)
            Win32_InitOpenGL(sWindowHandle);
#endif

            sBMInfo.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
            sBMInfo.bmiHeader.biWidth = DISPLAY_WIDTH;
            sBMInfo.bmiHeader.biHeight = -DISPLAY_HEIGHT; // negative biHeight: bottom->down image
            sBMInfo.bmiHeader.biPlanes = 1;
            sBMInfo.bmiHeader.biBitCount = 16;
            sBMInfo.bmiHeader.biCompression = BI_RGB;
            sBMInfo.bmiHeader.biSizeImage = 0; // 0 for uncompressed
            sBMInfo.bmiHeader.biXPelsPerMeter = 0;
            sBMInfo.bmiHeader.biYPelsPerMeter = 0;
            sBMInfo.bmiHeader.biClrUsed = 0;
            sBMInfo.bmiHeader.biClrImportant = 0;

            timeBeginPeriod(1);

            Win32_ProcessPendingMessages(sWindowHandle);

            // If this isn't set, gFlags gets set to FLAGS_200, leading to the MP menu being
            // loaded instead of the main loop
            REG_RCNT = 0x8000;
            REG_KEYINPUT = 0x3FF;

            EngineInit();
            GameInit();

            DWORD threadId;

#if 01
            REG_KEYINPUT &= ~START_BUTTON;
            while (sRunning) {
                memset(sImageBuffer, 0, sizeof(sImageBuffer));

                gFlags |= FLAGS_4000;
                EngineMainLoop();
                //    REG_KEYINPUT ^= (A_BUTTON | START_BUTTON);

                // NOTE: This is an OR because sInputKeys can get set
                //       through keyboard events.
                sInputKeys |= GetXInputKeys();

                REG_KEYINPUT = ~sInputKeys;
            }
#else
            HANDLE GameThreadHandle = CreateThread(NULL, 0, GameThread, NULL, 0, &threadId);
            WaitForSingleObject(GameThreadHandle, INFINITE);
#endif

            ReleaseDC(sWindowHandle, sDeviceContext);
        }
    }
}

DWORD WINAPI GameThread(void *pThreadParam)
{
    REG_KEYINPUT &= ~START_BUTTON;
    // while (sRunning)
    {
        gFlags |= FLAGS_4000;
        EngineMainLoop();
        REG_KEYINPUT ^= (A_BUTTON | START_BUTTON);
        REG_KEYINPUT |= (DPAD_RIGHT);
    }
}

#if (RENDERER == RENDERER_OPENGL)
// From "Handmade Hero 235 - Initializing OpenGL on Windows"
// https://www.youtube.com/watch?v=5Klc9RZPG7M
static void Win32_InitOpenGL(HWND window)
{
    HDC deviceContext = GetDC(window);

    PIXELFORMATDESCRIPTOR desiredPixelFormat = {};
    PIXELFORMATDESCRIPTOR suggestedPixelFormat;

    // TODO: Find out if double-buffering is necessary for us!
    desiredPixelFormat.nSize = sizeof(PIXELFORMATDESCRIPTOR);
    desiredPixelFormat.nVersion = 1;
    desiredPixelFormat.dwFlags = (PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER);
    desiredPixelFormat.cColorBits = 24;
    desiredPixelFormat.cAlphaBits = 8;
    desiredPixelFormat.iLayerType = PFD_MAIN_PLANE;

    int suggestedPixelFormatIndex = ChoosePixelFormat(deviceContext, &desiredPixelFormat);
    DescribePixelFormat(deviceContext, suggestedPixelFormatIndex, sizeof(PIXELFORMATDESCRIPTOR), &suggestedPixelFormat);
    SetPixelFormat(deviceContext, suggestedPixelFormatIndex, &suggestedPixelFormat);

    // RC = "Rendering Context"
    HGLRC openGLRC = wglCreateContext(deviceContext);

    if (wglMakeCurrent(deviceContext, openGLRC)) {
        OpenGL_OnInit();
    } else {
        // LOG fail
    }

    ReleaseDC(window, deviceContext);
}
#endif

static void Win32_DisplayBufferInWindow(HDC deviceContext, int windowWidth, int windowHeight)
{
#if (RENDERER == RENDERER_OPENGL)
    OpenGL_Render(sImageBuffer, windowWidth, windowHeight);
    SwapBuffers(deviceContext);
#else
    StretchDIBits(deviceContext, 0, 0, windowWidth, windowHeight, 0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, sImageBuffer, &sBMInfo,
                  DIB_RGB_COLORS, SRCCOPY);
#endif
}

LRESULT CALLBACK Win32_WindowCallback(HWND window, UINT message, WPARAM wParam, LPARAM lParam)
{
    LRESULT result = 0;

    switch (message) {
        case WM_ACTIVATEAPP: {
            OutputDebugStringA("WM_ACTIVATEAPP\n");
        } break;

        case WM_CLOSE: {
            sRunning = FALSE;
            OutputDebugStringA("WM_CLOSE\n");
        } break;

        case WM_DESTROY: {
            sRunning = FALSE;
        } break;

        case WM_PAINT: {
            PAINTSTRUCT Paint;
            HDC paintDC = BeginPaint(window, &Paint);
            RECT clientRect;
            GetClientRect(window, &clientRect);

            Win32_DisplayBufferInWindow(paintDC,
                                        clientRect.right - clientRect.left, // width
                                        clientRect.bottom - clientRect.top // height
            );

            EndPaint(window, &Paint);
        } break;

        default: {
            result = DefWindowProcA(window, message, wParam, lParam);
        } break;
    }
    return result;
}

static u16 Win32_KeyboardKeyToGameKey(char key)
{
    switch (key) {
        case 'C': {
            return A_BUTTON;
        } break;

        case 'X': {
            return B_BUTTON;
        } break;

        case VK_RETURN: {
            return START_BUTTON;
        } break;

        case VK_BACK: {
            return SELECT_BUTTON;
        } break;

        case VK_LEFT: {
            return DPAD_LEFT;
        } break;

        case VK_UP: {
            return DPAD_UP;
        } break;

        case VK_RIGHT: {
            return DPAD_RIGHT;
        } break;

        case VK_DOWN: {
            return DPAD_DOWN;
        } break;

        case 'S': {
            return L_BUTTON;
        } break;

        case 'D': {
            return R_BUTTON;
        } break;
    }

    return 0;
}

static void Win32_ProcessPendingMessages(HWND window)
{
    MSG message;
    while (PeekMessage(&message, 0, 0, 0, PM_REMOVE)) {
        switch (message.message) {
            case WM_KEYUP: {
                sInputKeys &= ~Win32_KeyboardKeyToGameKey(message.wParam);
            } break;

            case WM_KEYDOWN: {
                sInputKeys |= Win32_KeyboardKeyToGameKey(message.wParam);
            } break;

            case WM_QUIT: {
                printf("Closing");
                sRunning = FALSE;
            } break;

            default: {
                TranslateMessage(&message);
                DispatchMessage(&message);
            } break;
        }
    }
}

// Converts GBA -> Win32 RGB value
#define RGB_SHIFT(value) (((value >> 10) & 0x1F) | (value & 0x3E0) | (((value & 0x1F) << 10)))

void Platform_DisplaySprite(Sprite *sprite, u8 oamPaletteNum)
{
    if (sprite->graphics.src == NULL)
        return;

#if (RENDERER == RENDERER_OPENGL)
        // TEMP - Currently the display buffer gets drawn in software, but we should load the assets as a textures and let OpenGL render
        // everything
        //  OpenGL_DisplaySprite(sprite, oamPaletteNum);
        //  return;
#endif

    const SpriteOffset *dims = sprite->dimensions;

    bool32 xFlip = SPRITE_FLAG_GET(sprite, X_FLIP);
    bool32 yFlip = SPRITE_FLAG_GET(sprite, Y_FLIP);

    // printf("Sprite: %d\n", sprite->graphics.anim);

    s32 x, y, sprWidth, sprHeight;

    x = sprite->x;
    y = sprite->y;

    {
        // TEMP - from sprite.c
        sprWidth = dims->width;
        sprHeight = dims->height;
        if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_ENABLE) {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE) {
                x -= dims->width / 2;
                y -= dims->height / 2;
                sprWidth *= 2;
                sprHeight *= 2;
            }
        } else {
            if (sprite->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
                y -= sprHeight - dims->offsetY;
            } else {
                y -= dims->offsetY;
            }

            if (sprite->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                x -= sprWidth - dims->offsetX;
            } else {
                x -= dims->offsetX;
            }
        }
    }

    s32 tempX = x;
    s32 tempY = y;

    u16 widthInTiles = dims->width >> 3;

    for (int frameY = 0; frameY < dims->height; frameY++) {
        s32 finalY = (tempY + frameY);

        if (finalY < 0)
            continue;

        if (finalY >= DISPLAY_HEIGHT)
            break;

        for (int frameX = 0; frameX < dims->width; frameX++) {

            s32 finalX = (tempX + frameX);

            if (finalX < 0)
                continue;

            if (finalX >= DISPLAY_WIDTH)
                break;

            int bufferPixelIndex = finalY * DISPLAY_WIDTH + finalX;
            int imagePixelIndex = frameY * dims->width + frameX;

            if (bufferPixelIndex >= 0 && bufferPixelIndex < DISPLAY_WIDTH * DISPLAY_HEIGHT) {
                u16 *pal = &PLTT[oamPaletteNum * 16 + (BG_PLTT_SIZE / 2)];
                u16 tileNumX = (frameX >> 3);
                u16 tileNumY = (frameY >> 3);
                u16 tileNum = tileNumY * widthInTiles + tileNumX;
                u32 offset = tileNum * TILE_SIZE_4BPP;

                u8 *tile = &((u8 *)sprite->graphics.src)[offset];

                u8 colorIndex = ((frameY & 0x7) * 8 + (frameX & 0x7));

                bool8 doShift = (colorIndex & 1);
                u8 colorId = tile[colorIndex >> 1] & (0xF << (doShift * 4));
                colorId >>= doShift * 4;
                if (colorId != 0)
                    sImageBuffer[bufferPixelIndex] = RGB_SHIFT(pal[colorId]);
            }
        }
    }
}

void VBlankIntrWait()
{
    // while (sRunning)
    {
        // NOTE: This wouldn't work here with multiple threads, because PeekMessage()
        //       only gets messages in the thread the specified window was created in.
        Win32_ProcessPendingMessages(sWindowHandle);
        RECT clientRect;
        GetClientRect(sWindowHandle, &clientRect);
        static u8 test = 0;

        sImageBuffer[test++] = RGB_BLACK;
        sImageBuffer[test] = RGB_GREEN;
        Win32_DisplayBufferInWindow(sDeviceContext, clientRect.right - clientRect.left, clientRect.bottom - clientRect.top);

        // TODO: Remove Sleep, use high-resolution timer instead!
        Sleep(10);

#if (RENDERER == RENDERER_OPENGL)
        // TODO: Don't do this here!!!
        // This should be called in src/platform/shared/opengl.c
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
#endif
    }
}

void *Platform_malloc(size_t numBytes) { return HeapAlloc(GetProcessHeap(), HEAP_GENERATE_EXCEPTIONS | HEAP_ZERO_MEMORY, numBytes); }

void Platform_free(void *ptr) { HeapFree(GetProcessHeap(), 0, ptr); }

void Platform_QueueAudio(const float *data, u32 numBytes) { }
