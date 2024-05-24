

anim_gohla_variant_0:
	mGetPalette 0x36, 16, 0xD0
	mGetTiles 0x1982D, 9
	mAnimCmd6 0x0, 0xFF04ECFC
	mAnimCmd6 0x1, 0xFC1AEFEA
	.4byte	1, 0

	mAnimCmd4 

anim_gohla_variant_1:
	mGetPalette 0x36, 16, 0xD0
	mGetTiles 0x19836, 9
	mAnimCmd6 0x0, 0xFF04ECFC
	mAnimCmd6 0x1, 0xFC1AEFEA
	.4byte	1, 1

	mGetTiles 0x1983F, 9
	mAnimCmd6 0x0, 0xFF04ECFC
	mAnimCmd6 0x1, 0xFC1AEFEA
	.4byte	1, 2

	mAnimCmd4 


anim_gohla:
	.4byte anim_gohla_variant_0
	.4byte anim_gohla_variant_1
