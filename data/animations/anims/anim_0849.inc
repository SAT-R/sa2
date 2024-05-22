

anim_data__0849_0:
	mGetPalette 0xE3, 16, 0x70
	mGetTiles 0x22F7D, 12
	.4byte	1, 0

	mGetTiles 0x22F89, 12
	.4byte	1, 1

	mGetTiles 0x22F95, 12
	.4byte	2, 2

	mGetTiles 0x22FA1, 12
	.4byte	2, 3

	mGetTiles 0x22FAD, 20
	.4byte	2, 4

	mGetTiles 0x22FC1, 15
	.4byte	2, 5

	mGetTiles 0x22FD0, 15
	.4byte	2, 6

	mGetTiles 0x22FDF, 6
	.4byte	2, 7

	mAnimCmd4 


anim_0849:
	.4byte anim_data__0849_0
