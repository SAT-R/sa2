

anim_data__0101_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5CD6, 16
	mAnimCmd6 0x0, 0x806F2FA
	mAnimCmd6 0x1, 0x806F2FA
	.4byte	3, 0

	mGetTiles 0x5CE6, 16
	.4byte	3, 1

	mAnimCmd4 

anim_data__0101_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5CF6, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 2

	mGetTiles 0x5D06, 16
	.4byte	2, 3

	mGetTiles 0x5D16, 16
	.4byte	2, 4

	mGetTiles 0x5D26, 16
	.4byte	2, 5

	mGetTiles 0x5D36, 16
	.4byte	2, 6

	mGetTiles 0x5D46, 16
	.4byte	2, 7

	mGetTiles 0x5D56, 16
	.4byte	2, 8

	mGetTiles 0x5D66, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0101_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5D76, 25
	mAnimCmd6 0x0, 0x806F2FA
	mAnimCmd6 0x1, 0xD0AF9F6
	.4byte	1, 10

	mGetTiles 0x5D8F, 24
	.4byte	2, 11

	mGetTiles 0x5DA7, 28
	.4byte	2, 12

	mGetTiles 0x5DC3, 20
	.4byte	2, 13

	mJumpBack 0xF


anim_0101:
	.4byte anim_data__0101_0
	.4byte anim_data__0101_1
	.4byte anim_data__0101_2
