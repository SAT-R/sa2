
.align 2, 0
	anim_data__0337_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1201D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x12031 24
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x12049 28
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x12065 20
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x12079 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mGetTiles 0x1208D 24
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	2, 5

		mGetTiles 0x120A5 40
		mAnimCmd6 0x0 0xFF1FE113
		.4byte	4, 6

		mGetTiles 0x120CD 25
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	3, 7

		mGetTiles 0x1201D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x12031 24
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x12049 28
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x12065 20
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x12079 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0337:
		.4byte anim_data__0337_0
