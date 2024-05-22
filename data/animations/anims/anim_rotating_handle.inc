

anim_rotating_handle_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA3A, 9
	mAnimCmd6 0x0, 0xC07F4F9
	.4byte	1, 0

	mJumpBack 0xB

anim_rotating_handle_variant_1:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA43, 9
	.4byte	1, 1

	mJumpBack 0x8

anim_rotating_handle_variant_2:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA4C, 9
	.4byte	1, 2

	mJumpBack 0x8

anim_rotating_handle_variant_3:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA55, 9
	.4byte	1, 3

	mJumpBack 0x8

anim_rotating_handle_variant_4:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA5E, 9
	.4byte	1, 4

	mJumpBack 0x8

anim_rotating_handle_variant_5:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA67, 9
	.4byte	1, 5

	mJumpBack 0x8

anim_rotating_handle_variant_6:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA3A, 9
	.4byte	1, 0

	mJumpBack 0x8

anim_rotating_handle_variant_7:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA43, 9
	.4byte	1, 1

	mJumpBack 0x8

anim_rotating_handle_variant_8:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA4C, 9
	.4byte	1, 2

	mJumpBack 0x8

anim_rotating_handle_variant_9:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA55, 9
	.4byte	1, 3

	mJumpBack 0x8

anim_rotating_handle_variant_10:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA5E, 9
	.4byte	1, 4

	mJumpBack 0x8

anim_rotating_handle_variant_11:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AA67, 9
	.4byte	1, 5

	mJumpBack 0x8


anim_rotating_handle:
	.4byte anim_rotating_handle_variant_0
	.4byte anim_rotating_handle_variant_1
	.4byte anim_rotating_handle_variant_2
	.4byte anim_rotating_handle_variant_3
	.4byte anim_rotating_handle_variant_4
	.4byte anim_rotating_handle_variant_5
	.4byte anim_rotating_handle_variant_6
	.4byte anim_rotating_handle_variant_7
	.4byte anim_rotating_handle_variant_8
	.4byte anim_rotating_handle_variant_9
	.4byte anim_rotating_handle_variant_10
	.4byte anim_rotating_handle_variant_11
