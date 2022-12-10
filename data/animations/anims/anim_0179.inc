

anim_data__0179_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x947F 24
	.4byte	6, 0

	mGetTiles 0x9497 20
	.4byte	6, 1

	mGetTiles 0x94AB 16
	.4byte	6, 2

	mAnimCmd4 

anim_data__0179_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x94BB 20
	.4byte	6, 3

	mGetTiles 0x94CF 20
	.4byte	6, 4

	mGetTiles 0x94E3 24
	.4byte	6, 5

	mAnimCmd4 


anim_0179:
	.4byte anim_data__0179_0
	.4byte anim_data__0179_1
