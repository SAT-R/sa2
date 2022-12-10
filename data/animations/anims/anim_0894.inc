

anim_data__0894_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x243A7 22
	.4byte	1, 0

	mAnimCmd4 

anim_data__0894_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x243BD 22
	.4byte	1, 1

	mAnimCmd4 

anim_data__0894_2:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x243D3 22
	.4byte	1, 2

	mAnimCmd4 


anim_0894:
	.4byte anim_data__0894_0
	.4byte anim_data__0894_1
	.4byte anim_data__0894_2
