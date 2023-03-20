This program is GBAGFX ( By YamaArashi, see LICENSE file ), but with a few features specific to Dimps' GBA engine that was used for Sonic Advance 1-3, Kirby and the Amazing Mirror and likely other games.

It includes the new parameters:
- `-ignore_trailing` for PNG -> 4bpp conversion, which ignores all empty tiles at the end of an image. Useful for tilesets.

- `-split_into_oam_shapes` for PNG -> 4bpp conversion, used to arrange the output tiles in way that the GBA can handle better. Used for sprites.

These are needed to create tiles that match the tiles in the games mentioned above.
