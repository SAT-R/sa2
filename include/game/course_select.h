#ifndef GUARD_COURSE_SELECT_H
#define GUARD_COURSE_SELECT_H

#include "global.h"

// CreateCourseSelectionScreen
void CreateCourseSelectionScreen(u8 currentLevel, u8 maxLevel, u8 cutScenes);

#define COURSE_SELECT_CUT_SCENE_NONE  0
#define CUT_SCENE_UNLOCK_NEXT_COURSE  1
#define CUT_SCENE_UNLOCK_TRUE_AREA_53 2

#endif
