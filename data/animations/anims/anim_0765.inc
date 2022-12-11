

anim_data__0765_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x1FA2F 42
	.4byte	3, 0

	mGetTiles 0x1FA59 42
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0765_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x1FA83 16
	.4byte	1, 2

	mGetTiles 0x1FA93 16
	.4byte	1, 3

	mGetTiles 0x1FAA3 16
	.4byte	12, 4

	mGetTiles 0x1FA93 16
	.4byte	2, 3

	mGetTiles 0x1FA83 16
	.4byte	2, 2

	mAnimCmd4 


anim_0765:
	.4byte anim_data__0765_0
	.4byte anim_data__0765_1
