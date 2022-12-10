
.align 2, 0
	anim_data__0009_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x5B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 0

		mGetTiles 0x5F6 64
		.4byte	8, 1

		mGetTiles 0x636 64
		.4byte	8, 2

		mGetTiles 0x676 64
		.4byte	8, 3

		mGetTiles 0x6B6 64
		.4byte	8, 4

		mGetTiles 0x6F6 64
		.4byte	8, 5

		mGetTiles 0x736 64
		.4byte	8, 6

		mGetTiles 0x776 64
		.4byte	8, 7

		mJumpBack 0x2E

	anim_data__0009_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x7B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 8

		mGetTiles 0x7F6 64
		.4byte	8, 9

		mGetTiles 0x836 64
		.4byte	8, 10

		mGetTiles 0x876 64
		.4byte	8, 11

		mGetTiles 0x8B6 64
		.4byte	8, 12

		mGetTiles 0x8F6 64
		.4byte	8, 13

		mGetTiles 0x936 64
		.4byte	8, 14

		mGetTiles 0x976 64
		.4byte	8, 15

		mJumpBack 0x2E

	anim_data__0009_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x9B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 16

		mGetTiles 0x9F6 64
		.4byte	8, 17

		mGetTiles 0xA36 64
		.4byte	8, 18

		mGetTiles 0xA76 64
		.4byte	8, 19

		mGetTiles 0xAB6 64
		.4byte	8, 20

		mGetTiles 0xAF6 64
		.4byte	8, 21

		mGetTiles 0xB36 64
		.4byte	8, 22

		mGetTiles 0xB76 64
		.4byte	8, 23

		mJumpBack 0x2E

	anim_data__0009_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xBB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 24

		mGetTiles 0xBF6 64
		.4byte	8, 25

		mGetTiles 0xC36 64
		.4byte	8, 26

		mGetTiles 0xC76 64
		.4byte	8, 27

		mGetTiles 0xCB6 64
		.4byte	8, 28

		mGetTiles 0xCF6 64
		.4byte	8, 29

		mGetTiles 0xD36 64
		.4byte	8, 30

		mGetTiles 0xD76 64
		.4byte	8, 31

		mJumpBack 0x2E

	anim_data__0009_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xDB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 32

		mGetTiles 0xDF6 64
		.4byte	8, 33

		mGetTiles 0xE36 64
		.4byte	8, 34

		mGetTiles 0xE76 64
		.4byte	8, 35

		mGetTiles 0xEB6 64
		.4byte	8, 36

		mGetTiles 0xEF6 64
		.4byte	8, 37

		mGetTiles 0xF36 64
		.4byte	8, 38

		mGetTiles 0xF76 64
		.4byte	8, 39

		mJumpBack 0x2E

	anim_data__0009_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xDB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 32

		mGetTiles 0xDF6 64
		.4byte	8, 33

		mGetTiles 0xE36 64
		.4byte	8, 34

		mGetTiles 0xE76 64
		.4byte	8, 35

		mGetTiles 0xEB6 64
		.4byte	8, 36

		mGetTiles 0xEF6 64
		.4byte	8, 37

		mGetTiles 0xF36 64
		.4byte	8, 38

		mGetTiles 0xF76 64
		.4byte	8, 39

		mJumpBack 0x2E


.align 2, 0
	anim_0009:
		.4byte anim_data__0009_0
		.4byte anim_data__0009_1
		.4byte anim_data__0009_2
		.4byte anim_data__0009_3
		.4byte anim_data__0009_4
		.4byte anim_data__0009_5
