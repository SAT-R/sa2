

anim_data__0959_0:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x24ED2, 66
	.4byte	1, 0

	mAnimCmd4 

anim_data__0959_1:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24F14, 36
	.4byte	1, 1

	mAnimCmd4 

anim_data__0959_2:
	mGetPalette 0x2B6, 16, 0x10
	mGetTiles 0x24F38, 36
	.4byte	1, 2

	mAnimCmd4 


anim_0959:
	.4byte anim_data__0959_0
	.4byte anim_data__0959_1
	.4byte anim_data__0959_2
