

anim_data__0869_0:
	mGetPalette 0xE7 16 0x60
	mGetTiles 0x2358A 20
	.4byte	1, 0

	mAnimCmd4 

anim_data__0869_1:
	mGetPalette 0xE6 16 0x40
	mGetTiles 0x2359E 20
	.4byte	1, 1

	mAnimCmd4 

anim_data__0869_2:
	mGetPalette 0xE5 16 0x30
	.4byte	1, -1

	mAnimCmd4 

anim_data__0869_3:
	mGetPalette 0xE5 16 0x30
	.4byte	1, -1

	mAnimCmd4 

anim_data__0869_4:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x235B2 8
	.4byte	1, 2

	mAnimCmd4 

anim_data__0869_5:
	mGetPalette 0xE5 16 0x30
	.4byte	1, -1

	mAnimCmd4 


anim_0869:
	.4byte anim_data__0869_0
	.4byte anim_data__0869_1
	.4byte anim_data__0869_2
	.4byte anim_data__0869_3
	.4byte anim_data__0869_4
	.4byte anim_data__0869_5
