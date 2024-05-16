#include <windows.h>

extern void GameInit(void);
extern void GameStart(void);
extern void GameLoop(void);

DWORD WINAPI StartGameThread(void *pThreadParam) { GameLoop(); }

int WINAPI WinMain(HINSTANCE instance, HINSTANCE prevInstance, LPSTR lpCmdLine,
                   int nShowCmd)
{
    GameInit();
    GameStart();

    DWORD threadId;
    HANDLE GameLoopThreadHandle
        = CreateThread(NULL, 0, StartGameThread, NULL, 0, &threadId);

    WaitForSingleObject(GameLoopThreadHandle, INFINITE);
}
