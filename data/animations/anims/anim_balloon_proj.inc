

anim_balloon_proj_variant_0:
	mGetPalette 0x3C, 16, 0xD0
	mGetTiles 0x19EC0, 2
	mAnimCmd6 0x0, 0x302FAFE
	.4byte	3, 0

	mGetTiles 0x19EC2, 3
	.4byte	3, 1

	mJumpBack 0x10


anim_balloon_proj:
	.4byte anim_balloon_proj_variant_0
