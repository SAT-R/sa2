

anim_data__0003_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3AE 16
	mAnimCmd6 0x0 0x806F8FA
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x3BE 16
	.4byte	2, 1

	mGetTiles 0x3CE 16
	.4byte	2, 2

	mGetTiles 0x3DE 16
	.4byte	2, 3

	mJumpBack 0x1D

anim_data__0003_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3EE 16
	mAnimCmd6 0x0 0x806F8FA
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 4

	mGetTiles 0x3FE 16
	.4byte	2, 5

	mGetTiles 0x40E 16
	.4byte	2, 6

	mGetTiles 0x41E 16
	.4byte	2, 7

	mAnimCmd4 


anim_0003:
	.4byte anim_data__0003_0
	.4byte anim_data__0003_1
