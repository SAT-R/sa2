

anim_data__1121_0:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B97E 24
	.4byte	1, 0

	mAnimCmd4 

anim_data__1121_1:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B996 24
	.4byte	1, 1

	mAnimCmd4 

anim_data__1121_2:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B9AE 27
	.4byte	1, 2

	mAnimCmd4 

anim_data__1121_3:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B9C9 18
	.4byte	1, 3

	mAnimCmd4 

anim_data__1121_4:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B9DB 27
	.4byte	1, 4

	mAnimCmd4 


anim_1121:
	.4byte anim_data__1121_0
	.4byte anim_data__1121_1
	.4byte anim_data__1121_2
	.4byte anim_data__1121_3
	.4byte anim_data__1121_4
