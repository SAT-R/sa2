

anim_mouse_variant_0:
	mGetPalette 0x42, 16, 0xD0
	mGetTiles 0x1A371, 10
	mAnimCmd6 0x0, 0xBF3F1
	.4byte	4, 0

	mGetTiles 0x1A37B, 15
	.4byte	4, 1

	mGetTiles 0x1A38A, 10
	.4byte	4, 2

	mGetTiles 0x1A394, 15
	.4byte	4, 3

	mJumpBack 0x1A

anim_mouse_variant_1:
	mGetPalette 0x42, 16, 0xD0
	mGetTiles 0x1A3A3, 8
	mAnimCmd6 0x0, 0xDF3F4
	.4byte	2, 4

	mGetTiles 0x1A3AB, 8
	.4byte	2, 5

	mGetTiles 0x1A3B3, 8
	.4byte	2, 6

	mGetTiles 0x1A3BB, 8
	.4byte	2, 7

	mAnimCmd4 


anim_mouse:
	.4byte anim_mouse_variant_0
	.4byte anim_mouse_variant_1
