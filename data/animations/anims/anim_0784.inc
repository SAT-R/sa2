
.align 2, 0
	anim_data__0784_0:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x20773 24
		.4byte	6, 0

		mGetTiles 0x20773 24
		.4byte	8, 0

		mGetTiles 0x20773 24
		.4byte	8, 0

		mGetTiles 0x20773 24
		.4byte	12, 0

		mGetTiles 0x2078B 24
		.4byte	4, 1

		mGetTiles 0x207A3 24
		.4byte	14, 2

		mAnimCmd4 

	anim_data__0784_1:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x207BB 24
		.4byte	6, 3

		mGetTiles 0x207D3 24
		.4byte	6, 4

		mGetTiles 0x207EB 24
		.4byte	16, 5

		mAnimCmd4 

	anim_data__0784_2:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x20803 24
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0784:
		.4byte anim_data__0784_0
		.4byte anim_data__0784_1
		.4byte anim_data__0784_2
