

anim_animal_lion_variant_0:
	mGetPalette 0x44 16 0x80
	mGetTiles 0x1A45F 4
	.4byte	8, 0

	mGetTiles 0x1A463 4
	.4byte	2, 1

	mGetTiles 0x1A467 4
	.4byte	10, 2

	mGetTiles 0x1A463 4
	.4byte	2, 1

	mJumpBack 0x17


anim_animal_lion:
	.4byte anim_animal_lion_variant_0
