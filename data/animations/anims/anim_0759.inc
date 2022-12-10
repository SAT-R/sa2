

anim_data__0759_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x1F761 4
	.4byte	1, 0

	mAnimCmd4 

anim_data__0759_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x1F765 4
	.4byte	1, 1

	mAnimCmd4 

anim_data__0759_2:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x1F769 4
	.4byte	1, 2

	mAnimCmd4 

anim_data__0759_3:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1F76D 4
	.4byte	1, 3

	mAnimCmd4 

anim_data__0759_4:
	mGetPalette 0x9F 16 0x0
	mGetTiles 0x1F771 4
	.4byte	1, 4

	mAnimCmd4 


anim_0759:
	.4byte anim_data__0759_0
	.4byte anim_data__0759_1
	.4byte anim_data__0759_2
	.4byte anim_data__0759_3
	.4byte anim_data__0759_4
