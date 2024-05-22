

anim_data__0454_0:
	mGetPalette 0x26, 16, 0x0
	mGetTiles 0x17CD1, 20
	.4byte	2, 0

	mGetTiles 0x17CE5, 15
	.4byte	2, 1

	mGetTiles 0x17CF4, 15
	.4byte	2, 2

	mGetTiles 0x17D03, 15
	.4byte	2, 3

	mGetTiles 0x17D12, 15
	.4byte	3, 4

	mGetTiles 0x17D21, 20
	.4byte	3, 5

	mGetTiles 0x17D35, 15
	.4byte	3, 6

	mGetTiles 0x17D44, 15
	.4byte	3, 7

	mGetTiles 0x17D53, 15
	.4byte	3, 8

	mGetTiles 0x17D62, 15
	.4byte	3, 9

	mGetTiles 0x17D71, 20
	.4byte	3, 10

	mAnimCmd4 


anim_0454:
	.4byte anim_data__0454_0
