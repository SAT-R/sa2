

anim_balloon_variant_0:
	mGetPalette 0x3C, 16, 0xD0
	mGetTiles 0x19E66, 10
	mAnimCmd6 0x0, 0x909F2F7
	.4byte	10, 0

	mGetTiles 0x19E70, 10
	.4byte	10, 1

	mGetTiles 0x19E7A, 10
	.4byte	10, 2

	mGetTiles 0x19E70, 10
	.4byte	10, 1

	mJumpBack 0x1A

anim_balloon_variant_1:
	mGetPalette 0x3C, 16, 0xD0
	mGetTiles 0x19E84, 10
	mAnimCmd6 0x0, 0x909F2F7
	.4byte	10, 3

	mGetTiles 0x19E8E, 10
	.4byte	10, 4

	mGetTiles 0x19E98, 10
	.4byte	10, 5

	mGetTiles 0x19EA2, 10
	.4byte	15, 6

	mGetTiles 0x19EAC, 10
	.4byte	5, 7

	mGetTiles 0x19EB6, 10
	.4byte	10, 8

	mAnimCmd4 


anim_balloon:
	.4byte anim_balloon_variant_0
	.4byte anim_balloon_variant_1
