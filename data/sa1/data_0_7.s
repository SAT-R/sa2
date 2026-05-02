	.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

	mSectionRodata

    .global C_DECL(sBounceBlockAnims)
C_DECL(sBounceBlockAnims):
    .short 0x01CE @ SA1_ANIM_BOUNCE_BLOCK_1   @ Neo Green Hill 1
    .short 0x01CE @ SA1_ANIM_BOUNCE_BLOCK_1   @ Neo Green Hill 2
    .short 0x01F3 @ SA1_ANIM_BOUNCE_BLOCK_2   @ Secret Base 1
    .short 0x01F3 @ SA1_ANIM_BOUNCE_BLOCK_2   @ Secret Base 2
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Casino Paradise 1
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Casino Paradise 2
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Ice Mountain 1
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Ice Mountain 2
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Angel Island 1
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ Angel Island 2
    .short 0x01FB @ SA1_ANIM_BOUNCE_BLOCK_6_1 @ Egg Rocket
    .short 0x0259 @ SA1_ANIM_BOUNCE_BLOCK_6_2 @ Cosmic Angel
    .short 0x01FB @ SA1_ANIM_BOUNCE_BLOCK_6_1 @ X-Zone
    .short 0x01FB @ SA1_ANIM_BOUNCE_BLOCK_6_1 @ Moon Zone
    .short 0x01CE @ SA1_ANIM_BOUNCE_BLOCK_1   @ 2-Player Neo Green Hill
    .short 0x01F3 @ SA1_ANIM_BOUNCE_BLOCK_2   @ 2-Player Secret Base
    .short 0x021F @ SA1_ANIM_BOUNCE_BLOCK_5   @ 2-Player Casino Paradise
    .short 0x0259 @ SA1_ANIM_BOUNCE_BLOCK_6_2 @ 2-Player Cosmic Angel

    .global C_DECL(gUnknown_086CED28)
C_DECL(gUnknown_086CED28):
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Neo Green Hill 1
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Neo Green Hill 2
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Secret Base 1
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Secret Base 2
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Casino Paradise 1
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Casino Paradise 2
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Ice Mountain 1
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Ice Mountain 2
    .short 0x0228 @ SA1_ANIM_WATER_SPLASH_5  @ Angel Island 1
    .short 0x0228 @ SA1_ANIM_WATER_SPLASH_5  @ Angel Island 2
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Egg Rocket
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Cosmic Angel
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ X-Zone
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ Moon Zone
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ 2-Player Neo Green Hill
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ 2-Player Secret Base
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ 2-Player Casino Paradise
    .short 0x01D0 @ SA1_ANIM_WATER_SPLASH_1  @ 2-Player Cosmic Angel
