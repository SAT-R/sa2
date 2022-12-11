

anim_data__0730_0:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9F0 9
	mAnimCmd6 0x0 0x410E4F0
	.4byte	4, 0

	mGetTiles 0x1D9F9 9
	.4byte	4, 1

	mGetTiles 0x1DA02 9
	.4byte	4, 2

	mGetTiles 0x1DA0B 9
	.4byte	4, 3

	mGetTiles 0x1DA14 6
	.4byte	4, 4

	mGetTiles 0x1DA1A 6
	.4byte	4, 5

	mGetTiles 0x1DA20 9
	.4byte	4, 6

	mGetTiles 0x1DA29 9
	.4byte	4, 7

	mJumpBack 0x2E

anim_data__0730_1:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1DA32 9
	.4byte	4, 8

	mGetTiles 0x1DA3B 9
	.4byte	4, 9

	mGetTiles 0x1DA44 9
	.4byte	4, 10

	mGetTiles 0x1DA4D 9
	.4byte	4, 11

	mAnimCmd4 


anim_0730:
	.4byte anim_data__0730_0
	.4byte anim_data__0730_1
