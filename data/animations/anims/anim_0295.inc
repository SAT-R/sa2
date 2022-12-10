

anim_data__0295_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xFE8F 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0xFEA3 25
	.4byte	3, 1

	mGetTiles 0xFEBC 30
	.4byte	3, 2

	mGetTiles 0xFEDA 30
	.4byte	3, 3

	mGetTiles 0xFEF8 30
	.4byte	3, 4

	mGetTiles 0xFF16 30
	.4byte	3, 5

	mGetTiles 0xFF34 30
	.4byte	3, 6

	mJumpBack 0xF

anim_data__0295_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xFF52 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	1, 7

	mGetTiles 0xFF70 16
	mAnimCmd6 0x0 0x1006FAFA
	.4byte	1, 8

	mGetTiles 0xFF80 16
	.4byte	1, 9

	mGetTiles 0xFF90 16
	.4byte	2, 10

	mGetTiles 0xFF80 16
	.4byte	1, 9

	mGetTiles 0xFF70 16
	.4byte	1, 8

	mAnimCmd4 


anim_0295:
	.4byte anim_data__0295_0
	.4byte anim_data__0295_1
