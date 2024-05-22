

anim_data__0544_0:
	mGetPalette 0x4B, 16, 0x70
	mGetTiles 0x1A98F, 12
	.4byte	3, 0

	mGetTiles 0x1A99B, 12
	.4byte	3, 1

	mGetTiles 0x1A9A7, 12
	.4byte	3, 2

	mJumpBack 0x12


anim_0544:
	.4byte anim_data__0544_0
