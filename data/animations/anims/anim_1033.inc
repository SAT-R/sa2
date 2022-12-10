
.align 2, 0
	anim_data__1033_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x2722D 34
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1033:
		.4byte anim_data__1033_0
