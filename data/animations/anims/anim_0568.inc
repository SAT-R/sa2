

anim_data__0568_0:
	mGetPalette 0x65 16 0x70
	mGetTiles 0x1ABEA 20
	mAnimCmd6 0x0 0x130EF0F2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0568_1:
	mGetPalette 0x65 16 0x70
	mGetTiles 0x1ABEA 20
	mAnimCmd6 0x0 0x130EF0F2
	.4byte	1, 0

	mGetTiles 0x1ABFE 20
	.4byte	2, 1

	mGetTiles 0x1AC12 28
	.4byte	1, 2

	mGetTiles 0x1AC2E 24
	.4byte	5, 3

	mGetTiles 0x1AC46 28
	.4byte	3, 4

	mAnimCmd4 

anim_data__0568_2:
	mGetPalette 0x65 16 0x70
	mGetTiles 0x1AC62 20
	mAnimCmd6 0x0 0x130EF0F2
	.4byte	1, 5

	mAnimCmd4 

anim_data__0568_3:
	mGetPalette 0x65 16 0x70
	mGetTiles 0x1AC62 20
	mAnimCmd6 0x0 0x130EF0F2
	.4byte	1, 5

	mGetTiles 0x1AC76 20
	.4byte	2, 6

	mGetTiles 0x1AC8A 28
	.4byte	1, 7

	mGetTiles 0x1ACA6 24
	.4byte	5, 8

	mGetTiles 0x1ACBE 28
	.4byte	3, 9

	mAnimCmd4 


anim_0568:
	.4byte anim_data__0568_0
	.4byte anim_data__0568_1
	.4byte anim_data__0568_2
	.4byte anim_data__0568_3
