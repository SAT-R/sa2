

anim_ramp_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A96C, 20
	mAnimCmd6 0x0, 0x14E5EC
	.4byte	1, 0

	mAnimCmd4 

anim_ramp_variant_1:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A980, 15
	mAnimCmd6 0x0, 0x14EAEC
	.4byte	1, 1

	mAnimCmd4 


anim_ramp:
	.4byte anim_ramp_variant_0
	.4byte anim_ramp_variant_1
