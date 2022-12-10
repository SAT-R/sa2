
.align 2, 0
	anim_data__0381_0:
		mGetPalette 0x1F 16 0x0
		mGetTiles 0x14B56 24
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xE0EF2F2
		.4byte	2, 0

		mGetTiles 0x14B6E 35
		.4byte	3, 1

		mGetTiles 0x14B91 30
		.4byte	2, 2

		mGetTiles 0x14BAF 25
		.4byte	2, 3

		mGetTiles 0x14BC8 20
		.4byte	1, 4

		mGetTiles 0x14BDC 30
		.4byte	1, 5

		mGetTiles 0x14BFA 20
		.4byte	1, 6

		mGetTiles 0x14C0E 30
		.4byte	1, 7

		mGetTiles 0x14C2C 15
		.4byte	1, 8

		mGetTiles 0x14C3B 30
		.4byte	1, 9

		mGetTiles 0x14C59 24
		.4byte	1, 10

		mGetTiles 0x14C71 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	1, 11

		mGetTiles 0x14C85 20
		.4byte	1, 12

		mGetTiles 0x14C99 25
		.4byte	1, 13

		mGetTiles 0x14CB2 24
		.4byte	3, 14

		mGetTiles 0x14CCA 24
		.4byte	3, 15

		mGetTiles 0x14CE2 24
		.4byte	3, 16

		mJumpBack 0xF


.align 2, 0
	anim_0381:
		.4byte anim_data__0381_0
