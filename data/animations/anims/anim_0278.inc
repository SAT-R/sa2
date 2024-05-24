

anim_data__0278_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xEBE8, 20
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	1, 0

	mGetTiles 0xEBFC, 20
	.4byte	1, 1

	mAnimCmd4 


anim_0278:
	.4byte anim_data__0278_0
