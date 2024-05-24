

anim_kubinaga_base_variant_0:
	mGetPalette 0x37, 16, 0xC0
	mGetTiles 0x198B3, 6
	mAnimCmd6 0x0, 0xCEEF4
	.4byte	1, 0

	mAnimCmd4 

anim_kubinaga_base_variant_1:
	mGetPalette 0x37, 16, 0xC0
	mGetTiles 0x198B9, 6
	mAnimCmd6 0x0, 0xC00F5EE
	.4byte	1, 1

	mAnimCmd4 


anim_kubinaga_base:
	.4byte anim_kubinaga_base_variant_0
	.4byte anim_kubinaga_base_variant_1
