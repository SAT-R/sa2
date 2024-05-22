

anim_data__0995_0:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x267FF, 50
	.4byte	1, 0

	mAnimCmd4 

anim_data__0995_1:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x26831, 20
	.4byte	1, 1

	mAnimCmd4 


anim_0995:
	.4byte anim_data__0995_0
	.4byte anim_data__0995_1
