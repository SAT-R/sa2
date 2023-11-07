#ifndef GUARD_JASC_PARSER_H
#define GUARD_JASC_PARSER_H

#include "my_types.h"

typedef struct {
    JascColor *colors;
    int count;
} Jasc;

void parse_jasc(char* path, Jasc *jasc);

#endif // GUARD_JASC_PARSER_H