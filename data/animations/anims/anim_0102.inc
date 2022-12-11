

anim_data__0102_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x5DD7 16
	mAnimCmd6 0x0 0x806F2FA
	mAnimCmd6 0x1 0x806F2FA
	.4byte	3, 0

	mGetTiles 0x5DE7 16
	.4byte	2, 1

	mAnimCmd4 

anim_data__0102_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x5DF7 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 2

	mGetTiles 0x5E07 16
	.4byte	2, 3

	mGetTiles 0x5E17 16
	.4byte	2, 4

	mGetTiles 0x5E27 16
	.4byte	2, 5

	mGetTiles 0x5E37 16
	.4byte	2, 6

	mGetTiles 0x5E47 16
	.4byte	2, 7

	mGetTiles 0x5E57 16
	.4byte	2, 8

	mGetTiles 0x5E67 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0102_2:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x5E77 25
	mAnimCmd6 0x0 0x806F2FA
	mAnimCmd6 0x1 0xD0AF9F6
	.4byte	1, 10

	mGetTiles 0x5E90 24
	.4byte	2, 11

	mGetTiles 0x5EA8 28
	.4byte	2, 12

	mGetTiles 0x5EC4 20
	.4byte	2, 13

	mJumpBack 0xF


anim_0102:
	.4byte anim_data__0102_0
	.4byte anim_data__0102_1
	.4byte anim_data__0102_2
