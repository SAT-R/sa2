

anim_data__0276_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xEB28, 16
	mAnimCmd6 0x0, 0x806F8FA
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 0

	mGetTiles 0xEB38, 16
	.4byte	2, 1

	mGetTiles 0xEB48, 16
	.4byte	2, 2

	mGetTiles 0xEB58, 16
	.4byte	2, 3

	mJumpBack 0x1D

anim_data__0276_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xEB68, 16
	mAnimCmd6 0x0, 0x806F8FA
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 4

	mGetTiles 0xEB78, 16
	.4byte	2, 5

	mGetTiles 0xEB88, 16
	.4byte	2, 6

	mGetTiles 0xEB98, 16
	.4byte	2, 7

	mAnimCmd4 


anim_0276:
	.4byte anim_data__0276_0
	.4byte anim_data__0276_1
