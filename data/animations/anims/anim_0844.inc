

anim_data__0844_0:
	mGetPalette 0xBF 16 0x90
	mGetTiles 0x22E11 30
	.4byte	3, 0

	mGetTiles 0x22E2F 35
	.4byte	3, 1

	mGetTiles 0x22E52 35
	.4byte	3, 2

	mJumpBack 0x12

anim_data__0844_1:
	mGetPalette 0xBF 16 0x90
	mGetTiles 0x22E75 20
	.4byte	1, 3

	mAnimCmd4 


anim_0844:
	.4byte anim_data__0844_0
	.4byte anim_data__0844_1
