
.align 2, 0
	anim_data__0975_0:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25984 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0975_1:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x259B6 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0975_2:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x259E8 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0975_3:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A1A 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0975_4:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A4C 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0975_5:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A7E 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0975_6:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25AB0 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0975_7:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25AE2 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0975_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x25B14 26
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_0975:
		.4byte anim_data__0975_0
		.4byte anim_data__0975_1
		.4byte anim_data__0975_2
		.4byte anim_data__0975_3
		.4byte anim_data__0975_4
		.4byte anim_data__0975_5
		.4byte anim_data__0975_6
		.4byte anim_data__0975_7
		.4byte anim_data__0975_8
