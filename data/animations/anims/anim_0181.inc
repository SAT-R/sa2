
.align 2, 0
	anim_data__0181_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x955B 16
		.4byte	2, 0

		mGetTiles 0x956B 16
		.4byte	2, 1

		mGetTiles 0x957B 12
		.4byte	2, 2

		mGetTiles 0x9587 12
		.4byte	2, 3

		mGetTiles 0x9593 12
		.4byte	3, 4

		mGetTiles 0x959F 16
		.4byte	3, 5

		mGetTiles 0x95AF 12
		.4byte	3, 6

		mGetTiles 0x95BB 12
		.4byte	3, 7

		mGetTiles 0x95C7 12
		.4byte	3, 8

		mGetTiles 0x95D3 16
		.4byte	3, 9

		mGetTiles 0x95E3 16
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0181:
		.4byte anim_data__0181_0
