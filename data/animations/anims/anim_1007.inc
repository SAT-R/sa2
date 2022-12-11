

anim_data__1007_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26B89 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__1007_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26BB1 40
	.4byte	1, 1

	mAnimCmd4 

anim_data__1007_2:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26BD9 40
	.4byte	1, 2

	mAnimCmd4 

anim_data__1007_3:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26C01 40
	.4byte	1, 3

	mAnimCmd4 

anim_data__1007_4:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x26C29 28
	.4byte	1, 4

	mAnimCmd4 


anim_1007:
	.4byte anim_data__1007_0
	.4byte anim_data__1007_1
	.4byte anim_data__1007_2
	.4byte anim_data__1007_3
	.4byte anim_data__1007_4
