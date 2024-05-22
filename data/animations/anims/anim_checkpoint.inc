

anim_checkpoint_variant_0:
	mGetPalette 0x43, 16, 0x70
	mGetTiles 0x1A558, 4
	mAnimCmd6 0x0, 0x340AFEFE
	.4byte	8, 0

	mGetTiles 0x1A55C, 4
	.4byte	8, 1

	mGetTiles 0x1A560, 4
	.4byte	8, 2

	mGetTiles 0x1A564, 4
	.4byte	24, 3

	mGetTiles 0x1A568, 4
	.4byte	8, 4

	mGetTiles 0x1A56C, 4
	.4byte	8, 5

	mJumpBack 0x24

anim_checkpoint_variant_1:
	mGetPalette 0x43, 16, 0x70
	mGetTiles 0x1A570, 4
	.4byte	8, 6

	mGetTiles 0x1A574, 4
	.4byte	6, 7

	mGetTiles 0x1A578, 4
	.4byte	6, 8

	mAnimCmd4 


anim_checkpoint:
	.4byte anim_checkpoint_variant_0
	.4byte anim_checkpoint_variant_1
