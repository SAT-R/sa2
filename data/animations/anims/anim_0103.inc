

anim_data__0103_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5ED8, 16
	mAnimCmd6 0x0, 0x1006FCFA
	.4byte	3, 0

	mGetTiles 0x5EE8, 16
	.4byte	1, 1

	mGetTiles 0x5EF8, 16
	.4byte	1, 2

	mGetTiles 0x5F08, 12
	.4byte	1, 3

	mGetTiles 0x5EE8, 16
	.4byte	1, 1

	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5ED8, 16
	mAnimCmd6 0x0, 0x1006FCFA
	.4byte	1, 0

	mAnimCmd4 


anim_0103:
	.4byte anim_data__0103_0
