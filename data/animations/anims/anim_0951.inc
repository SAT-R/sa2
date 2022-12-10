

anim_data__0951_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24540 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0951_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24550 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0951_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x24560 54
	.4byte	1, 2

	mAnimCmd4 

anim_data__0951_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x24596 39
	.4byte	1, 3

	mAnimCmd4 


anim_0951:
	.4byte anim_data__0951_0
	.4byte anim_data__0951_1
	.4byte anim_data__0951_2
	.4byte anim_data__0951_3
