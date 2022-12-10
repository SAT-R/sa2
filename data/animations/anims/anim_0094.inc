

anim_data__0094_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x4B47 25
	mAnimCmd6 0x0 0x806F8FA
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x4B60 30
	.4byte	2, 1

	mGetTiles 0x4B7E 25
	.4byte	2, 2

	mGetTiles 0x4B97 25
	.4byte	2, 3

	mGetTiles 0x4BB0 25
	.4byte	2, 4

	mGetTiles 0x4BC9 30
	.4byte	2, 5

	mGetTiles 0x4BE7 25
	.4byte	2, 6

	mGetTiles 0x4C00 25
	.4byte	2, 7

	mJumpBack 0x31

anim_data__0094_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x4B47 25
	mAnimCmd6 0x0 0x806F8FA
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x4B60 30
	.4byte	2, 1

	mGetTiles 0x4B7E 25
	.4byte	2, 2

	mGetTiles 0x4B97 25
	.4byte	2, 3

	mGetTiles 0x4BB0 25
	.4byte	2, 4

	mGetTiles 0x4BC9 30
	.4byte	2, 5

	mGetTiles 0x4BE7 25
	.4byte	2, 6

	mGetTiles 0x4C00 25
	.4byte	2, 7

	mJumpBack 0x31


anim_0094:
	.4byte anim_data__0094_0
	.4byte anim_data__0094_1
