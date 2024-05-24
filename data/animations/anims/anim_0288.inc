

anim_data__0288_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xFAFE, 28
	mAnimCmd6 0x0, 0x1206F4FA
	mAnimCmd6 0x1, 0x1E0EFEF2
	.4byte	2, 0

	mGetTiles 0xFB1A, 28
	.4byte	2, 1

	mGetTiles 0xFB36, 28
	.4byte	2, 2

	mGetTiles 0xFB52, 28
	.4byte	2, 3

	mGetTiles 0xFAFE, 28
	.4byte	2, 0

	mGetTiles 0xFB1A, 28
	.4byte	2, 1

	mGetTiles 0xFB36, 28
	.4byte	2, 2

	mGetTiles 0xFB52, 28
	.4byte	2, 3

	mJumpBack 0x31

anim_data__0288_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xFB6E, 25
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	1, 4

	mGetTiles 0xFB87, 20
	.4byte	1, 5

	mGetTiles 0xFB9B, 16
	.4byte	1, 6

	mGetTiles 0xFBAB, 16
	.4byte	1, 7

	mGetTiles 0xFBBB, 16
	.4byte	4, 8

	mGetTiles 0xFBAB, 16
	.4byte	2, 7

	mGetTiles 0xFB9B, 16
	.4byte	2, 6

	mAnimCmd4 

anim_data__0288_2:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0xFBCB, 6
	.4byte	2, 9

	mGetTiles 0xFBD1, 16
	.4byte	2, 10

	mGetTiles 0xFBE1, 25
	.4byte	2, 11

	mGetTiles 0xFBFA, 25
	.4byte	2, 12

	mGetTiles 0xFC13, 24
	.4byte	2, 13

	mGetTiles 0xFC2B, 18
	.4byte	2, 14

	mGetTiles 0xFC3D, 15
	.4byte	2, 15

	mGetTiles 0xFC4C, 4
	.4byte	2, 16

	mJumpBack 0x2B


anim_0288:
	.4byte anim_data__0288_0
	.4byte anim_data__0288_1
	.4byte anim_data__0288_2
