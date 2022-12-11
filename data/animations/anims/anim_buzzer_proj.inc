

anim_buzzer_proj_variant_0:
	mGetPalette 0x3E 16 0xD0
	mGetTiles 0x1A04F 4
	mAnimCmd6 0x0 0x202FEFE
	.4byte	2, 0

	mGetTiles 0x1A053 4
	.4byte	2, 1

	mGetTiles 0x1A057 4
	.4byte	2, 2

	mJumpBack 0x15


anim_buzzer_proj:
	.4byte anim_buzzer_proj_variant_0
