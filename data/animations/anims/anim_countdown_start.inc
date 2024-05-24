

anim_countdown_start_variant_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBC3, 64
	.4byte	1, 0

	mAnimCmd4 

anim_countdown_start_variant_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BC03, 64
	.4byte	1, 1

	mAnimCmd4 


anim_countdown_start:
	.4byte anim_countdown_start_variant_0
	.4byte anim_countdown_start_variant_1
