
.align 2, 0
	anim_data__0235_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC9E2 25
		mAnimCmd6 0x0 0xB06F5FA
		.4byte	4, 0

		mGetTiles 0xC9FB 25
		.4byte	4, 1

		mGetTiles 0xCA14 24
		.4byte	4, 2

		mGetTiles 0xCA2C 24
		.4byte	4, 3

		mGetTiles 0xCA44 20
		.4byte	4, 4

		mGetTiles 0xCA58 25
		.4byte	4, 5

		mGetTiles 0xCA71 20
		.4byte	4, 6

		mGetTiles 0xCA85 24
		.4byte	4, 7

		mGetTiles 0xCA9D 35
		.4byte	4, 8

		mGetTiles 0xCAC0 20
		.4byte	4, 9

		mGetTiles 0xCAD4 25
		.4byte	4, 10

		mGetTiles 0xCAED 35
		.4byte	3, 11

		mGetTiles 0xCB10 35
		.4byte	3, 12

		mGetTiles 0xCB33 35
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0235:
		.4byte anim_data__0235_0
