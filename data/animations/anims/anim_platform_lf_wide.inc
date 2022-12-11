

anim_platform_lf_wide_variant_0:
	mGetPalette 0x48 16 0xB0
	mGetTiles 0x1A842 32
	mAnimCmd6 0x0 0x20400000
	.4byte	1, 0

	mAnimCmd4 


anim_platform_lf_wide:
	.4byte anim_platform_lf_wide_variant_0
