
.align 2, 0
	anim_data__0615_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA60 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0615_1:
		mGetPalette 0x7F 16 0xB0
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0615_2:
		mGetPalette 0x7F 16 0xB0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0615:
		.4byte anim_data__0615_0
		.4byte anim_data__0615_1
		.4byte anim_data__0615_2
