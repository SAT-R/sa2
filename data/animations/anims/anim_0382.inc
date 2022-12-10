
.align 2, 0
	anim_data__0382_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14CFA 15
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	3, 0

		mGetTiles 0x14D09 20
		.4byte	4, 1

		mGetTiles 0x14D1D 20
		.4byte	3, 2

		mGetTiles 0x14D31 30
		mAnimCmd6 0x0 0xE06F4FA
		mAnimCmd6 0x1 0xE18FAE8
		.4byte	2, 3

		mGetTiles 0x14D4F 20
		.4byte	2, 4

		mGetTiles 0x14D63 30
		.4byte	2, 5

		mGetTiles 0x14D81 24
		.4byte	2, 6

		mGetTiles 0x14D99 16
		.4byte	2, 7

		mGetTiles 0x14DA9 24
		.4byte	2, 8

		mJumpBack 0x24

	anim_data__0382_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14DC1 25
		mAnimCmd6 0x0 0xE06F4FA
		mAnimCmd6 0x1 0x0
		.4byte	4, 9

		mGetTiles 0x14DDA 24
		.4byte	3, 10

		mGetTiles 0x14DF2 24
		.4byte	3, 11

		mGetTiles 0x14E0A 24
		.4byte	3, 12

		mJumpBack 0xF


.align 2, 0
	anim_0382:
		.4byte anim_data__0382_0
		.4byte anim_data__0382_1
