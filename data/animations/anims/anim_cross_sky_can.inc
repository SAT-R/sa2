

anim_cross_sky_can_variant_0:
	mGetPalette 0x63 16 0xB0
	mGetTiles 0x1B126 32
	.4byte	1, 0

	mGetTiles 0x1B146 32
	.4byte	1, 1

	mGetTiles 0x1B166 32
	.4byte	1, 2

	mGetTiles 0x1B186 28
	.4byte	1, 3

	mGetTiles 0x1B1A2 32
	.4byte	1, 4

	mGetTiles 0x1B1C2 28
	.4byte	1, 5

	mGetTiles 0x1B1DE 32
	.4byte	1, 6

	mGetTiles 0x1B1FE 32
	.4byte	1, 7

	mAnimCmd4 

anim_cross_sky_can_variant_1:
	mGetPalette 0x63 16 0xB0
	mGetTiles 0x1B126 32
	.4byte	1, 0

	mGetTiles 0x1B1FE 32
	.4byte	1, 7

	mGetTiles 0x1B1DE 32
	.4byte	1, 6

	mGetTiles 0x1B1C2 28
	.4byte	1, 5

	mGetTiles 0x1B1A2 32
	.4byte	1, 4

	mGetTiles 0x1B186 28
	.4byte	1, 3

	mGetTiles 0x1B166 32
	.4byte	1, 2

	mGetTiles 0x1B146 32
	.4byte	1, 1

	mAnimCmd4 

anim_cross_sky_can_variant_2:
	mGetPalette 0x63 16 0xB0
	mGetTiles 0x1B126 32
	.4byte	1, 0

	mJumpBack 0x8


anim_cross_sky_can:
	.4byte anim_cross_sky_can_variant_0
	.4byte anim_cross_sky_can_variant_1
	.4byte anim_cross_sky_can_variant_2
