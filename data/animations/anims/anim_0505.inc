
.align 2, 0
	anim_data__0505_0:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19F6F 24
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	3, 0

		mGetTiles 0x19F87 24
		.4byte	3, 1

		mJumpBack 0x10

	anim_data__0505_1:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19F9F 16
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	4, 2

		mGetTiles 0x19FAF 16
		.4byte	4, 3

		mAnimCmd4 

	anim_data__0505_2:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19FBF 24
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	5, 4

		mGetTiles 0x19FD7 20
		.4byte	5, 5

		mGetTiles 0x19FEB 20
		.4byte	5, 6

		mGetTiles 0x19FFF 16
		.4byte	5, 7

		mGetTiles 0x1A00F 16
		.4byte	2, 8

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x1A02F 16
		.4byte	2, 10

		mGetTiles 0x1A00F 16
		.4byte	2, 8

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x1A02F 16
		.4byte	2, 10

		mGetTiles 0x1A03F 16
		.4byte	2, 11

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x19FFF 16
		.4byte	5, 7

		mGetTiles 0x19FEB 20
		.4byte	5, 6

		mGetTiles 0x19FD7 20
		.4byte	5, 5

		mGetTiles 0x19FBF 24
		.4byte	5, 4

		mAnimCmd4 


.align 2, 0
	anim_0505:
		.4byte anim_data__0505_0
		.4byte anim_data__0505_1
		.4byte anim_data__0505_2
