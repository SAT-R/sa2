

anim_data__0008_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x536 12
	mAnimCmd6 0x0 0x1006F3FA
	.4byte	1, 0

	mGetTiles 0x542 16
	.4byte	1, 1

	mGetTiles 0x552 20
	.4byte	3, 2

	mGetTiles 0x566 24
	.4byte	3, 3

	mJumpBack 0xA

anim_data__0008_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x57E 20
	mAnimCmd6 0x0 0x1006F3FA
	.4byte	2, 4

	mGetTiles 0x592 20
	.4byte	1, 5

	mGetTiles 0x5A6 16
	.4byte	1, 6

	mAnimCmd4 


anim_0008:
	.4byte anim_data__0008_0
	.4byte anim_data__0008_1
