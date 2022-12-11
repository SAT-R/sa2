

anim_data__0176_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x920D 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0176_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x921D 16
	.4byte	1, 1

	mAnimCmd4 


anim_0176:
	.4byte anim_data__0176_0
	.4byte anim_data__0176_1
