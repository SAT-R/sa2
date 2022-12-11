

anim_data__0431_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1721A 25
	mAnimCmd6 0x0 0x1206F8FA
	.4byte	5, 0

	mGetTiles 0x17233 20
	.4byte	5, 1

	mGetTiles 0x17247 20
	.4byte	5, 2

	mGetTiles 0x1725B 16
	.4byte	5, 3

	mGetTiles 0x1726B 25
	.4byte	5, 4

	mGetTiles 0x17284 20
	.4byte	5, 5

	mGetTiles 0x17298 20
	.4byte	5, 6

	mGetTiles 0x172AC 20
	.4byte	5, 7

	mJumpBack 0x2E


anim_0431:
	.4byte anim_data__0431_0
