

anim_data__0768_0:
	mGetPalette 0xBB, 16, 0x0
	mGetTiles 0x1FBED, 35
	.4byte	3, 0

	mGetTiles 0x1FC10, 28
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0768_1:
	mGetPalette 0xBB, 16, 0x0
	mGetTiles 0x1FC2C, 16
	.4byte	1, 2

	mGetTiles 0x1FC3C, 16
	.4byte	1, 3

	mGetTiles 0x1FC4C, 16
	.4byte	12, 4

	mGetTiles 0x1FC3C, 16
	.4byte	2, 3

	mGetTiles 0x1FC2C, 16
	.4byte	2, 2

	mAnimCmd4 


anim_0768:
	.4byte anim_data__0768_0
	.4byte anim_data__0768_1
