

anim_data__0773_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0x1FDD2, 20
	.4byte	4, 0

	mGetTiles 0x1FDE6, 20
	.4byte	4, 1

	mGetTiles 0x1FDFA, 30
	.4byte	8, 2

	mGetTiles 0x1FE18, 20
	.4byte	40, 3

	mAnimCmd4 


anim_0773:
	.4byte anim_data__0773_0
