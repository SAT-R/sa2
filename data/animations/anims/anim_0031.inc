

anim_data__0031_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1D36, 16
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	3, 0

	mGetTiles 0x1D46, 24
	.4byte	3, 1

	mGetTiles 0x1D5E, 25
	.4byte	3, 2

	mAnimCmd4 

anim_data__0031_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1D77, 25
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	2, 3

	mGetTiles 0x1D90, 20
	.4byte	2, 4

	mGetTiles 0x1DA4, 25
	.4byte	2, 5

	mGetTiles 0x1DBD, 25
	.4byte	2, 6

	mJumpBack 0x1A

anim_data__0031_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1DD6, 20
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	2, 7

	mGetTiles 0x1DEA, 20
	.4byte	2, 8

	mGetTiles 0x1DFE, 20
	.4byte	4, 9

	mAnimCmd4 


anim_0031:
	.4byte anim_data__0031_0
	.4byte anim_data__0031_1
	.4byte anim_data__0031_2
