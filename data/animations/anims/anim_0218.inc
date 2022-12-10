
.align 2, 0
	anim_data__0218_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE26 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0218_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE3A 25
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0218_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE53 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0218_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE67 20
		.4byte	6, 3

		mGetTiles 0xBE7B 20
		.4byte	6, 4

		mGetTiles 0xBE8F 20
		.4byte	6, 5

		mGetTiles 0xBEA3 20
		.4byte	6, 6

		mGetTiles 0xBEB7 20
		.4byte	6, 7

		mAnimCmd4 


.align 2, 0
	anim_0218:
		.4byte anim_data__0218_0
		.4byte anim_data__0218_1
		.4byte anim_data__0218_2
		.4byte anim_data__0218_3
