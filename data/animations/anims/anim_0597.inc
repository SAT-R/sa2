

anim_data__0597_0:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B5D6 18
	mAnimCmd6 0x0 0xFC18F6E8
	.4byte	10, 0

	mGetTiles 0x1B5E8 18
	.4byte	10, 1

	mGetTiles 0x1B5FA 18
	.4byte	10, 2

	mGetTiles 0x1B60C 18
	.4byte	10, 3

	mGetTiles 0x1B61E 18
	.4byte	10, 4

	mGetTiles 0x1B630 18
	.4byte	10, 5

	mJumpBack 0x24

anim_data__0597_1:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B642 24
	mAnimCmd6 0x0 0x1018F0E8
	.4byte	1, 6

	mAnimCmd4 

anim_data__0597_2:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B65A 36
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	1, 7

	mAnimCmd4 


anim_0597:
	.4byte anim_data__0597_0
	.4byte anim_data__0597_1
	.4byte anim_data__0597_2
