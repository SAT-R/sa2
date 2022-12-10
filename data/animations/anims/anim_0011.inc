

anim_data__0011_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x10BA 16
	mAnimCmd6 0x0 0x1006F0FA
	mAnimCmd6 0x1 0x1006F0FA
	.4byte	3, 0

	mGetTiles 0x10CA 16
	mAnimCmd6 0x0 0x1206F4FA
	mAnimCmd6 0x1 0x1206F4FA
	.4byte	2, 1

	mAnimCmd4 

anim_data__0011_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x10DA 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 2

	mGetTiles 0x10EA 16
	.4byte	2, 3

	mGetTiles 0x10FA 16
	.4byte	2, 4

	mGetTiles 0x110A 16
	.4byte	2, 5

	mGetTiles 0x111A 16
	.4byte	2, 6

	mGetTiles 0x112A 16
	.4byte	2, 7

	mGetTiles 0x113A 16
	.4byte	2, 8

	mGetTiles 0x114A 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0011_2:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x115A 25
	mAnimCmd6 0x0 0x406F0FA
	mAnimCmd6 0x1 0xE08F6F8
	.4byte	1, 10

	mGetTiles 0x1173 20
	.4byte	2, 11

	mGetTiles 0x1187 25
	.4byte	2, 12

	mGetTiles 0x11A0 30
	.4byte	2, 13

	mJumpBack 0xF


anim_0011:
	.4byte anim_data__0011_0
	.4byte anim_data__0011_1
	.4byte anim_data__0011_2
