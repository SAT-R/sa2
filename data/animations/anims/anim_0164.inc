
.align 2, 0
	anim_data__0164_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8F51 20
		mAnimCmd6 0x0 0xB06F1FA
		.4byte	4, 0

		mGetTiles 0x8F65 20
		.4byte	4, 1

		mGetTiles 0x8F79 20
		.4byte	4, 2

		mGetTiles 0x8F8D 20
		.4byte	4, 3

		mGetTiles 0x8FA1 20
		.4byte	4, 4

		mGetTiles 0x8FB5 16
		.4byte	4, 5

		mGetTiles 0x8FC5 16
		.4byte	4, 6

		mGetTiles 0x8FD5 16
		.4byte	4, 7

		mJumpBack 0x2E

	anim_data__0164_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8FE5 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	4, 8

		mGetTiles 0x8FFE 25
		.4byte	4, 9

		mGetTiles 0x9017 20
		.4byte	4, 10

		mGetTiles 0x902B 20
		.4byte	4, 11

		mGetTiles 0x903F 25
		.4byte	4, 12

		mGetTiles 0x9058 20
		.4byte	4, 13

		mGetTiles 0x906C 20
		.4byte	4, 14

		mGetTiles 0x9080 25
		.4byte	4, 15

		mJumpBack 0x2E

	anim_data__0164_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x9099 25
		mAnimCmd6 0x0 0x906EDFA
		.4byte	4, 16

		mGetTiles 0x90B2 25
		.4byte	4, 17

		mGetTiles 0x90CB 20
		.4byte	4, 18

		mGetTiles 0x90DF 20
		.4byte	4, 19

		mGetTiles 0x90F3 25
		.4byte	4, 20

		mGetTiles 0x910C 20
		.4byte	4, 21

		mGetTiles 0x9120 20
		.4byte	4, 22

		mGetTiles 0x9134 25
		.4byte	4, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0164:
		.4byte anim_data__0164_0
		.4byte anim_data__0164_1
		.4byte anim_data__0164_2
