

anim_data__0985_0:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x2640D 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0985_1:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x2641D 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0985_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x2642D 46
	.4byte	1, 2

	mAnimCmd4 

anim_data__0985_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x2645B 38
	.4byte	1, 3

	mAnimCmd4 


anim_0985:
	.4byte anim_data__0985_0
	.4byte anim_data__0985_1
	.4byte anim_data__0985_2
	.4byte anim_data__0985_3
