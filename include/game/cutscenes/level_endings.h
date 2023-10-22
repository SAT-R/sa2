#ifndef GUARD_COURSE_CUT_SCENES_LEVEL_ENDINGS_H
#define GUARD_COURSE_CUT_SCENES_LEVEL_ENDINGS_H

#include "global.h"

void CreateCourseResultsCutScene(u8 unlockedCharacter);

void CreateCharacterUnlockCutScene(u8 zone);
void CreateCreamUnlockCutScene(void);
void CreateTailsUnlockCutScene(void);
void CreateKnucklesUnlockCutScene(void);

#define COURSE_END_UNLOCK_CREAM    0
#define COURSE_END_UNLOCK_TAILS    1
#define COURSE_END_UNLOCK_KNUCKLES 2

#endif
