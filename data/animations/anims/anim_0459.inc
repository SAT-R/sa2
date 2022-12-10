

anim_data__0459_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x17E9F 9
	.4byte	3, 0

	mGetTiles 0x17EA8 9
	.4byte	3, 1

	mGetTiles 0x17EB1 9
	.4byte	3, 2

	mGetTiles 0x17EBA 9
	.4byte	3, 3

	mGetTiles 0x17EC3 9
	.4byte	3, 4

	mGetTiles 0x17ECC 9
	.4byte	3, 5

	mGetTiles 0x17ED5 9
	.4byte	3, 6

	mGetTiles 0x17EDE 9
	.4byte	3, 7

	mJumpBack 0x2B


anim_0459:
	.4byte anim_data__0459_0
