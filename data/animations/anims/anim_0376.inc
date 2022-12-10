

anim_data__0376_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1479C 16
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	1, 0

	mGetTiles 0x147AC 16
	.4byte	1, 1

	mGetTiles 0x147BC 16
	.4byte	1, 2

	mAnimCmd4 


anim_0376:
	.4byte anim_data__0376_0
