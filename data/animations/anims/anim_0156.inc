

anim_data__0156_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x8804, 20
	mAnimCmd6 0x0, 0x806F2FA
	.4byte	2, 0

	mGetTiles 0x8818, 20
	.4byte	2, 1

	mGetTiles 0x882C, 25
	.4byte	2, 2

	mGetTiles 0x8845, 24
	.4byte	2, 3

	mGetTiles 0x885D, 24
	.4byte	2, 4

	mGetTiles 0x8875, 25
	.4byte	2, 5

	mGetTiles 0x888E, 30
	.4byte	2, 6

	mGetTiles 0x88AC, 20
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0156_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x88C0, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 8

	mGetTiles 0x88D4, 20
	.4byte	2, 9

	mGetTiles 0x88E8, 16
	.4byte	3, 10

	mGetTiles 0x88F8, 20
	.4byte	3, 11

	mGetTiles 0x890C, 24
	.4byte	3, 12

	mAnimCmd4 

anim_data__0156_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x8924, 28
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	3, 13

	mGetTiles 0x8940, 28
	.4byte	3, 14

	mGetTiles 0x895C, 28
	.4byte	3, 15

	mJumpBack 0x15


anim_0156:
	.4byte anim_data__0156_0
	.4byte anim_data__0156_1
	.4byte anim_data__0156_2
