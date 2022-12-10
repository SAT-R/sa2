

anim_data__0362_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x13059 16
	mAnimCmd6 0x0 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x13069 16
	.4byte	2, 1

	mGetTiles 0x13079 16
	.4byte	2, 2

	mGetTiles 0x13089 16
	.4byte	2, 3

	mGetTiles 0x13099 16
	.4byte	2, 4

	mGetTiles 0x130A9 16
	.4byte	2, 5

	mJumpBack 0x24


anim_0362:
	.4byte anim_data__0362_0
