

anim_platform_ice_par_variant_0:
	mGetPalette 0x70 16 0xB0
	mGetTiles 0x1B055 18
	mAnimCmd6 0x0 0xFC18F6E8
	.4byte	1, 0

	mAnimCmd4 

anim_platform_ice_par_variant_1:
	mGetPalette 0x70 16 0xB0
	mGetTiles 0x1B067 24
	mAnimCmd6 0x0 0x1018F0E8
	.4byte	1, 1

	mAnimCmd4 

anim_platform_ice_par_variant_2:
	mGetPalette 0x70 16 0xB0
	mGetTiles 0x1B07F 36
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	1, 2

	mAnimCmd4 


anim_platform_ice_par:
	.4byte anim_platform_ice_par_variant_0
	.4byte anim_platform_ice_par_variant_1
	.4byte anim_platform_ice_par_variant_2
