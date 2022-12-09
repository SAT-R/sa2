#include "global.h"
#include "sprite.h"

typedef int (*AnimationCommandFunc)(void *variantCursor,
                                    struct UNK_0808B3FC_UNK240 *sprite);

extern int animCmd_GetTileIndex(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_GetPalette(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_JumpBack(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_4(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_PlaySoundEffect(void *variantCursor,
                                   struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_6(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_7(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_8(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_9(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_10(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_11(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);
extern int animCmd_12(void *variantCursor, struct UNK_0808B3FC_UNK240 *sprite);

// make static
const AnimationCommandFunc animCmdTable[] = {
    // 0x080984AC
    animCmd_GetTileIndex,
    animCmd_GetPalette,
    animCmd_JumpBack,
    animCmd_4,
    animCmd_PlaySoundEffect,
    animCmd_6,
    animCmd_7,
    animCmd_8,
    animCmd_9,
    animCmd_10,
    animCmd_11,
    animCmd_12,
};
