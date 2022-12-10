
.align 2, 0
	anim_data__0588_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B23B 2
		.4byte	5, 0

		mGetTiles 0x1B23D 2
		.4byte	5, 1

		mGetTiles 0x1B23F 2
		.4byte	5, 2

		mGetTiles 0x1B241 2
		.4byte	5, 3

		mGetTiles 0x1B243 2
		.4byte	5, 4

		mGetTiles 0x1B245 2
		.4byte	5, 5

		mGetTiles 0x1B247 2
		.4byte	5, 6

		mGetTiles 0x1B249 2
		.4byte	5, 7

		mJumpBack 0x2B

	anim_data__0588_1:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B24B 1
		.4byte	5, 8

		mGetTiles 0x1B24C 1
		.4byte	5, 9

		mGetTiles 0x1B24D 1
		.4byte	5, 10

		mGetTiles 0x1B24E 1
		.4byte	5, 11

		mGetTiles 0x1B24F 1
		.4byte	5, 12

		mGetTiles 0x1B250 1
		.4byte	5, 13

		mGetTiles 0x1B251 1
		.4byte	5, 14

		mGetTiles 0x1B252 1
		.4byte	5, 15

		mJumpBack 0x2B

	anim_data__0588_2:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B253 1
		.4byte	5, 16

		mGetTiles 0x1B254 1
		.4byte	5, 17

		mGetTiles 0x1B255 1
		.4byte	5, 18

		mGetTiles 0x1B256 1
		.4byte	5, 19

		mGetTiles 0x1B257 1
		.4byte	5, 20

		mGetTiles 0x1B258 1
		.4byte	5, 21

		mGetTiles 0x1B259 1
		.4byte	5, 22

		mGetTiles 0x1B254 1
		.4byte	5, 17

		mJumpBack 0x2B


.align 2, 0
	anim_0588:
		.4byte anim_data__0588_0
		.4byte anim_data__0588_1
		.4byte anim_data__0588_2
