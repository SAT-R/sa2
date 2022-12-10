

anim_data__0245_0:
	mGetPalette 0x12 16 0x0
	mGetTiles 0xD4A1 20
	mAnimCmd6 0x0 0x50EF8FE
	.4byte	2, 0

	mGetTiles 0xD4B5 18
	mAnimCmd6 0x0 0xEF2FE
	.4byte	2, 1

	mGetTiles 0xD4C7 24
	mAnimCmd6 0x0 0xFC0EECFE
	.4byte	4, 2

	mGetTiles 0xD4DF 25
	mAnimCmd6 0x0 0xFC0EEEFE
	.4byte	3, 3

	mGetTiles 0xD4F8 24
	mAnimCmd6 0x0 0xE0EFEFE
	.4byte	2, 4

	mGetTiles 0xD510 24
	mAnimCmd6 0x0 0xE10FC00
	.4byte	2, 5

	mGetTiles 0xD528 20
	mAnimCmd6 0x0 0x120E00FE
	.4byte	4, 6

	mGetTiles 0xD53C 16
	mAnimCmd6 0x0 0x100EFEFE
	.4byte	3, 7

	mGetTiles 0xD4A1 20
	mAnimCmd6 0x0 0x50EF8FE
	.4byte	2, 0

	mAnimCmd4 

anim_data__0245_1:
	mGetPalette 0x12 16 0x0
	mGetTiles 0xD54C 20
	mAnimCmd6 0x0 0x80EFAFE
	.4byte	2, 8

	mGetTiles 0xD560 18
	mAnimCmd6 0x0 0x120E02FE
	.4byte	2, 9

	mGetTiles 0xD572 24
	mAnimCmd6 0x0 0x180E04FE
	.4byte	4, 10

	mGetTiles 0xD58A 25
	mAnimCmd6 0x0 0x120E00FE
	.4byte	3, 11

	mGetTiles 0xD5A3 24
	mAnimCmd6 0x0 0x20EF2FE
	.4byte	2, 12

	mGetTiles 0xD5BB 24
	mAnimCmd6 0x0 0x410F400
	.4byte	2, 13

	mGetTiles 0xD5D3 20
	mAnimCmd6 0x0 0x40EEEFE
	.4byte	4, 14

	mGetTiles 0xD5E7 16
	mAnimCmd6 0x0 0x40EF2FE
	.4byte	3, 15

	mGetTiles 0xD54C 20
	mAnimCmd6 0x0 0x80EFAFE
	.4byte	2, 8

	mAnimCmd4 


anim_0245:
	.4byte anim_data__0245_0
	.4byte anim_data__0245_1
