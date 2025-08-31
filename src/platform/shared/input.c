#ifdef _WIN32
#include <stdlib.h>
#include <stdio.h>
#include <windows.h>
#include <xinput.h>
#include "gba/io_reg.h"
#include "gba/types.h"
#include "platform/shared/input.h"

#define STICK_THRESHOLD 0.5f
SharedKeys GetXInputKeys()
{
    XINPUT_STATE state;
    ZeroMemory(&state, sizeof(XINPUT_STATE));

    DWORD dwResult = XInputGetState(0, &state);
    SharedKeys keys = 0;

    if (dwResult == ERROR_SUCCESS) {
        /* A */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_A) >> 12;
        /* B */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_X) >> 13;
        /* Start */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_START) >> 1;
        /* Select */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_BACK) >> 3;
        /* L */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_LEFT_SHOULDER) << 1;
        /* R */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER) >> 1;
        /* Up */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_UP) << 6;
        /* Down */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_DOWN) << 6;
        /* Left */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_LEFT) << 3;
        /* Right */ keys |= (state.Gamepad.wButtons & XINPUT_GAMEPAD_DPAD_RIGHT) << 1;

        /* Control Stick */
        float xAxis = (float)state.Gamepad.sThumbLX / (float)SHRT_MAX;
        float yAxis = (float)state.Gamepad.sThumbLY / (float)SHRT_MAX;

        if (xAxis < -STICK_THRESHOLD)
            keys |= DPAD_LEFT;
        else if (xAxis > STICK_THRESHOLD)
            keys |= DPAD_RIGHT;
        if (yAxis < -STICK_THRESHOLD)
            keys |= DPAD_DOWN;
        else if (yAxis > STICK_THRESHOLD)
            keys |= DPAD_UP;
    }

    if (state.Gamepad.bRightTrigger > 170) {
        keys |= KEY_SPEEDUP;
    }

    return keys;
}
#endif // _WIN32
