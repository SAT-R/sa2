

anim_data__0369_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x135EC, 20
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	1, 0

	mGetTiles 0x13600, 20
	.4byte	1, 1

	mAnimCmd4 


anim_0369:
	.4byte anim_data__0369_0
