

anim_sp_stage_hole_variant_0:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x242BA, 2
	.4byte	1, 0

	mAnimCmd4 

anim_sp_stage_hole_variant_1:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x242BC, 4
	.4byte	1, 1

	mAnimCmd4 

anim_sp_stage_hole_variant_2:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x242C0, 1
	.4byte	1, 2

	mAnimCmd4 

anim_sp_stage_hole_variant_3:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x242C1, 1
	.4byte	1, 3

	mAnimCmd4 


anim_sp_stage_hole:
	.4byte anim_sp_stage_hole_variant_0
	.4byte anim_sp_stage_hole_variant_1
	.4byte anim_sp_stage_hole_variant_2
	.4byte anim_sp_stage_hole_variant_3
