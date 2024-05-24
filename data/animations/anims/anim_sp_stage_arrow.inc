

anim_sp_stage_arrow_variant_0:
	mGetPalette 0xEE, 16, 0xB0
	mGetTiles 0x2430F, 4
	.4byte	3, 0

	mGetTiles 0x24313, 4
	.4byte	2, 1

	mJumpBack 0xD

anim_sp_stage_arrow_variant_1:
	mGetPalette 0xEE, 16, 0xB0
	mGetTiles 0x24317, 4
	.4byte	3, 2

	mGetTiles 0x2431B, 4
	.4byte	2, 3

	mJumpBack 0xD

anim_sp_stage_arrow_variant_2:
	mGetPalette 0xEE, 16, 0xB0
	mGetTiles 0x2431F, 4
	.4byte	3, 4

	mGetTiles 0x24323, 4
	.4byte	2, 5

	mJumpBack 0xD


anim_sp_stage_arrow:
	.4byte anim_sp_stage_arrow_variant_0
	.4byte anim_sp_stage_arrow_variant_1
	.4byte anim_sp_stage_arrow_variant_2
