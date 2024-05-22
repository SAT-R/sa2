

anim_countdown_variant_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBB7, 4
	.4byte	1, 0

	mAnimCmd4 

anim_countdown_variant_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBBB, 4
	.4byte	1, 1

	mAnimCmd4 

anim_countdown_variant_2:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBBF, 4
	.4byte	1, 2

	mAnimCmd4 


anim_countdown:
	.4byte anim_countdown_variant_0
	.4byte anim_countdown_variant_1
	.4byte anim_countdown_variant_2
