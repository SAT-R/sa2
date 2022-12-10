
.align 2, 0
	anim_data__0750_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F27E 12
		.4byte	6, 0

		mGetTiles 0x1F28A 12
		.4byte	6, 1

		mGetTiles 0x1F296 12
		.4byte	6, 2

		mGetTiles 0x1F2A2 12
		.4byte	6, 3

		mGetTiles 0x1F2AE 12
		.4byte	6, 4

		mGetTiles 0x1F2BA 12
		.4byte	6, 5

		mAnimCmd4 

	anim_data__0750_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F2BA 12
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0750:
		.4byte anim_data__0750_0
		.4byte anim_data__0750_1
