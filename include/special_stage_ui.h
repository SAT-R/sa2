#ifndef GUARD_SPECIAL_STAGE_UI_H
#define GUARD_SPECIAL_STAGE_UI_H

#include "global.h"
#include "sprite.h"
#include "special_stage.h"

struct SpecialStageUI {
    struct SpecialStage *stage;
    struct UNK_0808B3FC_UNK240 timeSymbol;
    struct UNK_0808B3FC_UNK240 timeHundreds;
    struct UNK_0808B3FC_UNK240 timeTens;
    struct UNK_0808B3FC_UNK240 timeUnits;
    struct UNK_0808B3FC_UNK240 ringsHundredsDigit;
    struct UNK_0808B3FC_UNK240 ringsTensDigit;
    struct UNK_0808B3FC_UNK240 ringsUnitsDigit;
    struct UNK_0808B3FC_UNK240 unk154;
    struct UNK_0808B3FC_UNK240 ringsTargetHundredsDigit;
    struct UNK_0808B3FC_UNK240 ringsTargetTensDigit;
    struct UNK_0808B3FC_UNK240 ringsTargetUnitsDigit;
    struct UNK_0808B3FC_UNK240 multiplier;
    struct UNK_0808B3FC_UNK240 unk244;
    struct UNK_0808B3FC_UNK240 pauseMenu;
    void *unk2A4;
    s8 unk2A8;
    s8 wasPaused;
    s16 unk2AA;
    u8 pauseMenuPalette1[6];
    u8 pauseMenuPalette2[6];
}; /* size 0x2B8 */

struct SpecialStageResultsScreen {
    struct SpecialStage *stage;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 chaosEmerald[7];
    struct UNK_0808B3FC_UNK240 unk1B4;
    struct UNK_0808B3FC_UNK240 unk1E4;
    struct UNK_0808B3FC_UNK240 unk214;
    struct UNK_0808B3FC_UNK240 unk244[5];
    struct UNK_0808B3FC_UNK240 unk334[5];
    struct UNK_0808B3FC_UNK240 unk424[5];
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
