

anim_data__0146_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x7F4B 64
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0x7F8B 64
	.4byte	2, 1

	mGetTiles 0x7FCB 64
	.4byte	2, 2

	mGetTiles 0x800B 64
	.4byte	2, 3

	mGetTiles 0x804B 64
	.4byte	2, 4

	mGetTiles 0x808B 64
	.4byte	2, 5

	mGetTiles 0x7F4B 64
	.4byte	2, 0

	mGetTiles 0x7F8B 64
	.4byte	2, 1

	mGetTiles 0x7FCB 64
	.4byte	2, 2

	mGetTiles 0x80CB 64
	.4byte	2, 6

	mGetTiles 0x810B 64
	.4byte	2, 7

	mGetTiles 0x814B 64
	.4byte	2, 8

	mJumpBack 0x42


anim_0146:
	.4byte anim_data__0146_0
