

anim_title_lens_flare_variant_0:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x220E9 4
	.4byte	1, 0

	mAnimCmd4 

anim_title_lens_flare_variant_1:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x220ED 16
	.4byte	1, 1

	mAnimCmd4 

anim_title_lens_flare_variant_2:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x220FD 1
	.4byte	1, 2

	mAnimCmd4 

anim_title_lens_flare_variant_3:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x220FE 1
	.4byte	1, 3

	mAnimCmd4 

anim_title_lens_flare_variant_4:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x220FF 4
	.4byte	1, 4

	mAnimCmd4 

anim_title_lens_flare_variant_5:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x22103 16
	.4byte	1, 5

	mAnimCmd4 

anim_title_lens_flare_variant_6:
	mGetPalette 0xDA 16 0x70
	mGetTiles 0x22113 64
	.4byte	1, 6

	mAnimCmd4 


anim_title_lens_flare:
	.4byte anim_title_lens_flare_variant_0
	.4byte anim_title_lens_flare_variant_1
	.4byte anim_title_lens_flare_variant_2
	.4byte anim_title_lens_flare_variant_3
	.4byte anim_title_lens_flare_variant_4
	.4byte anim_title_lens_flare_variant_5
	.4byte anim_title_lens_flare_variant_6
