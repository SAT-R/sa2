

anim_data__0195_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xADFB, 20
	mAnimCmd6 0x0, 0xC06F6FA
	.4byte	2, 0

	mGetTiles 0xAE0F, 25
	.4byte	2, 1

	mGetTiles 0xAE28, 35
	.4byte	2, 2

	mGetTiles 0xAE4B, 35
	.4byte	2, 3

	mGetTiles 0xAE6E, 35
	.4byte	2, 4

	mJumpBack 0xF


anim_0195:
	.4byte anim_data__0195_0
