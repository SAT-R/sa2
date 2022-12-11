

anim_data__0822_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x21D53 35
	.4byte	3, 0

	mGetTiles 0x21D76 35
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0822_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x21D99 42
	.4byte	3, 2

	mGetTiles 0x21DC3 42
	.4byte	3, 3

	mJumpBack 0xD


anim_0822:
	.4byte anim_data__0822_0
	.4byte anim_data__0822_1
