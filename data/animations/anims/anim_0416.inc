

anim_data__0416_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x161B2, 18
	mAnimCmd6 0x0, 0x806EEFA
	.4byte	3, 0

	mGetTiles 0x161C4, 18
	.4byte	3, 1

	mGetTiles 0x161D6, 18
	.4byte	3, 2

	mJumpBack 0x15

anim_data__0416_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x161E8, 20
	mAnimCmd6 0x0, 0x806EEFA
	.4byte	3, 3

	mGetTiles 0x161FC, 20
	.4byte	3, 4

	mGetTiles 0x16210, 20
	.4byte	3, 5

	mGetTiles 0x16224, 20
	.4byte	4, 6

	mGetTiles 0x16238, 20
	.4byte	4, 7

	mGetTiles 0x1624C, 25
	.4byte	4, 8

	mAnimCmd4 

anim_data__0416_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16265, 24
	mAnimCmd6 0x0, 0x806EEFA
	.4byte	3, 9

	mGetTiles 0x1627D, 24
	.4byte	3, 10

	mGetTiles 0x16295, 24
	.4byte	3, 11

	mJumpBack 0x15


anim_0416:
	.4byte anim_data__0416_0
	.4byte anim_data__0416_1
	.4byte anim_data__0416_2
