

anim_data__0420_0:
	mGetPalette 0x1D, 16, 0x0
	mGetTiles 0x16552, 20
	mAnimCmd6 0x0, 0xD06F0FA
	.4byte	3, 0

	mGetTiles 0x16566, 20
	.4byte	3, 1

	mGetTiles 0x1657A, 20
	.4byte	3, 2

	mGetTiles 0x16552, 20
	.4byte	3, 0

	mGetTiles 0x16566, 20
	.4byte	3, 1

	mGetTiles 0x1657A, 20
	.4byte	3, 2

	mGetTiles 0x1658E, 20
	.4byte	3, 3

	mGetTiles 0x165A2, 20
	.4byte	2, 4

	mGetTiles 0x165B6, 20
	.4byte	2, 5

	mGetTiles 0x165CA, 24
	.4byte	4, 6

	mGetTiles 0x165E2, 20
	.4byte	2, 7

	mGetTiles 0x165F6, 24
	.4byte	2, 8

	mGetTiles 0x1660E, 24
	.4byte	3, 9

	mGetTiles 0x16626, 30
	.4byte	3, 10

	mGetTiles 0x16644, 25
	.4byte	3, 11

	mGetTiles 0x1665D, 24
	.4byte	3, 12

	mGetTiles 0x16675, 30
	.4byte	3, 13

	mGetTiles 0x16693, 25
	.4byte	3, 14

	mGetTiles 0x166AC, 24
	.4byte	3, 15

	mGetTiles 0x166C4, 24
	.4byte	3, 16

	mGetTiles 0x166DC, 25
	.4byte	3, 17

	mGetTiles 0x166F5, 18
	.4byte	3, 18

	mGetTiles 0x16707, 25
	.4byte	3, 19

	mGetTiles 0x16720, 20
	.4byte	3, 20

	mGetTiles 0x16734, 18
	.4byte	3, 21

	mGetTiles 0x16746, 24
	.4byte	3, 22

	mGetTiles 0x1675E, 24
	.4byte	3, 23

	mGetTiles 0x16776, 24
	.4byte	3, 24

	mGetTiles 0x1678E, 18
	.4byte	3, 25

	mGetTiles 0x167A0, 20
	.4byte	3, 26

	mGetTiles 0x167B4, 25
	.4byte	3, 27

	mGetTiles 0x167CD, 24
	.4byte	3, 28

	mGetTiles 0x167E5, 24
	.4byte	3, 29

	mGetTiles 0x167FD, 24
	.4byte	3, 30

	mJumpBack 0xF


anim_0420:
	.4byte anim_data__0420_0
