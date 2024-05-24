

anim_data__0437_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1770D, 16
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	3, 0

	mGetTiles 0x1771D, 16
	.4byte	3, 1

	mGetTiles 0x1772D, 16
	.4byte	3, 2

	mGetTiles 0x1773D, 16
	.4byte	3, 3

	mGetTiles 0x1774D, 16
	.4byte	3, 4

	mGetTiles 0x1775D, 16
	.4byte	3, 5

	mGetTiles 0x1776D, 16
	.4byte	3, 6

	mGetTiles 0x1777D, 16
	.4byte	3, 7

	mJumpBack 0x2E

anim_data__0437_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1778D, 20
	mAnimCmd6 0x0, 0xA06F6FA
	.4byte	3, 8

	mGetTiles 0x177A1, 20
	.4byte	3, 9

	mGetTiles 0x177B5, 20
	.4byte	3, 10

	mGetTiles 0x177C9, 20
	.4byte	3, 11

	mGetTiles 0x177DD, 20
	.4byte	3, 12

	mGetTiles 0x177F1, 20
	.4byte	3, 13

	mGetTiles 0x17805, 20
	.4byte	3, 14

	mGetTiles 0x17819, 20
	.4byte	3, 15

	mJumpBack 0x2E

anim_data__0437_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1782D, 20
	mAnimCmd6 0x0, 0xA06EEFA
	.4byte	3, 16

	mGetTiles 0x17841, 20
	.4byte	3, 17

	mGetTiles 0x17855, 20
	.4byte	3, 18

	mGetTiles 0x17869, 20
	.4byte	3, 19

	mGetTiles 0x1787D, 20
	.4byte	3, 20

	mGetTiles 0x17891, 20
	.4byte	3, 21

	mGetTiles 0x178A5, 20
	.4byte	3, 22

	mGetTiles 0x178B9, 20
	.4byte	3, 23

	mJumpBack 0x2E


anim_0437:
	.4byte anim_data__0437_0
	.4byte anim_data__0437_1
	.4byte anim_data__0437_2
