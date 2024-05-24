

anim_data__0019_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1916, 16
	mAnimCmd6 0x0, 0x1206F4FA
	.4byte	2, 0

	mGetTiles 0x1926, 16
	.4byte	2, 1

	mGetTiles 0x1936, 16
	.4byte	2, 2

	mGetTiles 0x1946, 16
	.4byte	2, 3

	mGetTiles 0x1956, 20
	mAnimCmd6 0x0, 0x1006F2F8
	.4byte	2, 4

	mGetTiles 0x196A, 24
	.4byte	2, 5

	mGetTiles 0x1982, 20
	.4byte	2, 6

	mJumpBack 0x12

anim_data__0019_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1996, 25
	mAnimCmd6 0x0, 0xC06F4FA
	.4byte	2, 7

	mGetTiles 0x19AF, 25
	.4byte	2, 8

	mJumpBack 0x10

anim_data__0019_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x19C8, 25
	mAnimCmd6 0x0, 0xC06F4FA
	.4byte	2, 9

	mAnimCmd4 


anim_0019:
	.4byte anim_data__0019_0
	.4byte anim_data__0019_1
	.4byte anim_data__0019_2
