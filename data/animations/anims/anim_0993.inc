

anim_data__0993_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26776, 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0993_1:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26786, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0993_2:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x26796, 28
	.4byte	1, 2

	mAnimCmd4 


anim_0993:
	.4byte anim_data__0993_0
	.4byte anim_data__0993_1
	.4byte anim_data__0993_2
