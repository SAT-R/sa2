

anim_madillo_variant_0:
	mGetPalette 0x3D, 16, 0xC0
	mGetTiles 0x19EC5, 12
	mAnimCmd6 0x0, 0x10E9F1
	.4byte	8, 0

	mGetTiles 0x19ED1, 15
	.4byte	8, 1

	mGetTiles 0x19EE0, 15
	.4byte	8, 2

	mGetTiles 0x19ED1, 15
	.4byte	8, 1

	mJumpBack 0x1A

anim_madillo_variant_1:
	mGetPalette 0x3D, 16, 0xC0
	mGetTiles 0x19EC5, 12
	mAnimCmd6 0x0, 0xFE0CE6F5
	.4byte	5, 0

	mGetTiles 0x19EEF, 12
	.4byte	5, 3

	mGetTiles 0x19EFB, 16
	.4byte	5, 4

	mGetTiles 0x19F0B, 16
	mAnimCmd6 0x0, 0xFE0CE6F5
	.4byte	2, 5

	mGetTiles 0x19F1B, 16
	.4byte	2, 6

	mGetTiles 0x19F2B, 16
	.4byte	2, 7

	mJumpBack 0x12

anim_madillo_variant_2:
	mGetPalette 0x3D, 16, 0xC0
	mGetTiles 0x19F3B, 16
	mAnimCmd6 0x0, 0xFF0DE5F4
	.4byte	5, 8

	mGetTiles 0x19EFB, 16
	.4byte	5, 4

	mGetTiles 0x19EEF, 12
	.4byte	5, 3

	mGetTiles 0x19EC5, 12
	.4byte	5, 0

	mAnimCmd4 


anim_madillo:
	.4byte anim_madillo_variant_0
	.4byte anim_madillo_variant_1
	.4byte anim_madillo_variant_2
