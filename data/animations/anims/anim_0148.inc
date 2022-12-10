
.align 2, 0
	anim_data__0148_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x818B 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0148_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x819F 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0148_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81B3 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0148_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81C7 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0148_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81DB 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0148_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81EF 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0148_6:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8203 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0148_7:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8217 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 7

		mAnimCmd4 


.align 2, 0
	anim_0148:
		.4byte anim_data__0148_0
		.4byte anim_data__0148_1
		.4byte anim_data__0148_2
		.4byte anim_data__0148_3
		.4byte anim_data__0148_4
		.4byte anim_data__0148_5
		.4byte anim_data__0148_6
		.4byte anim_data__0148_7
