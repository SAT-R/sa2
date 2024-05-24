

anim_cheese_sideways_variant_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x17DC4, 9
	.4byte	3, 0

	mGetTiles 0x17DCD, 9
	.4byte	3, 1

	mJumpBack 0xD


anim_cheese_sideways:
	.4byte anim_cheese_sideways_variant_0
