

anim_data__0600_0:
	mGetPalette 0x74 16 0xB0
	mGetTiles 0x1B6BA 9
	mAnimCmd6 0x0 0xB0BF5F5
	.4byte	10, 0

	mGetTiles 0x1B6C3 9
	.4byte	10, 1

	mGetTiles 0x1B6CC 9
	.4byte	10, 2

	mGetTiles 0x1B6D5 9
	.4byte	10, 3

	mJumpBack 0x1A

anim_data__0600_1:
	mGetPalette 0x74 16 0xB0
	mGetTiles 0x1B6DE 9
	mAnimCmd6 0x0 0xB0BF5F5
	.4byte	10, 4

	mGetTiles 0x1B6E7 9
	.4byte	6, 5

	mGetTiles 0x1B6F0 9
	.4byte	6, 6

	.4byte	1, -1

	mAnimCmd4 


anim_0600:
	.4byte anim_data__0600_0
	.4byte anim_data__0600_1
