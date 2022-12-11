

anim_data__0203_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0xB2E6 25
	mAnimCmd6 0x0 0xA06F6FA
	mAnimCmd6 0x1 0xF511EDEF
	.4byte	1, 0

	mGetTiles 0xB2FF 25
	mAnimCmd6 0x0 0xA06F6FA
	mAnimCmd6 0x1 0xF511EDEF
	.4byte	1, 1

	mAnimCmd4 


anim_0203:
	.4byte anim_data__0203_0
