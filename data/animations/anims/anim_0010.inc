

anim_data__0010_0:
	mGetPalette 0x1, 16, 0x0
	mGetTiles 0xFB6, 16
	mAnimCmd6 0x0, 0x1006F0FA
	mAnimCmd6 0x1, 0x1006F0FA
	.4byte	3, 0

	mGetTiles 0xFC6, 16
	.4byte	2, 1

	mAnimCmd4 

anim_data__0010_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0xFD6, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 2

	mGetTiles 0xFE6, 16
	.4byte	2, 3

	mGetTiles 0xFF6, 16
	.4byte	2, 4

	mGetTiles 0x1006, 16
	.4byte	2, 5

	mGetTiles 0x1016, 16
	.4byte	2, 6

	mGetTiles 0x1026, 16
	.4byte	2, 7

	mGetTiles 0x1036, 16
	.4byte	2, 8

	mGetTiles 0x1046, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0010_2:
	mGetPalette 0x1, 16, 0x0
	mGetTiles 0x1056, 25
	mAnimCmd6 0x0, 0x406F0FA
	mAnimCmd6 0x1, 0xE08F6F8
	.4byte	1, 10

	mGetTiles 0x106F, 20
	.4byte	2, 11

	mGetTiles 0x1083, 25
	.4byte	2, 12

	mGetTiles 0x109C, 30
	.4byte	2, 13

	mJumpBack 0xF


anim_0010:
	.4byte anim_data__0010_0
	.4byte anim_data__0010_1
	.4byte anim_data__0010_2
