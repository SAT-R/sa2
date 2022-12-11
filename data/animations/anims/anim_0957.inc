

anim_data__0957_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24DA4 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__0957_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24DCC 40
	.4byte	1, 1

	mAnimCmd4 

anim_data__0957_2:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24DF4 40
	.4byte	1, 2

	mAnimCmd4 

anim_data__0957_3:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24E1C 40
	.4byte	1, 3

	mAnimCmd4 

anim_data__0957_4:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x24E44 51
	.4byte	1, 4

	mAnimCmd4 

anim_data__0957_5:
	mGetPalette 0x2B3 16 0x0
	mGetTiles 0x24E77 63
	.4byte	1, 5

	mAnimCmd4 


anim_0957:
	.4byte anim_data__0957_0
	.4byte anim_data__0957_1
	.4byte anim_data__0957_2
	.4byte anim_data__0957_3
	.4byte anim_data__0957_4
	.4byte anim_data__0957_5
