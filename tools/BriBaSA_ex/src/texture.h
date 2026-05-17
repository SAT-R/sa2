#ifndef GUARD_BRISABA_EX_TEXTURE_H
#define GUARD_BRISABA_EX_TEXTURE_H

extern Texture2D GetEntityTextureById(AppState *state, EntityType etype, unsigned char id);

extern void LoadAllEntityTextures(GameId game, char *gamePath, FileInfo *paths);

#endif // GUARD_BRISABA_EX_TEXTURE_H
