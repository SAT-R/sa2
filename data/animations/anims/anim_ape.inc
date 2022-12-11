

anim_ape_variant_0:
	mGetPalette 0x33 16 0xD0
	mGetTiles 0x1966D 20
	mAnimCmd6 0x0 0x109EBF8
	.4byte	7, 0

	mGetTiles 0x19681 20
	mAnimCmd6 0x0 0x109EBF8
	.4byte	7, 1

	mJumpBack 0x13

anim_ape_variant_1:
	mGetPalette 0x33 16 0xD0
	mGetTiles 0x19695 15
	mAnimCmd6 0x0 0xFA09DCFB
	.4byte	8, 2

	mGetTiles 0x196A4 16
	mAnimCmd6 0x0 0xEF09E0F7
	.4byte	8, 3

	mGetTiles 0x196B4 20
	mAnimCmd6 0x0 0xF40BE2F7
	.4byte	8, 4

	mGetTiles 0x196C8 25
	mAnimCmd6 0x0 0xFA09DFF9
	.4byte	8, 5

	mAnimCmd4 

anim_ape_variant_2:
	mGetPalette 0x33 16 0xD0
	mGetTiles 0x196E1 20
	mAnimCmd6 0x0 0xBF0F4
	.4byte	8, 6

	mAnimCmd4 

anim_ape_variant_3:
	mGetPalette 0x33 16 0xD0
	mGetTiles 0x196F5 20
	mAnimCmd6 0x0 0xBF0F4
	.4byte	5, 7

	mAnimCmd4 


anim_ape:
	.4byte anim_ape_variant_0
	.4byte anim_ape_variant_1
	.4byte anim_ape_variant_2
	.4byte anim_ape_variant_3
