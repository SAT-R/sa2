
.align 2, 0
	anim_data__0190_0:
		mGetPalette 0xB 16 0x0
		mGetTiles 0x9CF7 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x9D0F 28
		.4byte	4, 1

		mGetTiles 0x9D2B 28
		.4byte	4, 2

		mJumpBack 0xA

	anim_data__0190_1:
		mGetPalette 0xB 16 0x0
		mGetTiles 0x9CF7 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	4, 0

		mGetTiles 0x9D47 24
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0190:
		.4byte anim_data__0190_0
		.4byte anim_data__0190_1
