

anim_data__0482_0:
	mGetPalette 0x35 16 0xC0
	mGetTiles 0x197D5 16
	mAnimCmd6 0x0 0x90DFBF6
	.4byte	2, 0

	mGetTiles 0x197E5 16
	mAnimCmd6 0x0 0x90DFBF6
	.4byte	2, 1

	mJumpBack 0x13

anim_data__0482_1:
	mGetPalette 0x35 16 0xC0
	mGetTiles 0x197F5 20
	mAnimCmd6 0x0 0x1207FCF6
	.4byte	2, 2

	mGetTiles 0x19809 20
	mAnimCmd6 0x0 0x1207FCF6
	.4byte	2, 3

	mJumpBack 0x13

anim_data__0482_2:
	mGetPalette 0x35 16 0xC0
	mGetTiles 0x1981D 16
	mAnimCmd6 0x0 0x907FBFA
	.4byte	5, 4

	mAnimCmd4 


anim_0482:
	.4byte anim_data__0482_0
	.4byte anim_data__0482_1
	.4byte anim_data__0482_2
