

anim_credits_copyright_variant_0:
	mGetPalette 0xD7, 16, 0x30
	mGetTiles 0x21FAB, 63
	.4byte	1, 0

	mAnimCmd4 

anim_credits_copyright_variant_1:
	mGetPalette 0xD7, 16, 0x30
	mGetTiles 0x21FEA, 63
	.4byte	1, 1

	mAnimCmd4 


anim_credits_copyright:
	.4byte anim_credits_copyright_variant_0
	.4byte anim_credits_copyright_variant_1
