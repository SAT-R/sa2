
.align 2, 0
	anim_data__0563_0:
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1AB3D 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0563_1:
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1AB41 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0563:
		.4byte anim_data__0563_0
		.4byte anim_data__0563_1
