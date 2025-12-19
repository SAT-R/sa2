#include <stdlib.h>
#include <stdio.h>

#include "arena_alloc.h"

#include "parser.h"

char *getProgramArg(int *argc, char ***argv)
{
    char *arg;

    assert(*argc > 0);

    arg = *argv[0];

    *argc -= 1;
    *argv += 1;

    return arg;
}

int main(int argc, char **argv)
{
    MemArena arena;
    memArenaInit(&arena);

    char *program = getProgramArg(&argc, &argv);

    if(argc != 1) {
        printf("Please provide a header file to parse.\n");
        exit(-1);
    }
    
    char *path = getProgramArg(&argc, &argv);

    {
        TokenList tokens = tokenize(&arena, path);
        
        if(tokens.tokens)
            printf("Printing #defines set to a value:\n");

            for(int tid = 0; tid < tokens.count; )
            {
                Token *token = &tokens.tokens[tid];

                if(tid+2 < tokens.count
                    && (token+0)->type == POUND_DEFINE
                    && (token+1)->type == IDENTIFIER
                    && (token+2)->type == VALUE)
                {
                    printf("%4d: %s %s %s\n", tid,
                        (token+0)->text,
                        (token+1)->text,
                        (token+2)->text);

                    tid += 3;
                } else {
                    tid++;
                }
            }
    }

    return 0;
}