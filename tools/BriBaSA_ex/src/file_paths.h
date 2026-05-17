#ifndef GUARD_BRIBASA_EX_FILE_PATHS_H
#define GUARD_BRIBASA_EX_FILE_PATHS_H

extern void InitFilePaths(GameId game, FileInfo *outInfo, char *gameDir, char *mapDir);
extern char *allocPath(char *folder, char *fileName);

#endif // GUARD_BRIBASA_EX_FILE_PATHS_H
