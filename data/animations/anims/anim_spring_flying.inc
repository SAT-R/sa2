

anim_spring_flying_variant_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1B326 20
	.4byte	2, 0

	mGetTiles 0x1B33A 20
	.4byte	2, 1

	mGetTiles 0x1B34E 20
	.4byte	2, 2

	mGetTiles 0x1B362 20
	.4byte	2, 3

	mJumpBack 0x17

anim_spring_flying_variant_1:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1B326 20
	.4byte	2, 0

	mGetTiles 0x1B376 20
	.4byte	2, 4

	mGetTiles 0x1B38A 20
	.4byte	2, 5

	mGetTiles 0x1B362 20
	.4byte	2, 3

	mGetTiles 0x1B39E 20
	.4byte	2, 6

	mAnimCmd4 


anim_spring_flying:
	.4byte anim_spring_flying_variant_0
	.4byte anim_spring_flying_variant_1
