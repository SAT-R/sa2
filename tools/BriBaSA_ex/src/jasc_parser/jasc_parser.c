// Simple tool to parse JASC palette files used by SAT-R and other projects.
//   Made by JaceCear

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "my_types.h"
#include "jasc_parser.h"


// free the result of this if != NULL!
static char* open_jasc(char* path)
{
    char* result = NULL;

    FILE *file = fopen(path, "r");

    if(file) {
        fseek(file, 0, SEEK_END);
        long size = ftell(file);
        fseek(file, 0, SEEK_SET);

        char* jasc_contents = (char*)malloc(size + 1);
        if(jasc_contents) {
            size_t bytes_read = fread(jasc_contents, sizeof(char), size, file);
            // Textfiles with CRLF newlines lead to bytes_read being smaller than size...
            if(bytes_read > 0 && bytes_read <= (unsigned)size) {
                jasc_contents[bytes_read] = '\0';
                result = jasc_contents;
            } else {
                fprintf(stderr,"ERROR: Could not successfully read file '%s'.\n", path);
            }
        } else {
            fprintf(stderr,"ERROR: Could not allocate %d bytes with malloc.\n", size);
        }

        fclose(file);
    } else {
        fprintf(stderr,"ERROR: Reading file '%s' failed.\n", path);
    }

    return result;
}

static int count_lines(char* text, int text_size)
{
    if(text_size == 0)
        return 0;

    int count = 1;

    for(int i = 0; i < text_size; i++) {
        if(text[i] == '\n') {
            count++;
        }
    }

    return count;
}

static void eat_line(char** text, int *current_line) {
    while(*text[0] != '\0') {
        if(*text[0] == '\n') {
            text[0]++;
            (*current_line)++;
            break;
        }

        text[0]++;
    }    
}

void parse_jasc(char* path, Jasc *jasc)
{
    char *jasc_text = open_jasc(path);
    char *remainder = jasc_text;
    int line_count = count_lines(jasc_text, strlen(jasc_text));
    int current_line = 1;

    
    if(strncmp(remainder, "JASC-PAL", 8) == 0) {
        eat_line(&remainder, &current_line);

        if(strncmp(remainder, "0100", 4) == 0) {
            eat_line(&remainder, &current_line);

            jasc->count = atoi(remainder);
            eat_line(&remainder, &current_line);

            if((line_count - current_line) == jasc->count) {
                jasc->colors = (JascColor*)malloc(sizeof(JascColor) * jasc->count);

                if(jasc->colors) {
                    for(int n = 0; n < jasc->count; n++) {
                        char *cursor = remainder;

                        jasc->colors[n].r = atoi(cursor);
                        while(*cursor != ' ') cursor++;
                        cursor++;
                    
                        jasc->colors[n].g = atoi(cursor);
                        while(*cursor != ' ') cursor++;
                        cursor++;

                        jasc->colors[n].b = atoi(cursor);
                    
                        jasc->colors[n].a = 0xFF;
                    
                        eat_line(&remainder, &current_line);
                    }
                }
            } else {
                fprintf(stderr,"ERROR: Set number of colors (%d) does not match the number of lines (%d-%d).\n"
                               "       Please make sure the JASC file ends with a newline!\n",
                    jasc->count,
                    line_count,
                    current_line);
                exit(-1);
            }
        } else {
            // TODO: Find out the meaning of line 2 in a JASC-Palette!
            //       (Likely the channel count!)
            fprintf(stderr, "ERROR: Missing '0100' in line 2.\n");
        }
    } else {
        fprintf(stderr, "ERROR: Missing 'JASC-PAL' in line 1.\n"
                        "       This does not appear to be a JASC-Palette.\n");
    }
}
