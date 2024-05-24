

anim_data__1092_0:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29C9D, 12
	.4byte	1, 0

	mAnimCmd4 

anim_data__1092_1:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29CA9, 12
	.4byte	1, 1

	mAnimCmd4 

anim_data__1092_2:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29CB5, 10
	.4byte	1, 2

	mAnimCmd4 


anim_1092:
	.4byte anim_data__1092_0
	.4byte anim_data__1092_1
	.4byte anim_data__1092_2
