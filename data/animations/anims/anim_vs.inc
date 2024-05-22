

anim_vs_variant_0:
	mGetPalette 0x2C9, 16, 0x0
	mGetTiles 0x2893B, 50
	.4byte	1, 0

	mAnimCmd4 

anim_vs_variant_1:
	mGetPalette 0x2C9, 16, 0x0
	mGetTiles 0x2896D, 38
	.4byte	1, 1

	mAnimCmd4 

anim_vs_variant_2:
	mGetPalette 0x2CA, 16, 0x10
	mGetTiles 0x28993, 32
	.4byte	1, 2

	mAnimCmd4 

anim_vs_variant_3:
	mGetPalette 0x2C9, 16, 0x0
	mGetTiles 0x289B3, 168
	.4byte	1, 3

	mAnimCmd4 

anim_vs_variant_4:
	mGetPalette 0x2C9, 16, 0x0
	mGetTiles 0x28A5B, 168
	.4byte	1, 4

	mAnimCmd4 


anim_vs:
	.4byte anim_vs_variant_0
	.4byte anim_vs_variant_1
	.4byte anim_vs_variant_2
	.4byte anim_vs_variant_3
	.4byte anim_vs_variant_4
