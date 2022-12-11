

anim_data__0698_0:
	mGetPalette 0x99 16 0x80
	mGetTiles 0x1D16F 6
	mAnimCmd6 0x0 0xFF06EDFA
	.4byte	3, 0

	mGetTiles 0x1D175 6
	.4byte	3, 1

	mGetTiles 0x1D17B 6
	.4byte	3, 2

	mGetTiles 0x1D181 6
	.4byte	3, 3

	mJumpBack 0x1A


anim_0698:
	.4byte anim_data__0698_0
