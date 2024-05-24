

anim_animal_rabbit_variant_0:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1A48F, 4
	.4byte	8, 0

	mGetTiles 0x1A493, 4
	.4byte	8, 1

	mGetTiles 0x1A497, 4
	.4byte	8, 2

	mGetTiles 0x1A493, 4
	.4byte	8, 1

	mJumpBack 0x17


anim_animal_rabbit:
	.4byte anim_animal_rabbit_variant_0
