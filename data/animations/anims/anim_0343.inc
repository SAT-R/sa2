

anim_data__0343_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x12741, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x12751, 16
	.4byte	2, 1

	mGetTiles 0x12761, 16
	.4byte	2, 2

	mGetTiles 0x12771, 16
	.4byte	2, 3

	mGetTiles 0x12781, 16
	.4byte	2, 4

	mGetTiles 0x12791, 16
	.4byte	2, 5

	mGetTiles 0x127A1, 16
	.4byte	2, 6

	mGetTiles 0x127B1, 16
	.4byte	2, 7

	mJumpBack 0x31


anim_0343:
	.4byte anim_data__0343_0
