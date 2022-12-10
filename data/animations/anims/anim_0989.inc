

anim_data__0989_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x2663A 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0989_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x2664A 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0989_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x2665A 60
	.4byte	1, 2

	mAnimCmd4 

anim_data__0989_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x26696 22
	.4byte	1, 3

	mAnimCmd4 


anim_0989:
	.4byte anim_data__0989_0
	.4byte anim_data__0989_1
	.4byte anim_data__0989_2
	.4byte anim_data__0989_3
