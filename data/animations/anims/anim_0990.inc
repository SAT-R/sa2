

anim_data__0990_0:
	mGetPalette 0x2C3, 16, 0x10
	mGetTiles 0x266AC, 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0990_1:
	mGetPalette 0x2C3, 16, 0x10
	mGetTiles 0x266BC, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0990_2:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x266CC, 28
	.4byte	1, 2

	mAnimCmd4 


anim_0990:
	.4byte anim_data__0990_0
	.4byte anim_data__0990_1
	.4byte anim_data__0990_2
