

anim_data__0749_0:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F260, 6
	.4byte	6, 0

	mGetTiles 0x1F266, 6
	.4byte	6, 1

	mGetTiles 0x1F26C, 6
	.4byte	6, 2

	mGetTiles 0x1F272, 6
	.4byte	6, 3

	mGetTiles 0x1F278, 6
	.4byte	6, 4

	mAnimCmd4 

anim_data__0749_1:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F278, 6
	.4byte	1, 4

	mAnimCmd4 


anim_0749:
	.4byte anim_data__0749_0
	.4byte anim_data__0749_1
