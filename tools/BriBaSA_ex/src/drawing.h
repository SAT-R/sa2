#ifndef GUARD_BRISABA_EX_GFX_H
#define GUARD_BRISABA_EX_GFX_H

#include <raylib.h>

void Debug_DrawAllEntityTextures(AppState *state);

void DrawEntInteractable(AppState *state, int x, int y, int kind, char data[5]);
void DrawEntItem(AppState *state, int x, int y, int index);
void DrawEntEnemy(AppState *state, int x, int y, int index, char data[5]);
void DrawEntRing(AppState *state, int x, int y);
void DrawMapSprites(AppState *state, Rectangle recMap);

inline bool DrawButtonColored(Rectangle rec, char *text, int fontSize, Color idleTint, Color hotTint, Color activeTint, Color textTint);
bool DrawAndHandleCloseButton(AppState *state);
void DrawMainHeader(AppState *state, Texture2D txAtlas);
void DrawUI(AppState *state, Texture2D txAtlas);
void DrawMap(AppState *state, Rectangle recMap, Texture2D txMtAtlas, Texture2D txMap);

Rectangle GetEntityOffsetRect(AppState *state, EntityType etype, int x, int y, int kind, char data[5]);

#define UI_HEADER_HEIGHT               18

#define UI_APP_CLOSE_BUTTON_DIM       20

#define UI_COLOR_APP_HEADER           LIGHTGRAY
#define UI_COLOR_BACKGROUND           RAYWHITE
#define UI_COLOR_BACKGROUND_SAVE      DARKBLUE
#define UI_COLOR_BUTTON               GRAY
#define UI_COLOR_BUTTON_HOVER         LIGHTGRAY
#define UI_COLOR_BUTTON_PRESSED       DARKGRAY
#define UI_COLOR_BUTTON_TEXT          WHITE
#define UI_COLOR_BUTTON_OFF           RED
#define UI_COLOR_BUTTON_OFF_HOVER     PINK
#define UI_COLOR_BUTTON_OFF_PRESSED   MAROON
#define UI_COLOR_BUTTON_OFF_TEXT      WHITE
#define UI_COLOR_BUTTON_ON            LIME
#define UI_COLOR_BUTTON_ON_HOVER      GREEN
#define UI_COLOR_BUTTON_ON_PRESSED    DARKGREEN
#define UI_COLOR_BUTTON_ON_TEXT       WHITE
#define UI_COLOR_BUTTON_PREVIEW_BACK  BLUE
#define UI_COLOR_BUTTON_PREVIEW_FRONT MAROON
#define UI_COLOR_BUTTON_SAVE          LIME
#define UI_COLOR_BUTTON_SAVE_HOVER    GREEN
#define UI_COLOR_BUTTON_SAVE_PRESSED  DARKGREEN
#define UI_COLOR_BUTTON_SAVE_TEXT     WHITE
#define UI_COLOR_BUTTON_SAVE_WARN          GOLD
#define UI_COLOR_BUTTON_SAVE_WARN_HOVER    YELLOW
#define UI_COLOR_BUTTON_SAVE_WARN_PRESSED  ORANGE
#define UI_COLOR_BUTTON_SAVE_WARN_TEXT     GRAY
#define UI_COLOR_TEXT                 DARKBLUE
#define UI_COLOR_TRANSLUCENT          CLITERAL(Color){WHITE.r, WHITE.g, WHITE.b, 127}
#define UI_COLOR_WINDOW_BACK          RAYWHITE
#define UI_COLOR_WINDOW_HEADER        LIGHTGRAY

#endif // GUARD_BRISABA_EX_GFX_H
