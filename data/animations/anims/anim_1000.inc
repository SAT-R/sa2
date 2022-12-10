

anim_data__1000_0:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26903 32
	.4byte	1, 0

	mAnimCmd4 

anim_data__1000_1:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26923 24
	.4byte	1, 1

	mAnimCmd4 


anim_1000:
	.4byte anim_data__1000_0
	.4byte anim_data__1000_1
