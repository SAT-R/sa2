

anim_kubinaga_neck_variant_0:
	mGetPalette 0x38 16 0xC0
	mGetTiles 0x198AF 4
	mAnimCmd6 0x0 0x808F8F8
	.4byte	1, 0

	mAnimCmd4 


anim_kubinaga_neck:
	.4byte anim_kubinaga_neck_variant_0
