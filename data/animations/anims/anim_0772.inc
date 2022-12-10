
.align 2, 0
	anim_data__0772_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1FD9F 16
		.4byte	10, 0

		mGetTiles 0x1FDAF 20
		.4byte	8, 1

		mGetTiles 0x1FDC3 15
		.4byte	6, 2

		mGetTiles 0x1FDC3 15
		.4byte	6, 2

		mAnimCmd4 


.align 2, 0
	anim_0772:
		.4byte anim_data__0772_0
