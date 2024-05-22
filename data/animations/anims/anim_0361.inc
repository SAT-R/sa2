

anim_data__0361_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12FD1, 16
	.4byte	6, 0

	mGetTiles 0x12FE1, 20
	.4byte	6, 1

	mGetTiles 0x12FF5, 20
	.4byte	6, 2

	mAnimCmd4 

anim_data__0361_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x13009, 25
	.4byte	6, 3

	mGetTiles 0x13022, 25
	.4byte	6, 4

	mGetTiles 0x1303B, 30
	.4byte	6, 5

	mAnimCmd4 


anim_0361:
	.4byte anim_data__0361_0
	.4byte anim_data__0361_1
