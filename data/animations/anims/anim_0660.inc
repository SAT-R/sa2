
.align 2, 0
	anim_data__0660_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C7C1 18
		.4byte	4, 0

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7C1 18
		.4byte	4, 0

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7F7 15
		.4byte	4, 3

		mGetTiles 0x1C806 9
		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0660:
		.4byte anim_data__0660_0
