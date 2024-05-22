

anim_data__0052_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x2AA5, 24
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x2ABD, 18
	.4byte	3, 1

	mGetTiles 0x2ACF, 18
	.4byte	3, 2

	mGetTiles 0x2AE1, 18
	.4byte	3, 3

	mJumpBack 0xF

anim_data__0052_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x2AA5, 24
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	2, 0

	mGetTiles 0x2AF3, 20
	.4byte	2, 4

	mGetTiles 0x2B07, 20
	.4byte	2, 5

	mGetTiles 0x2B1B, 20
	.4byte	3, 6

	mGetTiles 0x2B2F, 20
	.4byte	3, 7

	mGetTiles 0x2B43, 20
	.4byte	3, 8

	mAnimCmd4 

anim_data__0052_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x2B57, 20
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 9

	mGetTiles 0x2B6B, 20
	.4byte	3, 10

	mGetTiles 0x2B7F, 20
	.4byte	3, 11

	mJumpBack 0x15


anim_0052:
	.4byte anim_data__0052_0
	.4byte anim_data__0052_1
	.4byte anim_data__0052_2
