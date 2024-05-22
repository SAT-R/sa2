

anim_data__0234_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC8BB, 21
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0xC8D0, 21
	.4byte	2, 1

	mGetTiles 0xC8E5, 21
	.4byte	2, 2

	mJumpBack 0x15

anim_data__0234_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC8FA, 18
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 3

	mGetTiles 0xC90C, 24
	mAnimCmd6 0x0, 0x806F2FA
	.4byte	3, 4

	mGetTiles 0xC924, 20
	.4byte	3, 5

	mGetTiles 0xC938, 20
	.4byte	4, 6

	mGetTiles 0xC94C, 20
	mAnimCmd6 0x0, 0x606F0FA
	.4byte	4, 7

	mGetTiles 0xC960, 25
	mAnimCmd6 0x0, 0x606F2FA
	.4byte	4, 8

	mAnimCmd4 

anim_data__0234_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC979, 35
	mAnimCmd6 0x0, 0x606F0FA
	.4byte	3, 9

	mGetTiles 0xC99C, 35
	.4byte	3, 10

	mGetTiles 0xC9BF, 35
	.4byte	3, 11

	mJumpBack 0x15


anim_0234:
	.4byte anim_data__0234_0
	.4byte anim_data__0234_1
	.4byte anim_data__0234_2
