

anim_stage_variant_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA36 14
	.4byte	1, 0

	mAnimCmd4 

anim_stage_variant_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA44 14
	.4byte	1, 1

	mAnimCmd4 

anim_stage_variant_2:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA52 16
	.4byte	1, 2

	mAnimCmd4 

anim_stage_variant_3:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA62 16
	.4byte	1, 3

	mAnimCmd4 

anim_stage_variant_4:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA72 18
	.4byte	1, 4

	mAnimCmd4 

anim_stage_variant_5:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA84 18
	.4byte	1, 5

	mAnimCmd4 

anim_stage_variant_6:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA96 18
	.4byte	1, 6

	mAnimCmd4 

anim_stage_variant_7:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BAA8 18
	.4byte	1, 7

	mAnimCmd4 

anim_stage_variant_8:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BABA 18
	.4byte	1, 8

	mAnimCmd4 

anim_stage_variant_9:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BACC 18
	.4byte	1, 9

	mAnimCmd4 

anim_stage_variant_10:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BADE 18
	.4byte	1, 10

	mAnimCmd4 


anim_stage:
	.4byte anim_stage_variant_0
	.4byte anim_stage_variant_1
	.4byte anim_stage_variant_2
	.4byte anim_stage_variant_3
	.4byte anim_stage_variant_4
	.4byte anim_stage_variant_5
	.4byte anim_stage_variant_6
	.4byte anim_stage_variant_7
	.4byte anim_stage_variant_8
	.4byte anim_stage_variant_9
	.4byte anim_stage_variant_10
