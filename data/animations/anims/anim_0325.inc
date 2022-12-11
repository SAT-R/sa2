

anim_data__0325_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x11381 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x11395 20
	.4byte	3, 1

	mGetTiles 0x113A9 20
	.4byte	3, 2

	mGetTiles 0x113BD 20
	.4byte	3, 3

	mJumpBack 0xF

anim_data__0325_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x113D1 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 4

	mGetTiles 0x113E5 20
	.4byte	3, 5

	mGetTiles 0x113F9 20
	.4byte	3, 6

	mGetTiles 0x1140D 25
	.4byte	3, 7

	mGetTiles 0x11426 30
	.4byte	3, 8

	mGetTiles 0x11444 30
	.4byte	3, 9

	mAnimCmd4 

anim_data__0325_2:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x11462 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 10

	mGetTiles 0x11480 30
	.4byte	3, 11

	mGetTiles 0x1149E 30
	.4byte	3, 12

	mJumpBack 0x15


anim_0325:
	.4byte anim_data__0325_0
	.4byte anim_data__0325_1
	.4byte anim_data__0325_2
