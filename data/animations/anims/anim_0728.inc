

anim_data__0728_0:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9DD 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0728_1:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9DF 2
	.4byte	1, 1

	mAnimCmd4 

anim_data__0728_2:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9E1 2
	.4byte	1, 2

	mAnimCmd4 

anim_data__0728_3:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9E3 2
	.4byte	1, 3

	mAnimCmd4 

anim_data__0728_4:
	mGetPalette 0xA1 16 0x60
	mGetTiles 0x1D9E5 2
	.4byte	1, 4

	mAnimCmd4 


anim_0728:
	.4byte anim_data__0728_0
	.4byte anim_data__0728_1
	.4byte anim_data__0728_2
	.4byte anim_data__0728_3
	.4byte anim_data__0728_4
