

anim_data__0154_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x85EC 16
	mAnimCmd6 0x0 0x50EF8FE
	.4byte	2, 0

	mGetTiles 0x85FC 24
	mAnimCmd6 0x0 0xEF2FE
	.4byte	2, 1

	mGetTiles 0x8614 28
	mAnimCmd6 0x0 0xFC0EECFE
	.4byte	4, 2

	mGetTiles 0x8630 16
	mAnimCmd6 0x0 0xFC0EEEFE
	.4byte	3, 3

	mGetTiles 0x8640 16
	mAnimCmd6 0x0 0x60EF6FE
	.4byte	2, 4

	mGetTiles 0x8650 28
	mAnimCmd6 0x0 0xE0EFCFE
	.4byte	2, 5

	mGetTiles 0x866C 32
	mAnimCmd6 0x0 0x120E00FE
	.4byte	4, 6

	mGetTiles 0x868C 20
	mAnimCmd6 0x0 0x100EFEFE
	.4byte	3, 7

	mGetTiles 0x85EC 16
	mAnimCmd6 0x0 0x50EF8FE
	.4byte	2, 0

	mAnimCmd4 

anim_data__0154_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x86A0 16
	mAnimCmd6 0x0 0x80EFAFE
	.4byte	2, 8

	mGetTiles 0x86B0 24
	mAnimCmd6 0x0 0x120E02FE
	.4byte	2, 9

	mGetTiles 0x86C8 28
	mAnimCmd6 0x0 0x180E04FE
	.4byte	4, 10

	mGetTiles 0x86E4 16
	mAnimCmd6 0x0 0x120E00FE
	.4byte	3, 11

	mGetTiles 0x86F4 16
	mAnimCmd6 0x0 0xA0EFAFE
	.4byte	2, 12

	mGetTiles 0x8704 28
	mAnimCmd6 0x0 0x40EF4FE
	.4byte	2, 13

	mGetTiles 0x8720 32
	mAnimCmd6 0x0 0x40EEEFE
	.4byte	4, 14

	mGetTiles 0x8740 20
	mAnimCmd6 0x0 0x40EF2FE
	.4byte	3, 15

	mGetTiles 0x86A0 16
	mAnimCmd6 0x0 0x80EFAFE
	.4byte	2, 8

	mAnimCmd4 


anim_0154:
	.4byte anim_data__0154_0
	.4byte anim_data__0154_1
