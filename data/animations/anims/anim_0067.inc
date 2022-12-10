

anim_data__0067_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3BE8 36
	mAnimCmd6 0x0 0x1206F4FA
	.4byte	5, 0

	mGetTiles 0x3C0C 25
	.4byte	5, 1

	mGetTiles 0x3C25 16
	.4byte	5, 2

	mGetTiles 0x3C35 25
	.4byte	5, 3

	mGetTiles 0x3C4E 36
	.4byte	5, 4

	mGetTiles 0x3C72 20
	.4byte	5, 5

	mGetTiles 0x3C86 16
	.4byte	5, 6

	mGetTiles 0x3C96 20
	.4byte	5, 7

	mJumpBack 0x2E


anim_0067:
	.4byte anim_data__0067_0
