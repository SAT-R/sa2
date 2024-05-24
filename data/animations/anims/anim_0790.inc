

anim_data__0790_0:
	mGetPalette 0xCA, 16, 0x10
	mGetTiles 0x2134B, 30
	.4byte	3, 0

	mGetTiles 0x21369, 30
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0790_1:
	mGetPalette 0xCB, 16, 0x10
	mGetTiles 0x21387, 30
	.4byte	3, 2

	mGetTiles 0x213A5, 30
	.4byte	3, 3

	mJumpBack 0xD


anim_0790:
	.4byte anim_data__0790_0
	.4byte anim_data__0790_1
