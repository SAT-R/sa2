#ifndef GUARD_BRIBASA_EX_UI_H
#define GUARD_BRIBASA_EX_UI_H

typedef enum {
    UIID_UNKNOWN = 0,
    UIID_RECTANGLE = 1,
    UIID_BUTTON = 2,
    // UIID_TEXTURE?
} UiIdentType;


typedef struct {
    Color backTint;
    Color textTint;
    char *text;
    short fontSize;
} UiIdentRectangle;

// TODO: Is it really necessary to store this here?
typedef struct {
    Color idleTint;
    Color hotTint;
    Color activeTint;
    Color textTint;
    char *text;
    short fontSize;
} UiIdentButton;

typedef struct {
    Texture texture;
} UiIdentTexture;

struct UiIdent;

typedef struct {
    struct UiIdent *elements;
    int count, capacity;
} UiIdentList;

typedef struct UiIdent {
    UiIdentType type;

    union {
        UiIdentRectangle rec;
        UiIdentButton btn;
        UiIdentTexture tx;
    } ident;
} UiIdent;

typedef struct {
    UiIdent *hot;
    UiIdent *active;
} UiContext;

// TODO: Remove text and call with Rectangle
extern bool UiElement(UiContext *ui, UiIdent *id, int x, int y, int width, int height, char *text);

#endif // GUARD_BRIBASA_EX_UI_H