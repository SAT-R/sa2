

anim_cheese_waving_player_variant_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x182B0, 9
	.4byte	5, 0

	mGetTiles 0x182B9, 9
	.4byte	5, 1

	mGetTiles 0x182C2, 9
	.4byte	5, 2

	mGetTiles 0x182CB, 9
	.4byte	5, 3

	mGetTiles 0x182D4, 9
	.4byte	5, 4

	mGetTiles 0x182DD, 9
	.4byte	5, 5

	mGetTiles 0x182E6, 9
	.4byte	5, 6

	mGetTiles 0x182CB, 9
	.4byte	5, 3

	mGetTiles 0x182EF, 9
	.4byte	5, 7

	mGetTiles 0x182F8, 9
	.4byte	5, 8

	mJumpBack 0x28


anim_cheese_waving_player:
	.4byte anim_cheese_waving_player_variant_0
