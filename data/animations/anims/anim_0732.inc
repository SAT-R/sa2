

anim_data__0732_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x1DB64, 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0732_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x1DB74, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0732_2:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x1DB84, 16
	.4byte	1, 2

	mAnimCmd4 

anim_data__0732_3:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x1DB94, 16
	.4byte	1, 3

	mAnimCmd4 


anim_0732:
	.4byte anim_data__0732_0
	.4byte anim_data__0732_1
	.4byte anim_data__0732_2
	.4byte anim_data__0732_3
