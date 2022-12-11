

anim_data__0111_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x65A4 24
	mAnimCmd6 0x0 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x65BC 20
	.4byte	2, 1

	mGetTiles 0x65D0 24
	mAnimCmd6 0x0 0xA06F4FA
	mAnimCmd6 0x1 0x110607FA
	.4byte	2, 2

	mGetTiles 0x65E8 28
	.4byte	2, 3

	mGetTiles 0x6604 20
	.4byte	2, 4

	mJumpBack 0x15


anim_0111:
	.4byte anim_data__0111_0
