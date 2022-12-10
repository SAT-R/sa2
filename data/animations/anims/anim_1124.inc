

anim_data__1124_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BAF0 26
	.4byte	1, 0

	mAnimCmd4 

anim_data__1124_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BB0A 26
	.4byte	1, 1

	mAnimCmd4 

anim_data__1124_2:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BB24 26
	.4byte	1, 2

	mAnimCmd4 


anim_1124:
	.4byte anim_data__1124_0
	.4byte anim_data__1124_1
	.4byte anim_data__1124_2
