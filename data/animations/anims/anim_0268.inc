
.align 2, 0
	anim_data__0268_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE3BD 16
		.4byte	3, 0

		mGetTiles 0xE3CD 20
		.4byte	3, 1

		mGetTiles 0xE3E1 16
		.4byte	3, 2

		mGetTiles 0xE3F1 20
		.4byte	3, 3

		mGetTiles 0xE405 20
		.4byte	3, 4

		mGetTiles 0xE419 16
		.4byte	3, 5

		mJumpBack 0x21

	anim_data__0268_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE429 20
		.4byte	3, 6

		mGetTiles 0xE43D 25
		.4byte	3, 7

		mGetTiles 0xE456 20
		.4byte	3, 8

		mGetTiles 0xE46A 20
		.4byte	3, 9

		mGetTiles 0xE47E 25
		.4byte	3, 10

		mGetTiles 0xE497 20
		.4byte	3, 11

		mJumpBack 0x21

	anim_data__0268_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE4AB 16
		.4byte	3, 12

		mGetTiles 0xE4BB 16
		.4byte	3, 13

		mGetTiles 0xE4CB 16
		.4byte	3, 14

		mGetTiles 0xE4DB 16
		.4byte	3, 15

		mGetTiles 0xE4EB 16
		.4byte	3, 16

		mGetTiles 0xE4FB 16
		.4byte	3, 17

		mJumpBack 0x21

	anim_data__0268_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE50B 20
		.4byte	3, 18

		mGetTiles 0xE51F 20
		.4byte	3, 19

		mGetTiles 0xE533 20
		.4byte	3, 20

		mGetTiles 0xE547 20
		.4byte	3, 21

		mGetTiles 0xE55B 20
		.4byte	3, 22

		mGetTiles 0xE56F 20
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0268:
		.4byte anim_data__0268_0
		.4byte anim_data__0268_1
		.4byte anim_data__0268_2
		.4byte anim_data__0268_3
