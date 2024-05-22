

anim_data__0760_0:
	mGetPalette 0xB1, 16, 0xE0
	mGetTiles 0x1F775, 9
	.4byte	1, 0

	mAnimCmd4 

anim_data__0760_1:
	mGetPalette 0xB2, 16, 0xD0
	mGetTiles 0x1F77E, 9
	.4byte	1, 1

	mAnimCmd4 

anim_data__0760_2:
	mGetPalette 0xB2, 16, 0xD0
	mGetTiles 0x1F787, 9
	.4byte	1, 2

	mAnimCmd4 

anim_data__0760_3:
	mGetPalette 0xB3, 16, 0xC0
	mGetTiles 0x1F790, 9
	.4byte	1, 3

	mAnimCmd4 

anim_data__0760_4:
	mGetPalette 0xB3, 16, 0xC0
	mGetTiles 0x1F799, 9
	.4byte	1, 4

	mAnimCmd4 

anim_data__0760_5:
	mGetPalette 0xB4, 16, 0xB0
	mGetTiles 0x1F7A2, 9
	.4byte	1, 5

	mAnimCmd4 

anim_data__0760_6:
	mGetPalette 0xB4, 16, 0xB0
	mGetTiles 0x1F7AB, 9
	.4byte	1, 6

	mAnimCmd4 

anim_data__0760_7:
	mGetPalette 0xB1, 16, 0xE0
	mGetTiles 0x1F7B4, 9
	.4byte	1, 7

	mAnimCmd4 


anim_0760:
	.4byte anim_data__0760_0
	.4byte anim_data__0760_1
	.4byte anim_data__0760_2
	.4byte anim_data__0760_3
	.4byte anim_data__0760_4
	.4byte anim_data__0760_5
	.4byte anim_data__0760_6
	.4byte anim_data__0760_7
