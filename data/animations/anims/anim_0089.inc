

anim_data__0089_0:
	mGetPalette 0x6 16 0x0
	mGetTiles 0x4705 16
	mAnimCmd6 0x0 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x4715 16
	.4byte	2, 1

	mGetTiles 0x4725 16
	.4byte	2, 2

	mGetTiles 0x4735 16
	.4byte	2, 3

	mGetTiles 0x4745 16
	.4byte	2, 4

	mGetTiles 0x4755 16
	.4byte	2, 5

	mJumpBack 0x24


anim_0089:
	.4byte anim_data__0089_0
