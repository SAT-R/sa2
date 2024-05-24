

anim_data__0860_0:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x23385, 2
	.4byte	3, 0

	mGetTiles 0x23387, 4
	.4byte	3, 1

	mGetTiles 0x2338B, 4
	.4byte	3, 2

	mGetTiles 0x2338F, 4
	.4byte	3, 3

	mGetTiles 0x23393, 2
	.4byte	3, 4

	mAnimCmd4 


anim_0860:
	.4byte anim_data__0860_0
