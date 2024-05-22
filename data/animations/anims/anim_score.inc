

anim_score_variant_0:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x1D9DD, 2
	.4byte	1, 0

	mAnimCmd4 

anim_score_variant_1:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x1D9DF, 2
	.4byte	1, 1

	mAnimCmd4 

anim_score_variant_2:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x1D9E1, 2
	.4byte	1, 2

	mAnimCmd4 

anim_score_variant_3:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x1D9E3, 2
	.4byte	1, 3

	mAnimCmd4 

anim_score_variant_4:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x1D9E5, 2
	.4byte	1, 4

	mAnimCmd4 


anim_score:
	.4byte anim_score_variant_0
	.4byte anim_score_variant_1
	.4byte anim_score_variant_2
	.4byte anim_score_variant_3
	.4byte anim_score_variant_4
