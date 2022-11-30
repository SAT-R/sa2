	.section .rodata

    .global gSpriteTables
gSpriteTables: @ 0x080F40D4
    .4byte gAnimations
    .4byte gSpriteDimensions
    .4byte gSpriteOamData
    .4byte gSpritePalettes
    .4byte gSpriteImages
    .4byte gUnknown_086E9E08
    
    .include "data/animations/animations.inc"
    .include "data/animations/animations_table.inc"

    .global gUnknown_08137078 @ 0x08137078
 gUnknown_08137078:
    .incbin "baserom.gba", 0x00137078, 0x1614C
    
    .global gSpriteDimensions @ 0x0814D1C4
gSpriteDimensions:
    .incbin "baserom.gba", 0x0014D1C4, 0x1CA50

@; NOTE(Jace): As the name suggests, the data pointed to
@;             is using the exact same layout
@;             as the OAM memory in the GBA.
@;             IIRC this is used for layouting bigger sprites.
    .global gSpriteOamData @ 0x08169C14
gSpriteOamData:
    .incbin "baserom.gba", 0x00169C14, 0x11B4

    .global gSpritePalettes @ 0x0816ADC8
gSpritePalettes:
    .incbin "baserom.gba", 0x0016ADC8, 0x5BE0
    
@; TODO: Maybe just call it "gSprites"?
    .global gSpriteImages @ 0x081709A8
gSpriteImages:
    .incbin "baserom.gba", 0x001709A8, 0x579460

    .global gUnknown_086E9E08
gUnknown_086E9E08:
    .incbin "baserom.gba", 0x006E9E08, 0x600
