

anim_data__0983_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26327 18
	.4byte	1, 0

	mAnimCmd4 

anim_data__0983_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26339 18
	.4byte	1, 1

	mAnimCmd4 

anim_data__0983_2:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x2634B 18
	.4byte	1, 2

	mAnimCmd4 

anim_data__0983_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x2635D 40
	.4byte	1, 3

	mAnimCmd4 

anim_data__0983_4:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26385 21
	.4byte	1, 4

	mAnimCmd4 


anim_0983:
	.4byte anim_data__0983_0
	.4byte anim_data__0983_1
	.4byte anim_data__0983_2
	.4byte anim_data__0983_3
	.4byte anim_data__0983_4
