
.align 2, 0
	anim_data__0689_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CDD1 4
		mAnimCmd6 0x0 0x404FCFC
		.4byte	1, 0

		mGetTiles 0x1CDD5 4
		.4byte	1, 1

		mGetTiles 0x1CDD9 4
		.4byte	1, 2

		mGetTiles 0x1CDDD 4
		.4byte	1, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0689:
		.4byte anim_data__0689_0
