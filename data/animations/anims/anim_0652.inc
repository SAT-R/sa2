

anim_data__0652_0:
	mGetPalette 0x8B 16 0x80
	mGetTiles 0x1C69E 16
	.4byte	2, 0

	mGetTiles 0x1C6AE 16
	.4byte	2, 1

	mGetTiles 0x1C6BE 16
	.4byte	2, 2

	mGetTiles 0x1C6CE 16
	.4byte	2, 3

	mJumpBack 0x17


anim_0652:
	.4byte anim_data__0652_0
