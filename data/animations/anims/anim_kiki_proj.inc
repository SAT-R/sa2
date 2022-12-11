

anim_kiki_proj_variant_0:
	mGetPalette 0x33 16 0xD0
	mGetTiles 0x19795 4
	mAnimCmd6 0x0 0x504FCFC
	.4byte	1, 0

	mAnimCmd4 


anim_kiki_proj:
	.4byte anim_kiki_proj_variant_0
