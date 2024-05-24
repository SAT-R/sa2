

anim_data__0781_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2064A, 48
	.4byte	1, 0

	mAnimCmd4 

anim_data__0781_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2067A, 26
	.4byte	1, 1

	mAnimCmd4 

anim_data__0781_2:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x20694, 32
	.4byte	1, 2

	mAnimCmd4 


anim_0781:
	.4byte anim_data__0781_0
	.4byte anim_data__0781_1
	.4byte anim_data__0781_2
