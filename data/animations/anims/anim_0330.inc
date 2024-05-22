

anim_data__0330_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x117C6, 25
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 0

	mAnimCmd4 

anim_data__0330_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x117DF, 16
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 1

	mAnimCmd4 

anim_data__0330_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x117EF, 16
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 2

	mAnimCmd4 

anim_data__0330_3:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x117FF, 25
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 3

	mAnimCmd4 

anim_data__0330_4:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x11818, 24
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 4

	mAnimCmd4 

anim_data__0330_5:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x11830, 20
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 5

	mAnimCmd4 

anim_data__0330_6:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x11844, 16
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 6

	mAnimCmd4 

anim_data__0330_7:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x11854, 25
	mAnimCmd6 0x0, 0xE06F2FA
	.4byte	1, 7

	mAnimCmd4 


anim_0330:
	.4byte anim_data__0330_0
	.4byte anim_data__0330_1
	.4byte anim_data__0330_2
	.4byte anim_data__0330_3
	.4byte anim_data__0330_4
	.4byte anim_data__0330_5
	.4byte anim_data__0330_6
	.4byte anim_data__0330_7
