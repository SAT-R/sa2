
@ TODO: Replace MapHeaders in ASM format with C structs
.macro MapHeader_BG xTiles, yTiles, animTileSize, animFrameCount, animDelay, tileset, num_colors, palette, palOffset, palLength, metatiles, map
  .2byte \xTiles, \yTiles
  .2byte \animTileSize
  .byte \animFrameCount, \animDelay
  .4byte \tileset, \num_colors
  .4byte \palette
  .2byte \palOffset, \palLength
  .4byte \metatiles
  .4byte \map
.endm

.macro MapHeader xTiles, yTiles, animTileSize, animFrameCount, animDelay, tileset, num_colors, palette, palOffset, palLength, metatiles, map, width, height
  MapHeader_BG \xTiles, \yTiles, \animTileSize, \animFrameCount, \animDelay, \tileset, \num_colors, \palette, \palOffset, \palLength, \metatiles, \map
  .2byte \width, \height
.endm
