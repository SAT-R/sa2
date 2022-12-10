
.align 2, 0
	anim_data__0328_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11746 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0x11786 64
		.4byte	2, 1

		mJumpBack 0x10


.align 2, 0
	anim_0328:
		.4byte anim_data__0328_0
