

anim_data__0180_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x94FB 16
	.4byte	2, 0

	mGetTiles 0x950B 16
	.4byte	2, 1

	mGetTiles 0x951B 16
	.4byte	2, 2

	mGetTiles 0x952B 16
	.4byte	2, 3

	mGetTiles 0x953B 16
	.4byte	2, 4

	mGetTiles 0x954B 16
	.4byte	2, 5

	mJumpBack 0x21


anim_0180:
	.4byte anim_data__0180_0
