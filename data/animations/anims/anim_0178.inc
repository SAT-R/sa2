

anim_data__0178_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x93F6 30
	.4byte	1, 0

	mGetTiles 0x9414 25
	.4byte	1, 1

	mJumpBack 0xD

anim_data__0178_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x942D 16
	.4byte	1, 2

	mAnimCmd4 

anim_data__0178_2:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x943D 25
	.4byte	2, 3

	mGetTiles 0x9456 25
	.4byte	2, 4

	mJumpBack 0xD

anim_data__0178_3:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x946F 16
	.4byte	3, 5

	mAnimCmd4 


anim_0178:
	.4byte anim_data__0178_0
	.4byte anim_data__0178_1
	.4byte anim_data__0178_2
	.4byte anim_data__0178_3
