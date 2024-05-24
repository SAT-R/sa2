

anim_animal_penguin_variant_0:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1A483, 4
	.4byte	8, 0

	mGetTiles 0x1A487, 4
	.4byte	8, 1

	mGetTiles 0x1A48B, 4
	.4byte	8, 2

	mGetTiles 0x1A487, 4
	.4byte	8, 1

	mJumpBack 0x17


anim_animal_penguin:
	.4byte anim_animal_penguin_variant_0
