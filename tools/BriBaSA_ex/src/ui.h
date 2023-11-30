#ifndef GUARD_BRIBASA_EX_UI_H
#define GUARD_BRIBASA_EX_UI_H

typedef enum {
    UIID_UNKNOWN = 0,
    UIID_RECTANGLE = 1,
    UIID_BUTTON = 2,
    UIID_MAP_ENTITY = 3,
    // UIID_TEXTURE?
} UiIdentType;


typedef struct {
    // Shared
    UiIdentType type;

    // Local
    Color backTint;
    Color textTint;
    char *text;
    short fontSize;
} UiIdentRectangle;

// TODO: Is it really necessary to store this here?
typedef struct {
    // Shared
    UiIdentType type;

    // Local
    Color idleTint;
    Color hotTint;
    Color activeTint;
    Color textTint;
    char *text;
    short fontSize;
} UiIdentButton;

typedef struct {
    // Shared
    UiIdentType type;

    // Local
    Texture texture;
} UiIdentTexture;

typedef struct {
    // Shared
    UiIdentType type;

    // Local
    unsigned int id;
} UiIdentEntity;

//typedef struct {
    // TBD
    //EntityDataPointer d;
    //EntityType etype;
//} UiIdentEntity;

struct UiIdent;

typedef struct {
    struct UiIdent *elements;
    int count, capacity;
} UiIdentList;

typedef union UiIdent {
    UiIdentType type;

    // TODO: Find some way of occupying less space
    UiIdentRectangle rec;
    UiIdentButton btn;
    UiIdentTexture tx;
    UiIdentEntity ent;
} UiIdent;

typedef struct {
    UiIdent *hot;
    UiIdent *active;
} UiContext;

// TODO: Remove text and call with Rectangle
extern bool UiElement(UiContext *ui, UiIdent *id, int x, int y, int width, int height, char *text);

#endif // GUARD_BRIBASA_EX_UI_H