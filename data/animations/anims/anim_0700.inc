

anim_data__0700_0:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D1A8 4
	mAnimCmd6 0x0 0x202FEFE
	.4byte	1, 0

	mAnimCmd4 

anim_data__0700_1:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D1AC 4
	.4byte	1, 1

	mAnimCmd4 

anim_data__0700_2:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D1B0 4
	.4byte	1, 2

	mAnimCmd4 

anim_data__0700_3:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D1B4 4
	.4byte	1, 3

	mAnimCmd4 

anim_data__0700_4:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D1B8 4
	.4byte	1, 4

	mAnimCmd4 


anim_0700:
	.4byte anim_data__0700_0
	.4byte anim_data__0700_1
	.4byte anim_data__0700_2
	.4byte anim_data__0700_3
	.4byte anim_data__0700_4
