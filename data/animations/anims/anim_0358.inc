

anim_data__0358_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12CBE, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	1, 0

	mAnimCmd4 

anim_data__0358_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12CD2, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	1, 1

	mAnimCmd4 


anim_0358:
	.4byte anim_data__0358_0
	.4byte anim_data__0358_1
