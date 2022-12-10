
.align 2, 0
	anim_data__0166_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x914D 64
		mAnimCmd6 0x0 0x1206FEFA
		.4byte	2, 0

		mGetTiles 0x918D 64
		.4byte	2, 1

		mGetTiles 0x91CD 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0166:
		.4byte anim_data__0166_0
