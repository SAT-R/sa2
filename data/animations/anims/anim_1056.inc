

anim_data__1056_0:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27883 20
	.4byte	1, 0

	mAnimCmd4 

anim_data__1056_1:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27897 44
	.4byte	1, 1

	mAnimCmd4 

anim_data__1056_2:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x278C3 40
	.4byte	1, 2

	mAnimCmd4 

anim_data__1056_3:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x278EB 28
	.4byte	1, 3

	mAnimCmd4 

anim_data__1056_4:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27907 12
	.4byte	1, 4

	mAnimCmd4 


anim_1056:
	.4byte anim_data__1056_0
	.4byte anim_data__1056_1
	.4byte anim_data__1056_2
	.4byte anim_data__1056_3
	.4byte anim_data__1056_4
