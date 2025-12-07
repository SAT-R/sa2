#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "arena_alloc.h"

#include "c_header_parser.h"
#include "types.h"

/* (c) 2023 JaceCear
   This program is used to parse C-Header files.
 * - It is NOT finished and mainly serves to help getting the values of constant #define's.
 * - The program does NOT evaluate any expressions at this point in time. 
 */

#define LINE_OFFSET_START 0
static int sLine       = 1;
static int sLineOffset = LINE_OFFSET_START;

typedef enum {
    DECIMAL = 0,
    HEX     = 1,
    BINARY  = 2,
} NumBases;

static long getFileSize(FILE *f)
{
    long size = 0;
    if(f)
    {
        fseek(f, 0, SEEK_END);
        size = ftell(f);
        fseek(f, 0, SEEK_SET);
    }
    return size;
}

static bool_ get_single_char_token_type(char *text)
{
    return text[0];
}

static bool_ is_single_char_token(char *text)
{
    char *tokens = "()[]{}+-*/.,:;=~";

    return (strchr(tokens, text[0]) != NULL);
}

static inline bool_ is_digit(char c)
{
    return ((c >= '0') && (c <= '9'));
}

static inline bool_ is_hex(char c)
{
    return (is_digit(c) || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f'));
}

static inline bool_ is_binary(char c)
{
    return (c == '0' || c == '1');
}

static inline bool_ is_line_break(char c)
{
    return ((c == '\r') 
        ||  (c == '\n'));
}

static inline bool_ is_whitespace(char c)
{
    return ((c == ' ')
        ||  (c == '\t'));
}

static void eat_multi_line_comment(Token *token, char *string, int stringSize, int *cursor)
{
    while(*cursor < stringSize && string[*cursor] != '\0')
    {
        if(!strncmp(&string[*cursor], "*/", 2)) {
            token->size += 2;

            (*cursor) += 2;
            sLineOffset += 2;
            break;
        } else if(is_line_break(string[*cursor])) {
            if(string[*cursor + 0] == '\r'
            && string[*cursor + 1] == '\n') {
                token->size += 2;

                (*cursor)   += 2;
            } else {
                token->size++;

                (*cursor)++;
            }

            sLine++;
            sLineOffset = LINE_OFFSET_START;
        } else {
            token->size++;

            (*cursor)++;
            sLineOffset++;
        }
    }
}

static void eat_whitespace(char *string, int stringSize, int *cursor)
{
    while(*cursor < stringSize)
    {
        if(is_whitespace(string[*cursor])) {
            (*cursor)++;
            sLineOffset++;
        } else if(is_line_break(string[*cursor])) {
            char c0 = string[*cursor + 0];
            char c1 = string[*cursor + 1];
            if(c0 == '\r'
            && c1 == '\n')
                (*cursor) += 2;
            else
                (*cursor)++;

            sLine++;
            sLineOffset = LINE_OFFSET_START;
        } else
            break;
    }
}

static void find_token_types(TokenList *tokens)
{
    for(int i = 0; i < tokens->count; i++) {
        Token *token = &tokens->tokens[i];

        if(is_digit(token->text[0])) {
            token->type = VALUE;
        }
        else if(!strncmp(token->text, "#", 1)) {
            if(!strcmp(token->text+1, "define")) {
                token->type = POUND_DEFINE;
            } else if(!strcmp(token->text+1, "if")) {
                token->type = POUND_IF;
            } else if(!strcmp(token->text+1, "else")) {
                token->type = POUND_ELSE;
            } else if(!strcmp(token->text+1, "ifndef")) {
                token->type = POUND_IFNDEF;
            } else if(!strcmp(token->text+1, "ifdef")) {
                token->type = POUND_IFDEF;
            } else if(!strcmp(token->text+1, "endif")) {
                token->type = POUND_ENDIF;
            } else if(!strcmp(token->text+1, "include")) {
                token->type = POUND_INCLUDE;
            } else {
                fprintf(stderr, "ERROR: Unknown #-def: '%s'\n", token->text+1);
                return;
            }
        }
        else if(!strncmp(token->text, "//", 2) || !strncmp(token->text, "/*", 2)) {
            token->type = COMMENT;
        } else if(is_single_char_token(token->text)) {
            token->type = get_single_char_token_type(token->text);
        } else {
            if((i > 0) && tokens->tokens[i-1].type == POUND_DEFINE)
                token->type = IDENTIFIER;
        }
    }
}

static void add_token(MemArena *tokenArena, MemArena *scratch, TokenList *tokens, char *header, int headerSize, int *cursor)
{
    if(header[*cursor] != '\0') {
        Token token = {0};
        char *src = &header[*cursor];
        
        token.line   = sLine;
        token.offset = sLineOffset;
        
        if(is_digit(header[*cursor])) {
            NumBases num_type = DECIMAL;

            // Allow for hex and binary numbers
            if(header[*cursor] == '0' && (header[*cursor + 1] == 'x'))
            {
                num_type = HEX;
                token.size += 2;

                *cursor += 2;
                sLineOffset += 2;
            }
            else if(header[*cursor] == '0' && (header[*cursor + 1] == 'b'))
            {
                num_type = BINARY;
                token.size += 2;

                *cursor += 2;
                sLineOffset += 2;
            }

            while(*cursor < headerSize
            && !is_line_break(header[*cursor])
            && (((num_type == DECIMAL) && is_digit(header[*cursor]))
            || ((num_type == HEX) && is_hex(header[*cursor]))
            || ((num_type == BINARY) && is_binary(header[*cursor]))))
            {
                token.size++;

                (*cursor)++;
                sLineOffset++;
            }
        } else if(!strncmp(&header[*cursor], "//", 2)) {
            // Make comments a single token
            while(*cursor < headerSize
            && !is_line_break(header[*cursor])
            && header[*cursor] != '\0')
            {
                token.size++;

                (*cursor)++;
                sLineOffset++;
            }
            
        } else if(!strncmp(&header[*cursor], "/*", 2)) {
            // Make comments a single token
            eat_multi_line_comment(&token, header, headerSize, cursor);

            if(*cursor == headerSize || header[*cursor] == '\0') {
                fprintf(stderr, "ERROR (%d,%d): Unterminated comment!\n", sLine, sLineOffset);
                exit(-3);
            }
        } else if(is_single_char_token(&header[*cursor])) {
            token.size++;

            (*cursor)++;
            sLineOffset++;
        } else {
            while(*cursor < headerSize
                && !is_whitespace(header[*cursor])
                && !is_single_char_token(&header[*cursor])
                && !is_line_break(header[*cursor])
                && header[*cursor] != '\0') {
                token.size++;

                (*cursor)++;
                sLineOffset++;
            }
        }

        // Place cursor at this token's last character
        (*cursor)--;
        
        token.text = memArenaAddStringN(scratch, src, token.size);

        memArenaAddMemory(tokenArena, &token, sizeof(token));
        tokens->count++;
    }
}

static char *read_entire_file(char* path, long *outSize)
{
    char *headerPath = path;
    FILE *f = fopen(headerPath, "rb");
    if(f)
    {
        *outSize = getFileSize(f);

        if(*outSize > 0) {
            char *strHeader = malloc(*outSize+1);

            size_t bytes_read = fread(strHeader, 1, *outSize, f);
            strHeader[*outSize] = '\0';
            fclose(f);

            return strHeader;
        } else {
            fclose(f);
            return NULL;
        }
    }
    else
    {
        printf("Could not open %s.\n", headerPath);
        return NULL;
    }
}

// TODO: Make this work without arena_alloc.c!
TokenList tokenize(MemArena *arena, char *headerPath)
{
    TokenList tokens = {0};

    long headerSize;
    char *header = read_entire_file(headerPath, &headerSize);

    if(header) {
        MemArena scratch;
        memArenaInit(&scratch);
    
        tokens.tokens = (void*)(((u8*)arena->memory) + arena->offset);
        tokens.count = 0;

        for(int cursor = 0; cursor < headerSize; cursor++)
        {
            eat_whitespace(header, headerSize, &cursor);
            add_token(arena, &scratch, &tokens, header, headerSize, &cursor);
        }

        find_token_types(&tokens);
    }

    return tokens;
}

TokenList parse(MemArena *arena, char *headerPath)
{
    TokenList tokens = tokenize(arena, headerPath);

    /* TODO: Analysis */

    return tokens;
}
