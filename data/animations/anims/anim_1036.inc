

anim_data__1036_0:
	mGetPalette 0x2C4, 16, 0x20
	mGetTiles 0x27273, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__1036_1:
	mGetPalette 0x2C4, 16, 0x20
	mGetTiles 0x2727B, 12
	.4byte	1, 1

	mAnimCmd4 


anim_1036:
	.4byte anim_data__1036_0
	.4byte anim_data__1036_1
