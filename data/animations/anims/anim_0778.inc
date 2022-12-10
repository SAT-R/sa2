

anim_data__0778_0:
	mGetPalette 0xA 16 0x0
	mGetTiles 0x201CA 64
	.4byte	2, 0

	mGetTiles 0x2020A 64
	.4byte	2, 1

	mGetTiles 0x2024A 64
	.4byte	2, 2

	mGetTiles 0x2028A 64
	.4byte	2, 3

	mGetTiles 0x202CA 64
	.4byte	2, 4

	mGetTiles 0x2030A 64
	.4byte	2, 5

	mJumpBack 0x21


anim_0778:
	.4byte anim_data__0778_0
