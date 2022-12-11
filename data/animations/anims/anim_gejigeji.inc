

anim_gejigeji_variant_0:
	mGetPalette 0x42 16 0xD0
	mGetTiles 0x1A2AB 12
	mAnimCmd6 0x0 0x908F7F8
	.4byte	4, 0

	mGetTiles 0x1A2B7 12
	.4byte	4, 1

	mGetTiles 0x1A2C3 12
	.4byte	4, 2

	mGetTiles 0x1A2CF 12
	.4byte	4, 3

	mGetTiles 0x1A2DB 12
	.4byte	4, 4

	mGetTiles 0x1A2E7 12
	.4byte	4, 5

	mJumpBack 0x24

anim_gejigeji_variant_1:
	mGetPalette 0x42 16 0xD0
	mGetTiles 0x1A2F3 12
	mAnimCmd6 0x0 0x808F7F8
	.4byte	4, 6

	mGetTiles 0x1A2FF 12
	.4byte	4, 7

	mGetTiles 0x1A30B 12
	.4byte	4, 8

	mGetTiles 0x1A317 12
	.4byte	4, 9

	mGetTiles 0x1A323 12
	.4byte	4, 10

	mGetTiles 0x1A32F 12
	.4byte	4, 11

	mJumpBack 0x24

anim_gejigeji_variant_2:
	mGetPalette 0x43 16 0x70
	mGetTiles 0x1A33B 9
	mAnimCmd6 0x0 0x808F1F8
	.4byte	5, 12

	mGetTiles 0x1A344 9
	.4byte	5, 13

	mGetTiles 0x1A34D 9
	.4byte	5, 14

	mJumpBack 0x15

anim_gejigeji_variant_3:
	mGetPalette 0x43 16 0x70
	mGetTiles 0x1A356 9
	mAnimCmd6 0x0 0x808F8F1
	.4byte	5, 15

	mGetTiles 0x1A35F 9
	.4byte	5, 16

	mGetTiles 0x1A368 9
	.4byte	5, 17

	mJumpBack 0x15


anim_gejigeji:
	.4byte anim_gejigeji_variant_0
	.4byte anim_gejigeji_variant_1
	.4byte anim_gejigeji_variant_2
	.4byte anim_gejigeji_variant_3
