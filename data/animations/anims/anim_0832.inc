
.align 2, 0
	anim_data__0832_0:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220E9 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0832_1:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220ED 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0832_2:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FD 1
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0832_3:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FE 1
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0832_4:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FF 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0832_5:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x22103 16
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0832_6:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x22113 64
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0832:
		.4byte anim_data__0832_0
		.4byte anim_data__0832_1
		.4byte anim_data__0832_2
		.4byte anim_data__0832_3
		.4byte anim_data__0832_4
		.4byte anim_data__0832_5
		.4byte anim_data__0832_6
