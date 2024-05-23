
@ TODO: Replace MapHeaders in ASM format with C structs
.macro MapHeader_BG xTiles:req, yTiles:req, animTileSize:req, animFrameCount:req, animDelay:req, tileset:req, num_colors:req, palette:req, palOffset:req, palLength:req, metatiles:req, map:req
  .2byte \xTiles, \yTiles
  .2byte \animTileSize
  .byte \animFrameCount, \animDelay
  .4byte \tileset, \num_colors
  .4byte \palette
  .2byte \palOffset, \palLength
  .4byte \metatiles
  .4byte \map
.endm

.macro MapHeader xTiles:req, yTiles:req, animTileSize:req, animFrameCount:req, animDelay:req, tileset:req, num_colors:req, palette:req, palOffset:req, palLength:req, metatiles:req, map:req, width:req, height:req
  MapHeader_BG \xTiles, \yTiles, \animTileSize, \animFrameCount, \animDelay, \tileset, \num_colors, \palette, \palOffset, \palLength, \metatiles, \map
  .2byte \width, \height
.endm
