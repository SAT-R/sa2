

anim_data__0859_0:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x23375, 2
	.4byte	3, 0

	mGetTiles 0x23377, 4
	.4byte	3, 1

	mGetTiles 0x2337B, 4
	.4byte	3, 2

	mGetTiles 0x2337F, 4
	.4byte	3, 3

	mGetTiles 0x23383, 2
	.4byte	3, 4

	mAnimCmd4 


anim_0859:
	.4byte anim_data__0859_0
