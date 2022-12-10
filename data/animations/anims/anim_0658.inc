
.align 2, 0
	anim_data__0658_0:
		mGetTiles 0x1C79B 8
		mGetPalette 0x8B 16 0x80
		mAnimCmd6 0x0 0x202FEFE
		.4byte	4, 0

		mAnimCmd6 0x0 0x404FCFC
		.4byte	4, 1

		mJumpBack 0xD


.align 2, 0
	anim_0658:
		.4byte anim_data__0658_0
