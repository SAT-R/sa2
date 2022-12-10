
.align 2, 0
	anim_data__0223_0:
		mGetPalette 0x9 16 0x20
		mGetTiles 0xBF5C 20
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF516EDEB
		.4byte	2, 0

		mGetTiles 0xBF70 20
		.4byte	2, 1

		mGetTiles 0xBF84 30
		.4byte	2, 2

		mGetTiles 0xBFA2 25
		.4byte	2, 3

		mGetTiles 0xBFBB 20
		.4byte	2, 4

		mGetTiles 0xBFCF 20
		.4byte	2, 5

		mGetTiles 0xBFE3 30
		.4byte	2, 6

		mGetTiles 0xC001 25
		.4byte	2, 7

		mGetTiles 0xBF5C 20
		.4byte	2, 0

		mGetTiles 0xBF70 20
		.4byte	2, 1

		mGetTiles 0xBF84 30
		.4byte	2, 2

		mGetTiles 0xBFA2 25
		.4byte	2, 3

		mGetTiles 0xC01A 20
		.4byte	2, 8

		mGetTiles 0xC02E 20
		.4byte	2, 9

		mGetTiles 0xC042 30
		.4byte	2, 10

		mGetTiles 0xC001 25
		.4byte	2, 7

		mJumpBack 0x59

	anim_data__0223_1:
		mGetPalette 0x9 16 0x20
		mGetTiles 0xC060 16
		.4byte	2, 11

		mGetTiles 0xC070 24
		.4byte	4, 12

		mGetTiles 0xC088 24
		.4byte	2, 13

		mGetTiles 0xC0A0 24
		.4byte	2, 14

		mGetTiles 0xC0B8 36
		.4byte	2, 15

		mGetTiles 0xC0DC 30
		.4byte	2, 16

		mGetTiles 0xC0FA 24
		.4byte	2, 17

		mGetTiles 0xC112 20
		.4byte	2, 18

		mGetTiles 0xC126 30
		.4byte	2, 19

		mGetTiles 0xC144 30
		.4byte	2, 20

		mGetTiles 0xC162 36
		.4byte	2, 21

		mGetTiles 0xC186 25
		.4byte	2, 22

		mGetTiles 0xC19F 20
		.4byte	2, 23

		mGetTiles 0xC1B3 20
		.4byte	2, 24

		mGetTiles 0xC1C7 30
		.4byte	2, 25

		mGetTiles 0xC1E5 25
		.4byte	2, 26

		mGetTiles 0xC1FE 20
		.4byte	2, 27

		mGetTiles 0xC212 24
		.4byte	2, 28

		mJumpBack 0x50


.align 2, 0
	anim_0223:
		.4byte anim_data__0223_0
		.4byte anim_data__0223_1
