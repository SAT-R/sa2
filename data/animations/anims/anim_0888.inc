

anim_data__0888_0:
	mGetPalette 0xED, 16, 0x80
	mGetTiles 0x242E7, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0888_1:
	mGetPalette 0xED, 16, 0x80
	mGetTiles 0x242EF, 8
	.4byte	3, 1

	mGetTiles 0x242F7, 8
	.4byte	3, 2

	mGetTiles 0x242FF, 8
	.4byte	3, 3

	mGetTiles 0x24307, 8
	.4byte	3, 4

	mJumpBack 0x17


anim_0888:
	.4byte anim_data__0888_0
	.4byte anim_data__0888_1
