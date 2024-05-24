

anim_data__1050_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x275A5, 1
	.4byte	7, 0

	mGetTiles 0x275A6, 2
	.4byte	7, 1

	mGetTiles 0x275A8, 2
	.4byte	7, 2

	mGetTiles 0x275AA, 2
	.4byte	7, 3

	mJumpBack 0x17

anim_data__1050_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x275AC, 1
	.4byte	7, 4

	mGetTiles 0x275AD, 2
	.4byte	7, 5

	mGetTiles 0x275AF, 2
	.4byte	7, 6

	mGetTiles 0x275B1, 2
	.4byte	7, 7

	mJumpBack 0x17


anim_1050:
	.4byte anim_data__1050_0
	.4byte anim_data__1050_1
