
.align 2, 0
	anim_data__0861_0:
		mGetPalette 0xA4 16 0x60
		mGetTiles 0x23395 6
		.4byte	3, 0

		mGetTiles 0x2339B 12
		.4byte	3, 1

		mGetTiles 0x233A7 12
		.4byte	3, 2

		mGetTiles 0x233B3 8
		.4byte	3, 3

		mGetTiles 0x233BB 4
		.4byte	3, 4

		mGetTiles 0x233BF 6
		.4byte	3, 5

		mGetTiles 0x233C5 6
		.4byte	3, 6

		mGetTiles 0x233CB 4
		.4byte	3, 7

		mAnimCmd4 


.align 2, 0
	anim_0861:
		.4byte anim_data__0861_0
