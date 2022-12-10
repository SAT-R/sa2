

anim_data__0789_0:
	mGetPalette 0xC8 16 0x0
	mGetTiles 0x211C3 56
	.4byte	3, 0

	mGetTiles 0x211FB 56
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0789_1:
	mGetPalette 0xC8 16 0x0
	mGetTiles 0x21233 42
	.4byte	3, 2

	mGetTiles 0x2125D 42
	.4byte	3, 3

	mJumpBack 0xD

anim_data__0789_2:
	mGetPalette 0xC9 16 0x0
	mGetTiles 0x21287 56
	.4byte	3, 4

	mGetTiles 0x212BF 56
	.4byte	3, 5

	mJumpBack 0xD

anim_data__0789_3:
	mGetPalette 0xC9 16 0x0
	mGetTiles 0x212F7 42
	.4byte	3, 6

	mGetTiles 0x21321 42
	.4byte	3, 7

	mJumpBack 0xD


anim_0789:
	.4byte anim_data__0789_0
	.4byte anim_data__0789_1
	.4byte anim_data__0789_2
	.4byte anim_data__0789_3
