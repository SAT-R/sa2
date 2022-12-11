

anim_data__0952_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x245BD 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0952_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x245CD 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0952_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x245DD 42
	.4byte	1, 2

	mAnimCmd4 

anim_data__0952_3:
	mGetPalette 0x2B4 16 0x0
	mGetTiles 0x24607 18
	.4byte	1, 3

	mAnimCmd4 


anim_0952:
	.4byte anim_data__0952_0
	.4byte anim_data__0952_1
	.4byte anim_data__0952_2
	.4byte anim_data__0952_3
