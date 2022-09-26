#include "global.h"
#include "main.h"
#include "multiplayer_lobby.h"
#include "task.h"
#include "sprite.h"
#include "transition.h"
#include "m4a.h"
#include "constants/songs.h"

struct MultiplayerLobbyScreen {
    u8 filler0[0x100];
    struct UNK_802D4CC_UNK270 unk100;
    u8 unk10C;
    u8 unk10D;
    u16 unk10E;
    u8 unk110;
    u8 unk111;
} /* size 0x114 */;

void sub_8087644(void);
void sub_8087F10(struct Task*);
void sub_8087478(struct MultiplayerLobbyScreen*);

void sub_8087400(void) {
    struct Task* t = TaskCreate(sub_8087644, 0x114, 0x1000, 0, sub_8087F10);
    struct MultiplayerLobbyScreen* lobbyScreen = TaskGetStructPtr(t);

    lobbyScreen->unk10C = 0;
    lobbyScreen->unk10D = 0;
    lobbyScreen->unk10E = 0;
    lobbyScreen->unk110 = 0;
    lobbyScreen->unk111 = 0;
    sub_8087478(lobbyScreen);
    sub_802D4CC(&lobbyScreen->unk100);
    m4aSongNumStart(MUS_VS_4);
}
