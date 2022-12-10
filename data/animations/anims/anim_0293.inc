
.align 2, 0
	anim_data__0293_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE11 24
		mAnimCmd6 0x0 0x610F8FA
		mAnimCmd6 0x1 0x902F4F4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0293_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE29 24
		mAnimCmd6 0x0 0x60CF8F6
		mAnimCmd6 0x1 0x9FEF4F0
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0293_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE41 24
		mAnimCmd6 0x0 0x608F8F2
		mAnimCmd6 0x1 0x910F402
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0293_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE59 24
		mAnimCmd6 0x0 0x604F8EE
		mAnimCmd6 0x1 0x90CF4FE
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0293:
		.4byte anim_data__0293_0
		.4byte anim_data__0293_1
		.4byte anim_data__0293_2
		.4byte anim_data__0293_3
