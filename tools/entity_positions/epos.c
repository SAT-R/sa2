#include <assert.h>

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "csv_conv.h"

static char *GetProgramArg(int *argc, char ***argv)
{
    char *arg;

    assert(*argc > 0);

    arg = *argv[0];

    *argc -= 1;
    *argv += 1;

    return arg;
}

static char *GetFileExtension(char* path)
{
    return strrchr(path, '.');
}

static void PrintUsage(char *exe_path)
{
    fprintf(stderr, "Please provide different in- and output file paths.\n"
           "The filetypes tell me how to convert the data.\n"
           "%s: infile(.bin|.csv) outfile(.csv|.bin) [OPTIONS]\n"
           "\n"
           "OPTIONS:\n"
           "-entities <Map Entity> can be (without '...'):\n"
           "    '%s', '%s', '%s' or '%s'\n"
           "\n"
           "-header <c_header.h> should be a header file containing #defines for\n"
           "the indices of MapEntities to use (not required for %s\n",
           exe_path,
           sMapEntityKinds[EntInteractable], sMapEntityKinds[EntItem], sMapEntityKinds[EntEnemy], sMapEntityKinds[EntRing],
           sMapEntityKinds[EntRing]);
}

/*
 1) Binary -> CSV (User needs to pass kind (Interactables, Items, Enemies, Rings)
 2) CSV -> Binary 
*/
int main(int argc, char **argv)
{
    char *exe_path = GetProgramArg(&argc, &argv);

    if (argc < 4) {
        PrintUsage(exe_path);
        return 0;
    }
    
    CsvEntityType entity_type  = EntUnknown;

    char *path_a = GetProgramArg(&argc, &argv);
    char *path_b = GetProgramArg(&argc, &argv);
    char *ext_a  = GetFileExtension(path_a);
    char *ext_b  = GetFileExtension(path_b);
    char *c_header_path = NULL;

    while(argc > 0) {
        char *arg = GetProgramArg(&argc, &argv);
        
        if(!strcmp(arg, "--help")) {
            PrintUsage(exe_path);
            return -5;
        } else if(argc > 0) {
            if(!strcmp(arg, "-header")) {
                c_header_path = GetProgramArg(&argc, &argv);
            } else if(!strcmp(arg, "-game")) {
            } else if(!strcmp(arg, "-entities")) {
                char *arg_entity = GetProgramArg(&argc, &argv);

                for(int i = 0; i < 4; i++)
                {
                    if(!strcmp(arg_entity, sMapEntityKinds[i]))
                        entity_type = i;
                }

                if(entity_type == EntUnknown) {
                    printf("ERROR: Unknown entity type '%s'\n"
                           "Can be: '%s', '%s', '%s' or '%s'\n",
                        arg_entity,
                        sMapEntityKinds[0], sMapEntityKinds[1], sMapEntityKinds[2], sMapEntityKinds[3]);
                    return -4;
                }

            } else {
                printf("Unknown parameter '%s'.\n"
                       "Run with --help for valid parameter list\n", arg);
                return -3;
            }
        } else {
            printf("ERROR: Please add a value for argument '%s'!\n", arg);
            return -2;
        }
    }
    
    if(!strcmp(ext_a, ".csv") && !strcmp(ext_b, ".bin")) {
        ConvertCsvToBinary(path_a, path_b, c_header_path, true);
    } else if(!strcmp(ext_a, ".bin") && !strcmp(ext_b, ".csv")) {
        // TODO: We need to find out the targeted game and etype through parameters!
        ConvertBinaryToCsv(path_a, path_b, c_header_path, SA2, entity_type);
    } else {
        // ERROR: Unk ext
        printf("Don't know how to convert from '%s' to '%s'\n", ext_a, ext_b);
        return -1;
    }

    return 0;
}
