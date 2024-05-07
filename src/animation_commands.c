#include "global.h"
#include "lib/m4a.h"

#include "flags.h"
#include "sprite.h"
#include "data/sprite_data.h"

#include "animation_commands.h"

extern AnimCmdResult animCmd_GetTiles(void *cursor, Sprite *s);
static AnimCmdResult animCmd_GetPalette(void *cursor, Sprite *s);
static AnimCmdResult animCmd_JumpBack(void *cursor, Sprite *s);
static AnimCmdResult animCmd_End(void *cursor, Sprite *s);
static AnimCmdResult animCmd_PlaySoundEffect(void *cursor, Sprite *s);
extern AnimCmdResult animCmd_AddHitbox(void *cursor, Sprite *s);
static AnimCmdResult animCmd_TranslateSprite(void *cursor, Sprite *s);
static AnimCmdResult animCmd_8(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetIdAndVariant(void *cursor, Sprite *s);
extern AnimCmdResult animCmd_10(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetSpritePriority(void *cursor, Sprite *s);
static AnimCmdResult animCmd_SetOamOrder(void *cursor, Sprite *s);

// make static
const AnimationCommandFunc animCmdTable[] = {
    // 0x080984AC
    animCmd_GetTiles,          animCmd_GetPalette,
    animCmd_JumpBack,          animCmd_End,
    animCmd_PlaySoundEffect,   animCmd_AddHitbox,
    animCmd_TranslateSprite,   animCmd_8,
    animCmd_SetIdAndVariant,   animCmd_10,
    animCmd_SetSpritePriority, animCmd_SetOamOrder,
};

#define ReadInstruction(script, cursor) ((void *)(script) + (cursor * sizeof(s32)))

// (-2)
AnimCmdResult animCmd_GetPalette(void *cursor, Sprite *s)
{
    ACmd_GetPalette *cmd = (ACmd_GetPalette *)cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    if (!(s->unk10 & SPRITE_FLAG_MASK_18)) {
        s32 paletteIndex = cmd->palId;

        DmaCopy32(3, &gUnknown_03002794->palettes[paletteIndex * 16],
                  &gObjPalette[s->palId * 16 + cmd->insertOffset], cmd->numColors * 2);

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    return ACMD_RESULT__RUNNING;
}

// (-3)
AnimCmdResult animCmd_JumpBack(void *cursor, Sprite *s)
{
    ACmd_JumpBack *cmd = cursor;
    s->animCursor -= cmd->offset;

    return ACMD_RESULT__RUNNING;
}

// (-4)
AnimCmdResult animCmd_End(void *cursor, Sprite *s)
{
    SPRITE_FLAG_SET(s, ANIM_OVER);

    return ACMD_RESULT__ENDED;
}

// (-5)
AnimCmdResult animCmd_PlaySoundEffect(void *cursor, Sprite *s)
{
    ACmd_PlaySoundEffect *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    m4aSongNumStart(cmd->songId);

    return ACMD_RESULT__RUNNING;
}

// (-7)
AnimCmdResult animCmd_TranslateSprite(void *cursor, Sprite *s)
{
    ACmd_TranslateSprite *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->x += cmd->x;
    s->y += cmd->y;

    return ACMD_RESULT__RUNNING;
}

// (-8)
AnimCmdResult animCmd_8(void *cursor, Sprite *s)
{
    ACmd_8 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    return ACMD_RESULT__RUNNING;
}

// (-9)
AnimCmdResult animCmd_SetIdAndVariant(void *cursor, Sprite *s)
{
    ACmd_SetIdAndVariant *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    s->graphics.anim = cmd->animId;
    s->prevVariant = -1;
    s->variant = cmd->variant;

    return ACMD_RESULT__ANIM_CHANGED;
}

// (-10)
AnimCmdResult animCmd_10(void *cursor, Sprite *s)
{
    ACmd_10 *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

#ifdef UB_FIX
    return ACMD_RESULT__RUNNING; // I think this should be the correct behavior?
#else
    return (s32)cursor;
#endif
}

// (-11)
// Sets the priority the sprite has in OAM (0 - 3)
AnimCmdResult animCmd_SetSpritePriority(void *cursor, Sprite *s)
{
    ACmd_SetSpritePriority *cmd = cursor;
    s->animCursor += AnimCommandSizeInWords(*cmd);

    SPRITE_FLAG_CLEAR(s, PRIORITY);
    SPRITE_FLAG_SET_VALUE(s, PRIORITY, cmd->priority);

    return ACMD_RESULT__RUNNING;
}

// (-12)
// Sets the index 's' is expected to be put at in OAM
// compared to sprites with a lower/higher value (0 - 31)
AnimCmdResult animCmd_SetOamOrder(void *cursor, Sprite *s)
{
    ACmd_SetOamOrder *cmd = cursor;

    s->animCursor += AnimCommandSizeInWords(*cmd);
    s->unk1A = SPRITE_OAM_ORDER(cmd->orderIndex);

    return ACMD_RESULT__RUNNING;
}