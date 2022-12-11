

anim_data__0980_0:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x261DA 18
	.4byte	1, 0

	mAnimCmd4 

anim_data__0980_1:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x261EC 18
	.4byte	1, 1

	mAnimCmd4 

anim_data__0980_2:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x261FE 18
	.4byte	1, 2

	mAnimCmd4 

anim_data__0980_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x26210 38
	.4byte	1, 3

	mAnimCmd4 

anim_data__0980_4:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26236 17
	.4byte	1, 4

	mAnimCmd4 


anim_0980:
	.4byte anim_data__0980_0
	.4byte anim_data__0980_1
	.4byte anim_data__0980_2
	.4byte anim_data__0980_3
	.4byte anim_data__0980_4
