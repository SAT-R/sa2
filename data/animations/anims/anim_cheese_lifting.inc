

anim_cheese_lifting_variant_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x17F65 9
	.4byte	3, 0

	mGetTiles 0x17F6E 9
	.4byte	3, 1

	mGetTiles 0x17F77 9
	.4byte	3, 2

	mGetTiles 0x17F6E 9
	.4byte	3, 1

	mJumpBack 0x17


anim_cheese_lifting:
	.4byte anim_cheese_lifting_variant_0
