

anim_data__0862_0:
	mGetPalette 0xA4, 16, 0x60
	mGetTiles 0x233CF, 9
	.4byte	3, 0

	mGetTiles 0x233D8, 16
	.4byte	3, 1

	mGetTiles 0x233E8, 16
	.4byte	3, 2

	mGetTiles 0x233F8, 16
	.4byte	3, 3

	mGetTiles 0x23408, 16
	.4byte	3, 4

	mAnimCmd4 


anim_0862:
	.4byte anim_data__0862_0
