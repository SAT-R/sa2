

anim_data__0189_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x9CA3 20
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0x9CB7 20
	.4byte	4, 1

	mGetTiles 0x9CCB 20
	.4byte	4, 2

	mJumpBack 0xA

anim_data__0189_1:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x9CDF 24
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	4, 3

	mAnimCmd4 


anim_0189:
	.4byte anim_data__0189_0
	.4byte anim_data__0189_1
