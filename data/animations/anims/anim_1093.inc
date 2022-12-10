
.align 2, 0
	anim_data__1093_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CBF 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1093_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CC9 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1093_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CD3 8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1093:
		.4byte anim_data__1093_0
		.4byte anim_data__1093_1
		.4byte anim_data__1093_2
