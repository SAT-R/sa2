

anim_super_sonic_frozen_variant_0:
	mGetPalette 0x30, 16, 0xB0
	mGetTiles 0x19559, 30
	mAnimCmd6 0x0, 0x70DF8F3
	.4byte	5, 0

	mGetTiles 0x19577, 30
	.4byte	5, 1

	mGetTiles 0x19595, 30
	.4byte	5, 2

	mGetTiles 0x195B3, 30
	.4byte	5, 3

	mGetTiles 0x195D1, 36
	.4byte	5, 4

	mGetTiles 0x195F5, 36
	.4byte	5, 5

	mJumpBack 0x24

anim_super_sonic_frozen_variant_1:
	mGetPalette 0x31, 16, 0xB0
	mGetTiles 0x19619, 16
	.4byte	1, 6

	mAnimCmd4 

anim_super_sonic_frozen_variant_2:
	mGetPalette 0x31, 16, 0xB0
	mGetTiles 0x19629, 4
	.4byte	1, 7

	mAnimCmd4 


anim_super_sonic_frozen:
	.4byte anim_super_sonic_frozen_variant_0
	.4byte anim_super_sonic_frozen_variant_1
	.4byte anim_super_sonic_frozen_variant_2
