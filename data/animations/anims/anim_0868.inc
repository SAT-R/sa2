

anim_data__0868_0:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x234B8 46
	.4byte	1, 0

	mAnimCmd4 

anim_data__0868_1:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x234E6 20
	.4byte	1, 1

	mAnimCmd4 

anim_data__0868_2:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x234FA 20
	.4byte	1, 2

	mAnimCmd4 

anim_data__0868_3:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x2350E 16
	.4byte	1, 3

	mAnimCmd4 

anim_data__0868_4:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x2351E 28
	.4byte	1, 4

	mAnimCmd4 

anim_data__0868_5:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x2353A 20
	.4byte	1, 5

	mJumpBack 0x8

anim_data__0868_6:
	mGetPalette 0xE5 16 0x30
	mGetTiles 0x2354E 20
	.4byte	1, 6

	mAnimCmd4 

anim_data__0868_7:
	mGetPalette 0xE6 16 0x40
	mGetTiles 0x23562 40
	.4byte	1, 7

	mAnimCmd4 


anim_0868:
	.4byte anim_data__0868_0
	.4byte anim_data__0868_1
	.4byte anim_data__0868_2
	.4byte anim_data__0868_3
	.4byte anim_data__0868_4
	.4byte anim_data__0868_5
	.4byte anim_data__0868_6
	.4byte anim_data__0868_7
