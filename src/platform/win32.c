#include <windows.h>
#include <stdio.h>

#include "global.h"
#include "gba/io_reg.h"

extern void GameInit(void);
extern void GameStart(void);
extern void GameLoop(void);

DWORD WINAPI StartGameThread(void *pThreadParam) { GameLoop(); }

int WINAPI WinMain(HINSTANCE instance, HINSTANCE prevInstance, LPSTR lpCmdLine,
                   int nShowCmd)
{
    // Allocate a console.
    // This is necessary for using print functions when using an application with the
    // WinMain() entry point.
    AllocConsole();
    AttachConsole(GetCurrentProcessId());
    freopen("CON", "w", stdout);

    // If this isn't set, gFlags gets set to FLAGS_200, leading to the MP menu being
    // loaded instead of the main loop
    REG_RCNT = 0x8000;
    GameInit();
    GameStart();

    DWORD threadId;
    HANDLE GameLoopThreadHandle
        = CreateThread(NULL, 0, StartGameThread, NULL, 0, &threadId);

    WaitForSingleObject(GameLoopThreadHandle, INFINITE);
}
