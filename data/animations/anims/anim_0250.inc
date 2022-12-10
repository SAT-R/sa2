
.align 2, 0
	anim_data__0250_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDA92 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0250_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAAB 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0250_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAC4 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0250_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDADC 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0250_4:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAF4 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0250_5:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB08 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0250_6:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB21 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0250_7:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB35 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0250_8:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB4D 35
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0250_9:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB70 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0250_10:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB84 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 10

		mAnimCmd4 


.align 2, 0
	anim_0250:
		.4byte anim_data__0250_0
		.4byte anim_data__0250_1
		.4byte anim_data__0250_2
		.4byte anim_data__0250_3
		.4byte anim_data__0250_4
		.4byte anim_data__0250_5
		.4byte anim_data__0250_6
		.4byte anim_data__0250_7
		.4byte anim_data__0250_8
		.4byte anim_data__0250_9
		.4byte anim_data__0250_10
