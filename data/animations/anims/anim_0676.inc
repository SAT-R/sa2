
.align 2, 0
	anim_data__0676_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBDA 1
		.4byte	3, 0

		mGetTiles 0x1CBDB 4
		.4byte	3, 1

		mGetTiles 0x1CBDF 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0676:
		.4byte anim_data__0676_0
