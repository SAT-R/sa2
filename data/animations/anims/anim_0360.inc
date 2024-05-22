

anim_data__0360_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12F20, 36
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	2, 0

	mGetTiles 0x12F44, 36
	.4byte	2, 1

	mJumpBack 0x10

anim_data__0360_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12F68, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 2

	mAnimCmd4 

anim_data__0360_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12F7C, 30
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	2, 3

	mGetTiles 0x12F9A, 30
	.4byte	2, 4

	mJumpBack 0x10

anim_data__0360_3:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12FB8, 25
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 5

	mAnimCmd4 


anim_0360:
	.4byte anim_data__0360_0
	.4byte anim_data__0360_1
	.4byte anim_data__0360_2
	.4byte anim_data__0360_3
