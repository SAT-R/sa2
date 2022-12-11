

anim_data__0690_0:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CDE1 12
	mAnimCmd6 0x0 0x618FAE8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0690_1:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CDED 12
	.4byte	1, 1

	mAnimCmd4 

anim_data__0690_2:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CDE1 12
	mAnimCmd6 0x0 0x618FAE8
	.4byte	2, 0

	mGetTiles 0x1CDED 12
	.4byte	4, 1

	mJumpBack 0x10

anim_data__0690_3:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CDF9 18
	mAnimCmd6 0x0 0x618F0E8
	.4byte	5, 2

	mGetTiles 0x1CE0B 24
	.4byte	3, 3

	mGetTiles 0x1CE23 24
	.4byte	5, 4

	mAnimCmd4 

anim_data__0690_4:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CE3B 64
	.4byte	1, 5

	mAnimCmd4 


anim_0690:
	.4byte anim_data__0690_0
	.4byte anim_data__0690_1
	.4byte anim_data__0690_2
	.4byte anim_data__0690_3
	.4byte anim_data__0690_4
