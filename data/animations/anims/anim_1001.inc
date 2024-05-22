

anim_data__1001_0:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x2693B, 28
	.4byte	1, 0

	mAnimCmd4 

anim_data__1001_1:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x26957, 28
	.4byte	1, 1

	mAnimCmd4 


anim_1001:
	.4byte anim_data__1001_0
	.4byte anim_data__1001_1
