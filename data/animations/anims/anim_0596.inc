

anim_data__0596_0:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4B6 42
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 0

	mGetTiles 0x1B4E0 42
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 1

	mJumpBack 0x13

anim_data__0596_1:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B50A 18
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 2

	mGetTiles 0x1B51C 18
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 3

	mJumpBack 0x13

anim_data__0596_2:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4B6 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 0

	mAnimCmd4 

anim_data__0596_3:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4E0 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 1

	mAnimCmd4 

anim_data__0596_4:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B52E 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 4

	mAnimCmd4 

anim_data__0596_5:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B558 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 5

	mAnimCmd4 

anim_data__0596_6:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B582 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 6

	mAnimCmd4 

anim_data__0596_7:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B5AC 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 7

	mAnimCmd4 

anim_data__0596_8:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B50A 18
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 2

	mAnimCmd4 

anim_data__0596_9:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B51C 18
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 3

	mAnimCmd4 


anim_0596:
	.4byte anim_data__0596_0
	.4byte anim_data__0596_1
	.4byte anim_data__0596_2
	.4byte anim_data__0596_3
	.4byte anim_data__0596_4
	.4byte anim_data__0596_5
	.4byte anim_data__0596_6
	.4byte anim_data__0596_7
	.4byte anim_data__0596_8
	.4byte anim_data__0596_9
