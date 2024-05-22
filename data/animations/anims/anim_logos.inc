

anim_logos_variant_0:
	mGetPalette 735, 16, 0
	mGetTiles 0x2BCA3, 64
	.4byte	1, 0

	mAnimCmd4 
    
anim_logos_variant_1:
	mGetPalette 736, 16, 0
	mGetTiles 0x2BCE3, 64
	.4byte	2, 0

	mAnimCmd4 


anim_logos:
	.4byte anim_logos_variant_0
	.4byte anim_logos_variant_1
