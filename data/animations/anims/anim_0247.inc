
.align 2, 0
	anim_data__0247_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD6AB 24
		mAnimCmd6 0x0 0x806F2FA
		.4byte	2, 0

		mGetTiles 0xD6C3 30
		.4byte	2, 1

		mGetTiles 0xD6E1 36
		.4byte	2, 2

		mGetTiles 0xD705 36
		.4byte	2, 3

		mGetTiles 0xD729 24
		.4byte	2, 4

		mGetTiles 0xD741 30
		.4byte	2, 5

		mGetTiles 0xD75F 36
		.4byte	2, 6

		mGetTiles 0xD783 30
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0247_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD7A1 20
		mAnimCmd6 0x0 0x806F2FA
		.4byte	2, 8

		mGetTiles 0xD7B5 20
		.4byte	2, 9

		mGetTiles 0xD7C9 20
		.4byte	3, 10

		mGetTiles 0xD7DD 20
		.4byte	3, 11

		mGetTiles 0xD7F1 25
		.4byte	3, 12

		mAnimCmd4 

	anim_data__0247_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD80A 35
		mAnimCmd6 0x0 0xB08F2FA
		.4byte	3, 13

		mGetTiles 0xD82D 35
		.4byte	3, 14

		mGetTiles 0xD850 35
		.4byte	3, 15

		mJumpBack 0x15


.align 2, 0
	anim_0247:
		.4byte anim_data__0247_0
		.4byte anim_data__0247_1
		.4byte anim_data__0247_2
