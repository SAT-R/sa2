

anim_e100_alpha_variant_0:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x23EBA, 64
	.4byte	3, 0

	mGetTiles 0x23EFA, 64
	.4byte	3, 1

	mJumpBack 0xD

anim_e100_alpha_variant_1:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x23F3A, 64
	.4byte	3, 2

	mGetTiles 0x23F7A, 64
	.4byte	3, 3

	mJumpBack 0xD

anim_e100_alpha_variant_2:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x23FBA, 64
	.4byte	3, 4

	mGetTiles 0x23FFA, 64
	.4byte	3, 5

	mJumpBack 0xD

anim_e100_alpha_variant_3:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x2403A, 64
	.4byte	3, 6

	mGetTiles 0x2407A, 64
	.4byte	3, 7

	mJumpBack 0xD

anim_e100_alpha_variant_4:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x240BA, 64
	.4byte	3, 8

	mGetTiles 0x240FA, 64
	.4byte	3, 9

	mJumpBack 0xD

anim_e100_alpha_variant_5:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x2413A, 64
	.4byte	3, 10

	mGetTiles 0x2417A, 64
	.4byte	3, 11

	mJumpBack 0xD

anim_e100_alpha_variant_6:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x241BA, 64
	.4byte	3, 12

	mGetTiles 0x241FA, 64
	.4byte	3, 13

	mJumpBack 0xD

anim_e100_alpha_variant_7:
	mGetPalette 0xEC, 16, 0x10
	mGetTiles 0x2423A, 64
	.4byte	3, 14

	mGetTiles 0x2427A, 64
	.4byte	3, 15

	mJumpBack 0xD


anim_e100_alpha:
	.4byte anim_e100_alpha_variant_0
	.4byte anim_e100_alpha_variant_1
	.4byte anim_e100_alpha_variant_2
	.4byte anim_e100_alpha_variant_3
	.4byte anim_e100_alpha_variant_4
	.4byte anim_e100_alpha_variant_5
	.4byte anim_e100_alpha_variant_6
	.4byte anim_e100_alpha_variant_7
