

anim_data__0222_0:
	mGetPalette 0xF 16 0x20
	mGetTiles 0xBECB 30
	.4byte	3, 0

	mGetTiles 0xBEE9 30
	.4byte	3, 1

	mGetTiles 0xBF07 30
	.4byte	3, 2

	mGetTiles 0xBF25 30
	.4byte	3, 3

	mJumpBack 0x17

anim_data__0222_1:
	mGetPalette 0xF 16 0x20
	mGetTiles 0xBF43 25
	.4byte	1, 4

	mAnimCmd4 


anim_0222:
	.4byte anim_data__0222_0
	.4byte anim_data__0222_1
