

anim_data__0561_0:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB0F, 4
	.4byte	1, 0

	mAnimCmd4 

anim_data__0561_1:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB13, 4
	.4byte	1, 1

	mAnimCmd4 

anim_data__0561_2:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB17, 4
	.4byte	1, 2

	mAnimCmd4 

anim_data__0561_3:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB1B, 4
	.4byte	1, 3

	mAnimCmd4 

anim_data__0561_4:
	mGetPalette 0x63, 16, 0xB0
	.4byte	1, -1

	mJumpBack 0x5

anim_data__0561_5:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB1F, 2
	.4byte	1, 4

	mJumpBack 0x8

anim_data__0561_6:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1AB21, 4
	.4byte	1, 5

	mJumpBack 0x8


anim_0561:
	.4byte anim_data__0561_0
	.4byte anim_data__0561_1
	.4byte anim_data__0561_2
	.4byte anim_data__0561_3
	.4byte anim_data__0561_4
	.4byte anim_data__0561_5
	.4byte anim_data__0561_6
