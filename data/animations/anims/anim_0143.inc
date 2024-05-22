

anim_data__0143_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7BDE, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	3, 0

	mGetTiles 0x7BF6, 24
	.4byte	3, 1

	mGetTiles 0x7C0E, 24
	.4byte	3, 2

	mGetTiles 0x7C26, 24
	.4byte	3, 3

	mJumpBack 0xF

anim_data__0143_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7BDE, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x7C3E, 24
	.4byte	3, 4

	mGetTiles 0x7C56, 20
	.4byte	3, 5

	mGetTiles 0x7C6A, 16
	.4byte	4, 6

	mGetTiles 0x7C7A, 20
	.4byte	4, 7

	mGetTiles 0x7C8E, 24
	.4byte	4, 8

	mAnimCmd4 

anim_data__0143_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7CA6, 28
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	3, 9

	mGetTiles 0x7CC2, 28
	.4byte	3, 10

	mGetTiles 0x7CDE, 28
	.4byte	3, 11

	mJumpBack 0x15


anim_0143:
	.4byte anim_data__0143_0
	.4byte anim_data__0143_1
	.4byte anim_data__0143_2
