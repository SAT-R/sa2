
.align 2, 0
	anim_data__0498_0:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19DA4 4
		mAnimCmd6 0x0 0x404FEFD
		.4byte	3, 0

		mGetTiles 0x19DA8 4
		.4byte	3, 1

		mJumpBack 0x10


.align 2, 0
	anim_0498:
		.4byte anim_data__0498_0
