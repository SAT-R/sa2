

anim_data__0984_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x2639A 18
	.4byte	1, 0

	mAnimCmd4 

anim_data__0984_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x263AC 18
	.4byte	1, 1

	mAnimCmd4 

anim_data__0984_2:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x263BE 18
	.4byte	1, 2

	mAnimCmd4 

anim_data__0984_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x263D0 46
	.4byte	1, 3

	mAnimCmd4 

anim_data__0984_4:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x263FE 15
	.4byte	1, 4

	mAnimCmd4 


anim_0984:
	.4byte anim_data__0984_0
	.4byte anim_data__0984_1
	.4byte anim_data__0984_2
	.4byte anim_data__0984_3
	.4byte anim_data__0984_4
