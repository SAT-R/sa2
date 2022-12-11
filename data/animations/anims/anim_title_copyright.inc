

anim_title_copyright_variant_0:
	mGetPalette 0xD8 16 0xF0
	mGetTiles 0x22029 90
	.4byte	1, 0

	mAnimCmd4 

anim_title_copyright_variant_1:
	mGetPalette 0xD8 16 0xF0
	mGetTiles 0x22083 90
	.4byte	1, 1

	mAnimCmd4 


anim_title_copyright:
	.4byte anim_title_copyright_variant_0
	.4byte anim_title_copyright_variant_1
