

anim_animal_koala_variant_0:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1A4D7, 4
	.4byte	6, 0

	mGetTiles 0x1A4DB, 4
	.4byte	6, 1

	mGetTiles 0x1A4DF, 4
	.4byte	6, 2

	mGetTiles 0x1A4DB, 4
	.4byte	6, 1

	mJumpBack 0x17


anim_animal_koala:
	.4byte anim_animal_koala_variant_0
