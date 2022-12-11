

anim_data__0323_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x110FA 24
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 0

	mGetTiles 0x11112 30
	.4byte	2, 1

	mGetTiles 0x11130 30
	.4byte	4, 2

	mAnimCmd4 

anim_data__0323_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1114E 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 3

	mGetTiles 0x11162 20
	.4byte	2, 4

	mGetTiles 0x11176 30
	mAnimCmd6 0x0 0xE06F0FA
	mAnimCmd6 0x1 0xE12F000
	.4byte	3, 5

	mGetTiles 0x11194 30
	.4byte	3, 6

	mJumpBack 0x10


anim_0323:
	.4byte anim_data__0323_0
	.4byte anim_data__0323_1
