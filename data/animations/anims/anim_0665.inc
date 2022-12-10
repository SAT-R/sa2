
.align 2, 0
	anim_data__0665_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1CA99 8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0665:
		.4byte anim_data__0665_0
