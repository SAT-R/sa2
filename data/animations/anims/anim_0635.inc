

anim_data__0635_0:
	mGetPalette 0x85 16 0x80
	mGetTiles 0x1BD70 9
	.4byte	2, 0

	mGetTiles 0x1BD79 9
	.4byte	2, 1

	mGetTiles 0x1BD82 9
	.4byte	2, 2

	mGetTiles 0x1BD8B 9
	.4byte	2, 3

	mJumpBack 0x17


anim_0635:
	.4byte anim_data__0635_0
