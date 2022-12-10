
.align 2, 0
	anim_data__0307_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x108C6 20
		.4byte	6, 0

		mGetTiles 0x108DA 25
		.4byte	3, 1

		mGetTiles 0x108F3 24
		.4byte	3, 2

		mGetTiles 0x1090B 28
		.4byte	3, 3

		mGetTiles 0x10927 30
		.4byte	3, 4

		mGetTiles 0x10945 30
		.4byte	3, 5

		mGetTiles 0x10963 36
		.4byte	3, 6

		mGetTiles 0x10987 36
		.4byte	3, 7

		mGetTiles 0x109AB 30
		.4byte	3, 8

		mGetTiles 0x109C9 20
		.4byte	3, 9

		mGetTiles 0x109DD 20
		.4byte	3, 10

		mGetTiles 0x109F1 20
		.4byte	3, 11

		mGetTiles 0x10A05 20
		.4byte	6, 12

		mGetTiles 0x10A19 25
		.4byte	3, 13

		mGetTiles 0x10A32 25
		.4byte	3, 14

		mGetTiles 0x10A4B 25
		.4byte	3, 15

		mGetTiles 0x10A64 20
		.4byte	60, 16

		mAnimCmd4 


.align 2, 0
	anim_0307:
		.4byte anim_data__0307_0
