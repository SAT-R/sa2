#ifndef GUARD_SPECIAL_STAGE_UI_H
#define GUARD_SPECIAL_STAGE_UI_H

#include "global.h"
#include "sprite.h"
#include "special_stage.h"

struct UNK_8070B90 {
    struct SpecialStage* stage;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 unk64;
    struct UNK_0808B3FC_UNK240 unk94;
    struct UNK_0808B3FC_UNK240 ringsHundredsDigit;
    struct UNK_0808B3FC_UNK240 ringsTensDigit;
    struct UNK_0808B3FC_UNK240 ringsUnitsDigit;
    struct UNK_0808B3FC_UNK240 unk154;
    struct UNK_0808B3FC_UNK240 ringsTargetHundredsDigit;
    struct UNK_0808B3FC_UNK240 ringsTargetTensDigit;
    struct UNK_0808B3FC_UNK240 ringsTargetUnitsDigit;
    struct UNK_0808B3FC_UNK240 unk214;
    struct UNK_0808B3FC_UNK240 unk244;
    struct UNK_0808B3FC_UNK240 unk274;
    void* unk2A4;
    s8 unk2A8;
    s8 unk2A9;
    s16 unk2AA;
    u8 unk2AC[6];
    u8 unk2B2[6];
}; /* size 0x2B8 */

struct UNK_8070BF0 {
    struct SpecialStage* stage;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 chaosEmerald[7];
    struct UNK_0808B3FC_UNK240 unk1B4;
    struct UNK_0808B3FC_UNK240 unk1E4;
    struct UNK_0808B3FC_UNK240 unk214;
    struct UNK_0808B3FC_UNK240 unk244[5];
    struct UNK_0808B3FC_UNK240 unk334[5];
    struct UNK_0808B3FC_UNK240 unk424[5];
    s16 unk514;

    u16 unk516;
    u16 unk518;
    u16 unk51A;
    u16 unk51C;
    u16 unk51E;
}; /* size 0x520 */

struct Task* sub_8070B90(struct SpecialStage*);
struct Task* sub_8070BF0(struct SpecialStage*);
void sub_8070C30(struct SpecialStage*);

#endif
