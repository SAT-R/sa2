#ifndef GUARD_C_HEADER_PARSER_PARSER_H
#define GUARD_C_HEADER_PARSER_PARSER_H

#include "../arena_alloc/arena_alloc.h"

typedef struct {
    char *text;
    int size;
    int type;
    int line;
    int offset;
} Token;

typedef struct {
    Token *tokens;
    int count;
} TokenList;

enum TokenTypes {
    // Single Char Tokens
    /* 0x00 */ UNKNOWN       = 0,
    /* 0x28 */ L_PAREN       = '(',
    /* 0x29 */ R_PAREN       = ')',
    /* 0x2A */ TIMES         = '*',
    /* 0x2B */ PLUS          = '+',
    /* 0x2C */ COMMA         = ',',
    /* 0x2D */ MINUS         = '-',
    /* 0x2E */ PERIOD        = '.',
    /* 0x2F */ DIV           = '/',
    /* 0x3A */ COLON         = ':',
    /* 0x3B */ SEMICOLON     = ';',
    /* 0x3D */ EQUALS        = '=',
    /* 0x5B */ L_SQ_PAREN    = '[',
    /* 0x5D */ R_SQ_PAREN    = ']',
    /* 0x7B */ L_CURLY_PAREN = '{',
    /* 0x7D */ R_CURLY_PAREN = '}',
    /* 0x7E */ TILDE         = '~',


    // Multichar Tokens
    COMMENT       = 0x80,
    IDENTIFIER    = 0x81,
    VALUE         = 0x82,
    POUND_DEFINE  = 0x83,
    POUND_IFNDEF  = 0x84,
    POUND_IFDEF   = 0x85,
    POUND_ENDIF   = 0x86,
    POUND_INCLUDE = 0x87,
    POUND_IF      = 0x88,
    POUND_ELSE    = 0x89,
};

TokenList tokenize(MemArena *arena, char *headerPath);
TokenList parse(MemArena *arena, char *headerPath);

#endif // GUARD_C_HEADER_PARSER_PARSER_H