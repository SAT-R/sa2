

anim_data__0211_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xB4E5, 25
	.4byte	3, 0

	mGetTiles 0xB4FE, 20
	.4byte	3, 1

	mGetTiles 0xB4E5, 25
	.4byte	3, 0

	mGetTiles 0xB512, 25
	.4byte	3, 2

	mGetTiles 0xB52B, 20
	.4byte	3, 3

	mGetTiles 0xB53F, 20
	.4byte	3, 4

	mJumpBack 0xA


anim_0211:
	.4byte anim_data__0211_0
