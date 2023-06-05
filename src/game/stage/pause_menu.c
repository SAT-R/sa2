#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

typedef struct {
    Sprite s;
    u8 filler30[0x30];
    u16 unk60;
    u8 unk62;
    u8 unk63;
    u8 filler64[0xC];
} Struct_PauseMenu; /* size: 0x70 */

typedef struct {
    u32 size;
    AnimId anim;
    u8 variant;
} AnimInfoPauseMenu;

const AnimInfoPauseMenu sAnimInfoPauseMenu[] = {
    { 40, SA2_ANIM_PAUSE_MENU_JP, 0 }, { 40, SA2_ANIM_PAUSE_MENU_EN, 0 },
    { 40, SA2_ANIM_PAUSE_MENU_DE, 0 }, { 40, SA2_ANIM_PAUSE_MENU_FR, 0 },
    { 40, SA2_ANIM_PAUSE_MENU_ES, 0 }, { 40, SA2_ANIM_PAUSE_MENU_IT, 0 },
};

void Task_PauseMenu(void);
void TaskDestructor_PauseMenu(struct Task *);

void CreatePauseMenu(void)
{
    s8 lang = gLoadedSaveGame->language - 1;

    if (lang < LANG_DEFAULT)
        lang = LANG_JAPANESE - 1;

    if (!(gUnknown_03005424 & EXTRA_STATE__DISABLE_PAUSE_MENU)) {
        void *vramTiles = VramMalloc(sAnimInfoPauseMenu[lang].size);

        if (vramTiles != ewram_end) {
            struct Task *t = TaskCreate(Task_PauseMenu, sizeof(Struct_PauseMenu), 0xFFFE,
                                        4, TaskDestructor_PauseMenu);
            Struct_PauseMenu *pm = TaskGetStructPtr(t);
            Sprite *s = &pm->s;

            pm->unk60 = 0;
            pm->unk62 = 0;

            if (gInput & A_BUTTON) {
                pm->unk63 = 2;
            } else {
                pm->unk63 = 1;
            }

            s->graphics.dest = vramTiles;
            s->unk1A = 0x40;
            s->graphics.size = 0;
            s->graphics.anim = sAnimInfoPauseMenu[lang].anim;
            s->variant = sAnimInfoPauseMenu[lang].variant;
            s->unk14 = 0;
            s->unk1C = 0;
            s->unk21 = 0xFF;
            s->unk22 = 0x10;
            s->palId = 0;

            s->x = (DISPLAY_WIDTH / 2);
            s->y = (DISPLAY_HEIGHT / 2);

            s->unk10 = 0;

            sub_8004558(s);
        }
    }
}