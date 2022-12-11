

anim_super_sonic_sideways_variant_0:
	mGetPalette 0x2A 16 0x0
	mGetTiles 0x184B1 24
	mAnimCmd6 0x0 0x60DF6F2
	mAnimCmd6 0x1 0x60DF6F2
	.4byte	2, 0

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x184C9 24
	.4byte	2, 1

	mGetPalette 0x2A 16 0x0
	mGetTiles 0x184E1 24
	.4byte	2, 2

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x184F9 24
	.4byte	2, 3

	mJumpBack 0x26

anim_super_sonic_sideways_variant_1:
	mGetPalette 0x2A 16 0x0
	mGetTiles 0x18511 24
	mAnimCmd6 0x0 0x60DF6F2
	mAnimCmd6 0x1 0xB03F1EC
	.4byte	2, 4

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x18529 24
	.4byte	2, 5

	mGetPalette 0x2A 16 0x0
	mGetTiles 0x18541 24
	.4byte	2, 6

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x18559 24
	.4byte	2, 7

	mJumpBack 0x26

anim_super_sonic_sideways_variant_2:
	mGetPalette 0x2A 16 0x0
	mGetTiles 0x18571 64
	.4byte	1, 8

	mAnimCmd4 


anim_super_sonic_sideways:
	.4byte anim_super_sonic_sideways_variant_0
	.4byte anim_super_sonic_sideways_variant_1
	.4byte anim_super_sonic_sideways_variant_2
