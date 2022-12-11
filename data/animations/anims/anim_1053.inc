

anim_data__1053_0:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x276AB 24
	.4byte	1, 0

	mAnimCmd4 

anim_data__1053_1:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x276C3 36
	.4byte	1, 1

	mAnimCmd4 

anim_data__1053_2:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x276E7 42
	.4byte	1, 2

	mAnimCmd4 

anim_data__1053_3:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27711 36
	.4byte	1, 3

	mAnimCmd4 

anim_data__1053_4:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27735 20
	.4byte	1, 4

	mAnimCmd4 


anim_1053:
	.4byte anim_data__1053_0
	.4byte anim_data__1053_1
	.4byte anim_data__1053_2
	.4byte anim_data__1053_3
	.4byte anim_data__1053_4
