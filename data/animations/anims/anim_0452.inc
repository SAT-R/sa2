

anim_data__0452_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x17BF8, 16
	.4byte	6, 0

	mGetTiles 0x17C08, 24
	.4byte	6, 1

	mGetTiles 0x17C20, 20
	.4byte	6, 2

	mAnimCmd4 

anim_data__0452_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x17C34, 16
	.4byte	6, 3

	mGetTiles 0x17C44, 20
	.4byte	6, 4

	mGetTiles 0x17C58, 25
	.4byte	6, 5

	mAnimCmd4 


anim_0452:
	.4byte anim_data__0452_0
	.4byte anim_data__0452_1
