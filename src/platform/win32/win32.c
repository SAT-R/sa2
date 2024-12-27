#include <windows.h>
#include <stdio.h>

#include "global.h"
#include "core.h"

extern void GameInit(void);

DWORD WINAPI GameThread(void *pThreadParam);
LRESULT CALLBACK Win32_WindowCallback(HWND window, UINT message, WPARAM wParam, LPARAM lParam);
static void Win32_ProcessPendingMessages(HWND window);
static RECT Win32_GetWindowDimension(HWND Window);

static u16 ALIGNED(8) sImageBuffer[DISPLAY_WIDTH * DISPLAY_HEIGHT] = {
    RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN,
    RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN, RGB_GREEN,
};
static BITMAPINFO sBMInfo = { 0 };
static bool32 sRunning = TRUE;
static HWND sWindowHandle = 0;
static HDC sDeviceContext = 0;

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
            // while (sRunning)
            {
                gFlags |= 0x4000;
                EngineMainLoop();
                REG_KEYINPUT ^= (A_BUTTON | START_BUTTON);
                REG_KEYINPUT |= (DPAD_RIGHT);
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
        gFlags |= 0x4000;
        EngineMainLoop();
        REG_KEYINPUT ^= (A_BUTTON | START_BUTTON);
        REG_KEYINPUT |= (DPAD_RIGHT);
    }
}

static void Win32_DisplayBufferInWindow(HDC deviceContext, int windowWidth, int windowHeight)
{
    StretchDIBits(deviceContext, 0, 0, windowWidth, windowHeight, 0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, sImageBuffer, &sBMInfo,
                  DIB_RGB_COLORS, SRCCOPY);
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

static void Win32_ProcessPendingMessages(HWND window)
{
    MSG message;
    while (PeekMessage(&message, 0, 0, 0, PM_REMOVE)) {
        switch (message.message) {
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

void VBlankIntrWait()
{
    while (sRunning) {
        // NOTE: This wouldn't work here with multiple threads, because PeekMessage()
        //       only gets messages in the thread the specified window was created in.
        Win32_ProcessPendingMessages(sWindowHandle);
        RECT clientRect;
        GetClientRect(sWindowHandle, &clientRect);
        Win32_DisplayBufferInWindow(sDeviceContext, clientRect.right - clientRect.left, clientRect.bottom - clientRect.top);
        Sleep(16);
        static u8 test = 0;
        sImageBuffer[test++] = RGB_BLACK;
        sImageBuffer[test] = RGB_GREEN;
    }
}

void *Platform_malloc(int numBytes) { return HeapAlloc(GetProcessHeap(), HEAP_GENERATE_EXCEPTIONS | HEAP_ZERO_MEMORY, numBytes); }

void Platform_free(void *ptr) { HeapFree(GetProcessHeap(), 0, ptr); }

void Platform_QueueAudio(const u8 *data, u32 numBytes) { }