
.align 2, 0
	anim_data__0619_0:
		mGetTiles 0x1BAE0 80
		mGetPalette 0x4B 16 0xA0
		.4byte	4, 0

		.4byte	4, 1

		.4byte	4, 2

		.4byte	4, 3

		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0619:
		.4byte anim_data__0619_0
