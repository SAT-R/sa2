#ifndef GUARD_SPECIAL_STAGE_UI_H
#define GUARD_SPECIAL_STAGE_UI_H

#include "global.h"
#include "sprite.h"
#include "game/special_stage/main.h"

struct SpecialStageUI {
    struct SpecialStage *stage;
    Sprite timeSymbol;
    Sprite timeHundreds;
    Sprite timeTens;
    Sprite timeUnits;
    Sprite ringsHundredsDigit;
    Sprite ringsTensDigit;
    Sprite ringsUnitsDigit;
    Sprite unk154;
    Sprite ringsTargetHundredsDigit;
    Sprite ringsTargetTensDigit;
    Sprite ringsTargetUnitsDigit;
    Sprite multiplier;
    Sprite startText;
    Sprite pauseMenu;
    void *unk2A4;
    s8 unk2A8;
    s8 wasPaused;
    s16 unk2AA;
    u8 pauseMenuPalette1[6];
    u8 pauseMenuPalette2[6];
}; /* size 0x2B8 */

struct SpecialStageResultsScreen {
    struct SpecialStage *stage;
    Sprite unk4;
    Sprite unk34;
    Sprite chaosEmerald[7];
    Sprite unk1B4;
    Sprite unk1E4;
    Sprite unk214;
    Sprite unk244[5];
    Sprite unk334[5];
    Sprite unk424[5];
    s16 animFrame;

    u16 unk516;
    u16 unk518;
    u16 unk51A;
    u16 unk51C;
    u16 unk51E;
}; /* size 0x520 */

struct Task *CreateSpecialStageUI(struct SpecialStage *);
struct Task *CreateSpecialStageResultsScreen(struct SpecialStage *);
void SpecialStageResultsScreenNewEmeraldSequence(struct SpecialStage *);

#endif
