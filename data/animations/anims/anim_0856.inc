
.align 2, 0
	anim_data__0856_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x2332D 2
		.4byte	3, 0

		mGetTiles 0x2332F 8
		.4byte	3, 1

		mGetTiles 0x23337 8
		.4byte	3, 2

		mGetTiles 0x2333F 5
		.4byte	3, 3

		mGetTiles 0x23344 5
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0856:
		.4byte anim_data__0856_0
