

anim_data__0857_0:
	mGetPalette 0x2 16 0x50
	mGetTiles 0x23349 2
	.4byte	3, 0

	mGetTiles 0x2334B 8
	.4byte	3, 1

	mGetTiles 0x23353 8
	.4byte	3, 2

	mGetTiles 0x2335B 4
	.4byte	3, 3

	mGetTiles 0x2335F 4
	.4byte	3, 4

	mAnimCmd4 


anim_0857:
	.4byte anim_data__0857_0
