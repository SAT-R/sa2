

anim_data__0707_0:
	mGetTiles 0x1D5EC, 32
	mGetPalette 0x9A, 16, 0x80
	.4byte	2, 0

	.4byte	2, 1

	.4byte	2, 2

	.4byte	2, 3

	.4byte	2, 4

	.4byte	2, 5

	.4byte	2, 6

	.4byte	2, 7

	mAnimCmd4 


anim_0707:
	.4byte anim_data__0707_0
