

anim_data__0705_0:
	mGetPalette 0x9C 16 0x80
	mGetTiles 0x1D46B 64
	mAnimCmd6 0x0 0x1112EFF0
	.4byte	1, 0

	mAnimCmd4 

anim_data__0705_1:
	mGetPalette 0x9C 16 0x80
	mGetTiles 0x1D46B 64
	mAnimCmd6 0x0 0x1112EFF0
	.4byte	3, 0

	mGetTiles 0x1D4AB 64
	.4byte	3, 1

	mGetTiles 0x1D4EB 64
	.4byte	3, 2

	mGetTiles 0x1D4AB 64
	.4byte	3, 1

	mGetTiles 0x1D46B 64
	mAnimCmd6 0x0 0xFA10EEF0
	.4byte	3, 0

	mAnimCmd4 

anim_data__0705_2:
	mGetPalette 0x9C 16 0x80
	mGetTiles 0x1D52B 64
	.4byte	1, 3

	mAnimCmd4 

anim_data__0705_3:
	mGetPalette 0x9C 16 0x80
	mGetTiles 0x1D56B 64
	.4byte	2, 4

	mGetTiles 0x1D5AB 64
	.4byte	2, 5

	mJumpBack 0xD


anim_0705:
	.4byte anim_data__0705_0
	.4byte anim_data__0705_1
	.4byte anim_data__0705_2
	.4byte anim_data__0705_3
