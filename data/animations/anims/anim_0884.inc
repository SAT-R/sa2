

anim_data__0884_0:
	mGetPalette 0xA1 16 0x70
	mGetTiles 0x242BA 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0884_1:
	mGetPalette 0xA1 16 0x70
	mGetTiles 0x242BC 4
	.4byte	1, 1

	mAnimCmd4 

anim_data__0884_2:
	mGetPalette 0xA1 16 0x70
	mGetTiles 0x242C0 1
	.4byte	1, 2

	mAnimCmd4 

anim_data__0884_3:
	mGetPalette 0xA1 16 0x70
	mGetTiles 0x242C1 1
	.4byte	1, 3

	mAnimCmd4 


anim_0884:
	.4byte anim_data__0884_0
	.4byte anim_data__0884_1
	.4byte anim_data__0884_2
	.4byte anim_data__0884_3
