

anim_data__0338_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x120E6 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 0

	mGetTiles 0x12104 30
	.4byte	2, 1

	mGetTiles 0x12122 36
	.4byte	2, 2

	mGetTiles 0x12146 30
	.4byte	2, 3

	mGetTiles 0x12164 36
	.4byte	2, 4

	mGetTiles 0x12188 36
	.4byte	2, 5

	mGetTiles 0x121AC 30
	.4byte	2, 6

	mGetTiles 0x121CA 30
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0338_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x121E8 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 8

	mGetTiles 0x12206 25
	.4byte	3, 9

	mGetTiles 0x1221F 30
	.4byte	3, 10

	mGetTiles 0x1223D 30
	.4byte	3, 11

	mAnimCmd4 

anim_data__0338_2:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1225B 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 12

	mGetTiles 0x12279 30
	.4byte	3, 13

	mGetTiles 0x12297 30
	.4byte	3, 14

	mJumpBack 0x15


anim_0338:
	.4byte anim_data__0338_0
	.4byte anim_data__0338_1
	.4byte anim_data__0338_2
