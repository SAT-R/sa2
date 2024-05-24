

anim_data__0007_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x4EB, 25
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	2, 0

	mGetTiles 0x504, 25
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	4, 1

	mGetTiles 0x51D, 25
	.4byte	4, 2

	mJumpBack 0xD

anim_data__0007_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x4EB, 25
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	4, 0

	mAnimCmd4 


anim_0007:
	.4byte anim_data__0007_0
	.4byte anim_data__0007_1
