

anim_data__0366_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1352C 16
	mAnimCmd6 0x0 0x1006FAFA
	.4byte	1, 0

	mGetTiles 0x1353C 16
	.4byte	1, 1

	mGetTiles 0x1354C 16
	.4byte	1, 2

	mAnimCmd4 

anim_data__0366_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1355C 16
	mAnimCmd6 0x0 0x1006FAFA
	.4byte	1, 3

	mGetTiles 0x1356C 16
	.4byte	1, 4

	mAnimCmd4 


anim_0366:
	.4byte anim_data__0366_0
	.4byte anim_data__0366_1
