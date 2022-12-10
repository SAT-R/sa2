
.align 2, 0
	anim_data__0368_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x135AC 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mJumpBack 0x59


.align 2, 0
	anim_0368:
		.4byte anim_data__0368_0
