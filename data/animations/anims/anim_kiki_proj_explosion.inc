

anim_kiki_proj_explosion_variant_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x19799 16
	mAnimCmd6 0x0 0xA09F9F6
	.4byte	4, 0

	mGetTiles 0x197A9 16
	mAnimCmd6 0x0 0x907FBF8
	.4byte	4, 1

	mGetTiles 0x197B9 16
	mAnimCmd6 0x0 0x606FBFB
	.4byte	4, 2

	mGetTiles 0x197C9 12
	.4byte	4, 3

	mAnimCmd4 


anim_kiki_proj_explosion:
	.4byte anim_kiki_proj_explosion_variant_0
