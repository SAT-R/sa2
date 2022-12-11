

anim_data__0895_0:
	mGetPalette 0xB2 16 0xC0
	mGetTiles 0x243E9 9
	.4byte	1, 0

	mAnimCmd4 

anim_data__0895_1:
	mGetPalette 0xB2 16 0xC0
	mGetTiles 0x243F2 9
	.4byte	1, 1

	mAnimCmd4 

anim_data__0895_2:
	mGetPalette 0xB3 16 0xD0
	mGetTiles 0x243FB 9
	.4byte	1, 2

	mAnimCmd4 

anim_data__0895_3:
	mGetPalette 0xB3 16 0xD0
	mGetTiles 0x24404 9
	.4byte	1, 3

	mAnimCmd4 

anim_data__0895_4:
	mGetPalette 0xB4 16 0xE0
	mGetTiles 0x2440D 9
	.4byte	1, 4

	mAnimCmd4 

anim_data__0895_5:
	mGetPalette 0xB4 16 0xE0
	mGetTiles 0x24416 9
	.4byte	1, 5

	mAnimCmd4 

anim_data__0895_6:
	mGetPalette 0xEF 16 0x20
	mGetTiles 0x2441F 9
	.4byte	1, 6

	mAnimCmd4 

anim_data__0895_7:
	mGetPalette 0xEF 16 0x20
	mGetTiles 0x24428 9
	.4byte	1, 7

	mAnimCmd4 

anim_data__0895_8:
	mGetPalette 0xEF 16 0x20
	mGetTiles 0x24431 9
	.4byte	3, 8

	mGetTiles 0x2443A 9
	.4byte	3, 9

	mGetTiles 0x24443 9
	.4byte	2, 10

	mGetTiles 0x24428 9
	.4byte	2, 7

	mGetTiles 0x2444C 9
	.4byte	2, 11

	mAnimCmd4 


anim_0895:
	.4byte anim_data__0895_0
	.4byte anim_data__0895_1
	.4byte anim_data__0895_2
	.4byte anim_data__0895_3
	.4byte anim_data__0895_4
	.4byte anim_data__0895_5
	.4byte anim_data__0895_6
	.4byte anim_data__0895_7
	.4byte anim_data__0895_8
