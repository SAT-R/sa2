

anim_circus_proj_variant_0:
	mGetPalette 0x3A 16 0xD0
	mGetTiles 0x19CD0 16
	mAnimCmd6 0x0 0xE70AD6F9
	.4byte	1, 0

	mAnimCmd4 

anim_circus_proj_variant_1:
	mGetPalette 0x3A 16 0xD0
	mGetTiles 0x19CD0 16
	mAnimCmd6 0x0 0xE70AD6F9
	.4byte	3, 0

	mGetTiles 0x19CE0 16
	.4byte	3, 1

	mGetTiles 0x19CF0 16
	.4byte	3, 2

	mGetTiles 0x19D00 16
	.4byte	3, 3

	mJumpBack 0x1A

anim_circus_proj_variant_2:
	mGetPalette 0x3A 16 0xD0
	mGetTiles 0x19D10 16
	mAnimCmd6 0x0 0x909F8F8
	.4byte	5, 4

	mGetTiles 0x19D20 16
	.4byte	5, 5

	mGetTiles 0x19D30 16
	.4byte	5, 6

	mGetTiles 0x19D40 16
	.4byte	5, 7

	mJumpBack 0x1A


anim_circus_proj:
	.4byte anim_circus_proj_variant_0
	.4byte anim_circus_proj_variant_1
	.4byte anim_circus_proj_variant_2
