
.align 2, 0
	anim_data__0630_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BBF0 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0630:
		.4byte anim_data__0630_0
