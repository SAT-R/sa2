

anim_data__1122_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2B9F6 28
	.4byte	1, 0

	mAnimCmd4 

anim_data__1122_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2BA12 36
	.4byte	1, 1

	mAnimCmd4 


anim_1122:
	.4byte anim_data__1122_0
	.4byte anim_data__1122_1
