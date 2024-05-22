

anim_mp_single_pak_results_cumulative_variant_0:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2A4C7, 6
	.4byte	1, 0

	mAnimCmd4 

anim_mp_single_pak_results_cumulative_variant_1:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2A4CD, 6
	.4byte	1, 1

	mAnimCmd4 

anim_mp_single_pak_results_cumulative_variant_2:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2A4D3, 12
	.4byte	1, 2

	mAnimCmd4 

anim_mp_single_pak_results_cumulative_variant_3:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2A4DF, 12
	.4byte	1, 3

	mAnimCmd4 


anim_mp_single_pak_results_cumulative:
	.4byte anim_mp_single_pak_results_cumulative_variant_0
	.4byte anim_mp_single_pak_results_cumulative_variant_1
	.4byte anim_mp_single_pak_results_cumulative_variant_2
	.4byte anim_mp_single_pak_results_cumulative_variant_3
