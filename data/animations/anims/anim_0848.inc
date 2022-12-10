
.align 2, 0
	anim_data__0848_0:
		mGetTiles 0x22F5D 32
		mGetPalette 0x17 16 0x40
		.4byte	2, 0

		.4byte	2, 1

		.4byte	2, 2

		mAnimCmd6 0x0 0x27412741
		.4byte	2, 3

		.4byte	2, 4

		.4byte	2, 5

		.4byte	2, 6

		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0848:
		.4byte anim_data__0848_0
