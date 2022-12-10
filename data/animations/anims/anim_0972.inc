
.align 2, 0
	anim_data__0972_0:
		mGetPalette 0x2C0 16 0x60
		mGetTiles 0x255A8 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0972:
		.4byte anim_data__0972_0
