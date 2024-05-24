

anim_data__0961_0:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x24FA6, 48
	.4byte	1, 0

	mAnimCmd4 

anim_data__0961_1:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24FD6, 28
	.4byte	1, 1

	mAnimCmd4 


anim_0961:
	.4byte anim_data__0961_0
	.4byte anim_data__0961_1
