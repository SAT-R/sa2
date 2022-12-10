

anim_data__0632_0:
	mGetPalette 0x85 16 0x80
	mGetTiles 0x1BC70 72
	mAnimCmd6 0x0 0x1C18EEE9
	mAnimCmd6 0x1 0x210A02F7
	.4byte	3, 0

	mGetTiles 0x1BCB8 72
	.4byte	3, 1

	mGetTiles 0x1BD00 72
	.4byte	3, 2

	mJumpBack 0x18


anim_0632:
	.4byte anim_data__0632_0
