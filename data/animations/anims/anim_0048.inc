
.align 2, 0
	anim_data__0048_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2550 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x2564 20
		.4byte	6, 1

		mGetTiles 0x2550 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0048_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2578 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 2

		mGetTiles 0x258C 20
		.4byte	1, 3

		mGetTiles 0x25A0 18
		.4byte	3, 4

		mGetTiles 0x25B2 18
		.4byte	3, 5

		mGetTiles 0x25C4 18
		.4byte	3, 6

		mJumpBack 0xF

	anim_data__0048_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x258C 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 3

		mGetTiles 0x2578 20
		.4byte	3, 2

		mGetTiles 0x25D6 20
		.4byte	3, 7

		mGetTiles 0x25EA 30
		.4byte	2, 8

		mGetTiles 0x2608 24
		.4byte	2, 9

		mGetTiles 0x2620 25
		.4byte	2, 10

		mJumpBack 0xF


.align 2, 0
	anim_0048:
		.4byte anim_data__0048_0
		.4byte anim_data__0048_1
		.4byte anim_data__0048_2
