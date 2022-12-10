
.align 2, 0
	anim_data__0845_0:
		mGetPalette 0x2 16 0x50
		.4byte	12, -1

		mGetTiles 0x22E89 12
		.4byte	3, 0

		mGetTiles 0x22E95 15
		.4byte	4, 1

		mGetTiles 0x22EA4 12
		.4byte	3, 2

		mGetTiles 0x22EB0 9
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0845:
		.4byte anim_data__0845_0
