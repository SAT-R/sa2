

anim_data__0616_0:
	mGetPalette 0x81, 16, 0xB0
	mGetTiles 0x1BA64, 24
	mAnimCmd6 0x0, 0x1818E8E8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0616_1:
	mGetPalette 0x81, 16, 0xB0
	mGetTiles 0x1BA7C, 64
	mAnimCmd6 0x0, 0xEF0F2E0
	.4byte	1, 1

	mAnimCmd4 


anim_0616:
	.4byte anim_data__0616_0
	.4byte anim_data__0616_1
