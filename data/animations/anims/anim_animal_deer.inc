

anim_animal_deer_variant_0:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1A4A7, 4
	.4byte	8, 0

	mGetTiles 0x1A4AB, 4
	.4byte	8, 1

	mGetTiles 0x1A4AF, 4
	.4byte	8, 2

	mGetTiles 0x1A4AB, 4
	.4byte	8, 1

	mJumpBack 0x17


anim_animal_deer:
	.4byte anim_animal_deer_variant_0
