

anim_arrow_screen_variant_0:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B45E 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 0

	mGetTiles 0x1B466 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 1

	mGetTiles 0x1B46E 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 2

	mGetTiles 0x1B476 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 3

	mGetTiles 0x1B47E 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 4

	mJumpBack 0x2B

anim_arrow_screen_variant_1:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B486 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 5

	mGetTiles 0x1B48E 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 6

	mGetTiles 0x1B496 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 7

	mGetTiles 0x1B49E 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 8

	mGetTiles 0x1B4A6 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	5, 9

	mJumpBack 0x2B

anim_arrow_screen_variant_2:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B4AE 8
	mAnimCmd6 0x0 0x1818E8E8
	.4byte	1, 10

	mAnimCmd4 


anim_arrow_screen:
	.4byte anim_arrow_screen_variant_0
	.4byte anim_arrow_screen_variant_1
	.4byte anim_arrow_screen_variant_2
