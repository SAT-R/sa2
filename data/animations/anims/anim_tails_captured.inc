

anim_tails_captured_variant_0:
	mGetPalette 0xF 16 0x20
	mGetTiles 0xBECB 30
	.4byte	3, 0

	mGetTiles 0xBEE9 30
	.4byte	3, 1

	mGetTiles 0xBF07 30
	.4byte	3, 2

	mGetTiles 0xBF25 30
	.4byte	3, 3

	mJumpBack 0x17

anim_tails_captured_variant_1:
	mGetPalette 0xF 16 0x20
	mGetTiles 0xBF43 25
	.4byte	1, 4

	mAnimCmd4 


anim_tails_captured:
	.4byte anim_tails_captured_variant_0
	.4byte anim_tails_captured_variant_1
