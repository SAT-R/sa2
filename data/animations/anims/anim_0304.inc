

anim_data__0304_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10486, 25
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	3, 0

	mGetTiles 0x1049F, 25
	.4byte	3, 1

	mAnimCmd4 

anim_data__0304_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x104B8, 25
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	2, 2

	mGetTiles 0x104D1, 25
	.4byte	2, 3

	mGetTiles 0x104EA, 25
	.4byte	2, 4

	mGetTiles 0x10503, 30
	.4byte	2, 5

	mJumpBack 0x1A

anim_data__0304_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10521, 25
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	2, 6

	mGetTiles 0x1053A, 20
	.4byte	2, 7

	mGetTiles 0x1054E, 20
	.4byte	4, 8

	mAnimCmd4 


anim_0304:
	.4byte anim_data__0304_0
	.4byte anim_data__0304_1
	.4byte anim_data__0304_2
