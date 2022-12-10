
.align 2, 0
	anim_data__0144_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7CFA 20
		mAnimCmd6 0x0 0x506EFFA
		.4byte	4, 0

		mGetTiles 0x7D0E 20
		.4byte	4, 1

		mGetTiles 0x7D22 15
		.4byte	4, 2

		mGetTiles 0x7D31 20
		.4byte	4, 3

		mGetTiles 0x7D45 24
		.4byte	4, 4

		mGetTiles 0x7D5D 25
		.4byte	4, 5

		mGetTiles 0x7D76 20
		.4byte	4, 6

		mGetTiles 0x7D8A 20
		.4byte	4, 7

		mGetTiles 0x7D9E 16
		.4byte	4, 8

		mGetTiles 0x7DAE 20
		.4byte	4, 9

		mGetTiles 0x7DC2 25
		.4byte	4, 10

		mGetTiles 0x7DDB 24
		.4byte	2, 11

		mGetTiles 0x7DF3 28
		.4byte	3, 12

		mGetTiles 0x7E0F 28
		.4byte	3, 13

		mGetTiles 0x7E2B 28
		.4byte	3, 14

		mJumpBack 0xF


.align 2, 0
	anim_0144:
		.4byte anim_data__0144_0
