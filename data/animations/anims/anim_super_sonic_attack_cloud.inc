

anim_super_sonic_attack_cloud_variant_0:
	mGetPalette 0x2D 16 0x20
	mGetTiles 0x185B1 40
	.4byte	2, 0

	mGetTiles 0x185D9 40
	.4byte	2, 1

	mGetTiles 0x18601 40
	.4byte	2, 2

	mGetTiles 0x18629 40
	.4byte	2, 3

	mJumpBack 0x17

anim_super_sonic_attack_cloud_variant_1:
	mGetPalette 0x2D 16 0x20
	mGetTiles 0x18651 40
	.4byte	3, 4

	mGetTiles 0x18679 40
	.4byte	3, 5

	mGetTiles 0x186A1 40
	.4byte	3, 6

	mAnimCmd4 


anim_super_sonic_attack_cloud:
	.4byte anim_super_sonic_attack_cloud_variant_0
	.4byte anim_super_sonic_attack_cloud_variant_1
