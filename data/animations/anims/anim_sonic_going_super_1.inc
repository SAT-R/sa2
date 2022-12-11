

anim_sonic_going_super_1_variant_0:
	mGetPalette 0x1 16 0x0
	mGetTiles 0x1833D 16
	.4byte	4, 0

	mGetTiles 0x1834D 16
	.4byte	10, 1

	mGetTiles 0x1835D 16
	.4byte	2, 2

	mGetTiles 0x1833D 16
	.4byte	4, 0

	mGetTiles 0x1836D 20
	.4byte	3, 3

	mGetTiles 0x18381 20
	.4byte	3, 4

	mGetTiles 0x18395 24
	.4byte	3, 5

	mGetTiles 0x183AD 24
	.4byte	3, 6

	mGetPalette 0x28 16 0x0
	mGetTiles 0x183C5 24
	.4byte	3, 7

	mGetPalette 0x29 16 0x0
	mGetTiles 0x183DD 24
	.4byte	3, 8

	mGetPalette 0x2A 16 0x0
	mGetTiles 0x183F5 24
	.4byte	1, 9

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x1840D 24
	.4byte	1, 10

	mGetPalette 0x2A 16 0x0
	mGetTiles 0x18425 24
	.4byte	1, 11

	mGetPalette 0x2B 16 0x30
	mGetTiles 0x1843D 24
	.4byte	1, 12

	mJumpBack 0x20

anim_sonic_going_super_1_variant_1:
	mGetPalette 0x2C 16 0x50
	mGetTiles 0x18455 36
	.4byte	3, 13

	mGetTiles 0x18479 56
	.4byte	3, 14

	mJumpBack 0xD


anim_sonic_going_super_1:
	.4byte anim_sonic_going_super_1_variant_0
	.4byte anim_sonic_going_super_1_variant_1
