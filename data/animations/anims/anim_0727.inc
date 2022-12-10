
.align 2, 0
	anim_data__0727_0:
		mGetTiles 0x1D9CD 16
		mGetPalette 0xA1 16 0x60
		mPlaySoundEffect 117
		.4byte	4, 0

		.4byte	4, 1

		.4byte	4, 2

		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0727:
		.4byte anim_data__0727_0
