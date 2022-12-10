
.align 2, 0
	anim_data__1094_0:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29CDB 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1094_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x29CFF 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1094_2:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29D25 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1094_3:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29DCD 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1094:
		.4byte anim_data__1094_0
		.4byte anim_data__1094_1
		.4byte anim_data__1094_2
		.4byte anim_data__1094_3
