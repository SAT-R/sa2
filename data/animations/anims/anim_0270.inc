
.align 2, 0
	anim_data__0270_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE61F 16
		.4byte	6, 0

		mGetTiles 0xE62F 20
		.4byte	6, 1

		mGetTiles 0xE643 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0270_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE657 24
		.4byte	6, 3

		mGetTiles 0xE66F 30
		.4byte	6, 4

		mGetTiles 0xE68D 30
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0270:
		.4byte anim_data__0270_0
		.4byte anim_data__0270_1
