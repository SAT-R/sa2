

anim_data__0302_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1022C 30
	.4byte	3, 0

	mGetTiles 0x1024A 36
	.4byte	3, 1

	mGetTiles 0x1022C 30
	.4byte	3, 0

	mGetTiles 0x1026E 25
	.4byte	3, 2

	mGetTiles 0x10287 20
	.4byte	3, 3

	mGetTiles 0x1029B 20
	.4byte	3, 4

	mJumpBack 0xA


anim_0302:
	.4byte anim_data__0302_0
