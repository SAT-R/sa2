

anim_data__0087_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x45D8, 36
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	2, 0

	mGetTiles 0x45FC, 30
	.4byte	2, 1

	mJumpBack 0x10

anim_data__0087_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x461A, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 2

	mAnimCmd4 

anim_data__0087_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x462E, 30
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	2, 3

	mGetTiles 0x464C, 30
	.4byte	2, 4

	mJumpBack 0x10

anim_data__0087_3:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x466A, 25
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 5

	mAnimCmd4 


anim_0087:
	.4byte anim_data__0087_0
	.4byte anim_data__0087_1
	.4byte anim_data__0087_2
	.4byte anim_data__0087_3
