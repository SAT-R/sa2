

anim_data__0430_0:
	mGetPalette 0x22 16 0x0
	mGetTiles 0x17126 20
	mAnimCmd6 0x0 0x806EEFA
	.4byte	3, 0

	mGetTiles 0x1713A 20
	.4byte	3, 1

	mGetTiles 0x1714E 20
	.4byte	3, 2

	mJumpBack 0x15

anim_data__0430_1:
	mGetPalette 0x22 16 0x0
	mGetTiles 0x17162 20
	mAnimCmd6 0x0 0x806EEFA
	.4byte	3, 3

	mGetTiles 0x17176 20
	.4byte	3, 4

	mGetTiles 0x1718A 20
	.4byte	3, 5

	mGetTiles 0x1719E 24
	.4byte	3, 6

	mGetTiles 0x171B6 20
	.4byte	3, 7

	mAnimCmd4 

anim_data__0430_2:
	mGetPalette 0x22 16 0x0
	mGetTiles 0x171CA 25
	mAnimCmd6 0x0 0xA06F0FA
	.4byte	3, 8

	mGetTiles 0x171E3 30
	.4byte	3, 9

	mGetTiles 0x17201 25
	.4byte	3, 10

	mJumpBack 0x15


anim_0430:
	.4byte anim_data__0430_0
	.4byte anim_data__0430_1
	.4byte anim_data__0430_2
