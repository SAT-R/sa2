

anim_data__0050_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x2836 24
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	1, 0

	mAnimCmd4 

anim_data__0050_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x2836 24
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	5, 0

	mGetTiles 0x284E 20
	.4byte	4, 1

	mGetTiles 0x2862 30
	.4byte	3, 2

	mGetTiles 0x2880 25
	.4byte	2, 3

	mGetTiles 0x2899 20
	.4byte	2, 4

	mGetTiles 0x28AD 20
	.4byte	2, 5

	mGetTiles 0x28C1 24
	.4byte	2, 6

	mGetTiles 0x28D9 25
	.4byte	2, 7

	mGetTiles 0x28F2 20
	.4byte	3, 8

	mGetTiles 0x2906 20
	.4byte	3, 9

	mGetTiles 0x291A 20
	.4byte	3, 10

	mJumpBack 0xF


anim_0050:
	.4byte anim_data__0050_0
	.4byte anim_data__0050_1
