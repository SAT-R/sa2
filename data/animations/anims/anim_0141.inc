

anim_data__0141_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x796E, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x7986, 20
	.4byte	2, 1

	mGetTiles 0x799A, 24
	.4byte	4, 2

	mGetTiles 0x79B2, 12
	.4byte	6, 3

	mGetTiles 0x79BE, 24
	.4byte	2, 4

	mAnimCmd4 

anim_data__0141_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x79D6, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 5

	mGetTiles 0x79EA, 20
	.4byte	2, 6

	mGetTiles 0x79FE, 20
	.4byte	3, 7

	mGetTiles 0x7A12, 20
	.4byte	3, 8

	mGetTiles 0x7A26, 16
	.4byte	3, 9

	mJumpBack 0xF

anim_data__0141_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7A36, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 10

	mGetTiles 0x7A4A, 30
	.4byte	2, 11

	mGetTiles 0x7A68, 28
	.4byte	2, 12

	mGetTiles 0x7A84, 28
	.4byte	3, 13

	mGetTiles 0x7AA0, 28
	.4byte	3, 14

	mGetTiles 0x7ABC, 28
	.4byte	3, 15

	mJumpBack 0xF


anim_0141:
	.4byte anim_data__0141_0
	.4byte anim_data__0141_1
	.4byte anim_data__0141_2
