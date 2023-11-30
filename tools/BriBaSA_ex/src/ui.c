#include <raylib.h>

#include "global.h"
#include "ui.h"

// Design inspired by Casey Muratori's presentation:
// "Immediate-Mode Graphical User Interfaces - 2005"
// https://www.youtube.com/watch?v=Z1qyvQsjK5Y

static void
DrawButton(UiContext *ui, UiIdent *id, int fontSize, int x, int y, int width, int height, char *text)
{
    Rectangle rec = {x, y, width, height};

    BeginScissorMode(x, y, width, height);
        if(ui->hot == id) {
            SetMouseCursor(MOUSE_CURSOR_POINTING_HAND);

            if(ui->active == id) {
                DrawRectangleRec(rec, id->ident.btn.activeTint);
            } else {
                DrawRectangleRec(rec, id->ident.btn.hotTint);
            }
        } else {
            if(ui->active == id) {
                DrawRectangleRec(rec, id->ident.btn.activeTint);
            } else {
                DrawRectangleRec(rec, id->ident.btn.idleTint);
            }
        }

        DrawText(text, rec.x + 1, rec.y + 1, fontSize, id->ident.btn.textTint);
    EndScissorMode();
}

char *GetUiElementText(UiIdent *id)
{
    char *result = NULL;

    if(id) {
        switch(id->type) {
        case UIID_RECTANGLE: {
            result = id->ident.rec.text;
        } break;

        case UIID_BUTTON: {
            result = id->ident.btn.text;
        } break;

        case UIID_MAP_ENTITY: {
            ;
        } break;
        }
    }

    return result;
}

bool UiElement(UiContext *ui, UiIdent *id, int x, int y, int width, int height, char *text)
{
    bool clicked = false;

    if(ui->active == id) {
        if(IS_USER_KEY_RELEASED_LEFT) {
            if(ui->hot == id) {
                clicked = true;
            }

            ui->active = NULL;
        }
    } else if(ui->hot == id) {
        // TODO: This shouldn't be whether it _is_ down,
        //       but whether it was just pressed.
        // 
        //       Until then, clicking somewhere else, holding down
        //       and entering the button will trigger the "active" state,
        //       which is not wanted behavior.
        if(IS_USER_KEY_DOWN_LEFT) {
            ui->active = id;
        }
    }

    Rectangle recElem = {x, y, width, height};
    if(IS_MOUSE_ON_RECT(recElem)) {
        if(!ui->active) {
            ui->hot = id;
        }
    } else if(ui->hot == id) {
        ui->hot = NULL;
    }

    switch(id->type) {
    case UIID_RECTANGLE: {
        if(ui->hot == id) {
            SetMouseCursor(MOUSE_CURSOR_DEFAULT);
        }

        char *txtRectangle = id->ident.rec.text;
        short fontSize = id->ident.rec.fontSize;
        Color textTint = id->ident.rec.textTint;
        fontSize = (fontSize <= 0) ? height : fontSize;

        DrawRectangle(x, y, width, height, id->ident.rec.backTint);

        if(txtRectangle) {
            DrawText((const char*)txtRectangle, x+2, y+2, fontSize, textTint);
        }
    } break;

    case UIID_BUTTON: {
        char *txtButton  = id->ident.btn.text;
        short fontSize = id->ident.btn.fontSize;
        fontSize = (fontSize <= 0) ? height : fontSize;

        if(!text && txtButton) {
            text = txtButton;
        }

        DrawButton(ui, id, fontSize, x, y, width, height, text);
    } break;

    case UIID_MAP_ENTITY: {

    } break;
    }

    return clicked;
}