

anim_data__0421_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16815, 16
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 0

	mAnimCmd4 

anim_data__0421_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16825, 16
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 1

	mAnimCmd4 

anim_data__0421_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16835, 16
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 2

	mAnimCmd4 

anim_data__0421_3:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16845, 20
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 3

	mAnimCmd4 

anim_data__0421_4:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16859, 20
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 4

	mAnimCmd4 

anim_data__0421_5:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1686D, 16
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 5

	mAnimCmd4 

anim_data__0421_6:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1687D, 16
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 6

	mAnimCmd4 

anim_data__0421_7:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1688D, 20
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	1, 7

	mAnimCmd4 


anim_0421:
	.4byte anim_data__0421_0
	.4byte anim_data__0421_1
	.4byte anim_data__0421_2
	.4byte anim_data__0421_3
	.4byte anim_data__0421_4
	.4byte anim_data__0421_5
	.4byte anim_data__0421_6
	.4byte anim_data__0421_7
