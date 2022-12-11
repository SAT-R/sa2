

anim_mp_single_pak_results_round_variant_0:
	mGetPalette 0x2CE 16 0xA0
	mGetTiles 0x2A4EB 6
	.4byte	1, 0

	mAnimCmd4 

anim_mp_single_pak_results_round_variant_1:
	mGetPalette 0x2CE 16 0xA0
	mGetTiles 0x2A4F1 10
	.4byte	1, 1

	mAnimCmd4 

anim_mp_single_pak_results_round_variant_2:
	mGetPalette 0x2CE 16 0xA0
	mGetTiles 0x2A4FB 10
	.4byte	1, 2

	mAnimCmd4 


anim_mp_single_pak_results_round:
	.4byte anim_mp_single_pak_results_round_variant_0
	.4byte anim_mp_single_pak_results_round_variant_1
	.4byte anim_mp_single_pak_results_round_variant_2
