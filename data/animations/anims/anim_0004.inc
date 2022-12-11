

anim_data__0004_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x42E 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x43E 16
	.4byte	2, 1

	mGetTiles 0x44E 16
	.4byte	2, 2

	mGetTiles 0x45E 16
	.4byte	2, 3

	mGetTiles 0x42E 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x43E 16
	.4byte	2, 1

	mGetTiles 0x44E 16
	.4byte	2, 2

	mGetTiles 0x45E 16
	.4byte	2, 3

	mGetTiles 0x42E 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x43E 16
	.4byte	2, 1

	mGetTiles 0x44E 16
	.4byte	2, 2

	mGetTiles 0x45E 16
	.4byte	2, 3

	mJumpBack 0x51


anim_0004:
	.4byte anim_data__0004_0
