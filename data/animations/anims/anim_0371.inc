

anim_data__0371_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1365C 20
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	2, 0

	mGetTiles 0x13670 25
	.4byte	2, 1

	mGetTiles 0x13689 25
	.4byte	2, 2

	mJumpBack 0xA

anim_data__0371_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x136A2 16
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	2, 3

	mAnimCmd4 


anim_0371:
	.4byte anim_data__0371_0
	.4byte anim_data__0371_1
