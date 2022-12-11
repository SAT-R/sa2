

anim_platform_hot_cra_variant_0:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB94 18
	mAnimCmd6 0x0 0xF818F6E8
	.4byte	1, 0

	mAnimCmd4 

anim_platform_hot_cra_variant_1:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1ABA6 24
	mAnimCmd6 0x0 0x1018EFE8
	.4byte	1, 1

	mAnimCmd4 


anim_platform_hot_cra:
	.4byte anim_platform_hot_cra_variant_0
	.4byte anim_platform_hot_cra_variant_1
