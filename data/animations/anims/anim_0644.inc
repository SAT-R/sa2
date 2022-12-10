
.align 2, 0
	anim_data__0644_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C2CA 16
		.4byte	4, 0

		mGetTiles 0x1C2DA 16
		.4byte	4, 1

		mGetTiles 0x1C2EA 16
		.4byte	4, 2

		mGetTiles 0x1C2FA 16
		.4byte	4, 3

		mJumpBack 0x17


.align 2, 0
	anim_0644:
		.4byte anim_data__0644_0
