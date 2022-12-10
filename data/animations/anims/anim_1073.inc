
.align 2, 0
	anim_data__1073_0:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x2893B 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1073_1:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x2896D 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1073_2:
		mGetPalette 0x2CA 16 0x10
		mGetTiles 0x28993 32
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1073_3:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x289B3 168
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1073_4:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x28A5B 168
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1073:
		.4byte anim_data__1073_0
		.4byte anim_data__1073_1
		.4byte anim_data__1073_2
		.4byte anim_data__1073_3
		.4byte anim_data__1073_4
