

anim_data__0738_0:
	mGetPalette 0xAD, 16, 0x30
	mGetTiles 0x1EC4C, 24
	.4byte	1, 0

	mAnimCmd4 

anim_data__0738_1:
	mGetPalette 0xAD, 16, 0x30
	mGetTiles 0x1EC64, 24
	.4byte	3, 1

	mGetTiles 0x1EC7C, 24
	.4byte	3, 2

	mGetTiles 0x1EC94, 24
	.4byte	3, 3

	mGetTiles 0x1ECAC, 24
	.4byte	3, 4

	mJumpBack 0x17


anim_0738:
	.4byte anim_data__0738_0
	.4byte anim_data__0738_1
