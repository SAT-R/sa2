

anim_data__0434_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x174C8, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	2, 0

	mGetTiles 0x174D8, 16
	.4byte	2, 1

	mGetTiles 0x174E8, 16
	.4byte	2, 2

	mGetTiles 0x174F8, 16
	.4byte	2, 3

	mGetTiles 0x17508, 16
	.4byte	2, 4

	mGetTiles 0x17518, 16
	.4byte	2, 5

	mGetTiles 0x17528, 16
	.4byte	2, 6

	mGetTiles 0x17538, 16
	.4byte	2, 7

	mJumpBack 0x31


anim_0434:
	.4byte anim_data__0434_0
