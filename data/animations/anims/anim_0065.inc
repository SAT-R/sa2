

anim_data__0065_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3947 25
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 0

	mGetTiles 0x3960 25
	.4byte	2, 1

	mGetTiles 0x3979 30
	.4byte	2, 2

	mGetTiles 0x3997 24
	.4byte	2, 3

	mGetTiles 0x39AF 30
	.4byte	2, 4

	mGetTiles 0x39CD 30
	.4byte	2, 5

	mGetTiles 0x39EB 30
	.4byte	2, 6

	mGetTiles 0x3A09 24
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0065_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3A21 24
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 8

	mGetTiles 0x3A39 20
	.4byte	3, 9

	mGetTiles 0x3A4D 20
	.4byte	3, 10

	mGetTiles 0x3A61 20
	.4byte	3, 11

	mAnimCmd4 

anim_data__0065_2:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3A75 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 12

	mGetTiles 0x3A89 20
	.4byte	3, 13

	mGetTiles 0x3A9D 20
	.4byte	3, 14

	mJumpBack 0x15


anim_0065:
	.4byte anim_data__0065_0
	.4byte anim_data__0065_1
	.4byte anim_data__0065_2
