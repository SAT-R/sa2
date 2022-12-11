

anim_data__0017_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x1726 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0xE0EF2F2
	.4byte	1, 0

	mGetTiles 0x1736 12
	.4byte	1, 1

	mGetTiles 0x1742 16
	.4byte	1, 2

	mGetTiles 0x1752 16
	.4byte	1, 3

	mGetTiles 0x1762 16
	.4byte	1, 4

	mGetTiles 0x1772 12
	.4byte	1, 5

	mGetTiles 0x177E 16
	.4byte	1, 6

	mGetTiles 0x178E 20
	.4byte	1, 7

	mGetTiles 0x17A2 16
	mAnimCmd6 0x0 0x808F8F8
	.4byte	2, 8

	mGetTiles 0x17B2 16
	.4byte	2, 9

	mGetTiles 0x17C2 16
	.4byte	2, 10

	mGetTiles 0x17D2 16
	.4byte	2, 11

	mJumpBack 0x17

anim_data__0017_1:
	mGetPalette 0x2 16 0x50
	mGetTiles 0x17E2 8
	.4byte	2, 12

	mGetTiles 0x17EA 16
	.4byte	2, 13

	mGetTiles 0x17FA 16
	.4byte	2, 14

	mGetTiles 0x180A 16
	.4byte	2, 15

	mGetTiles 0x181A 16
	.4byte	2, 16

	mGetTiles 0x182A 16
	.4byte	2, 17

	mGetTiles 0x183A 12
	.4byte	2, 18

	mGetTiles 0x1846 16
	.4byte	2, 19

	mAnimCmd4 


anim_0017:
	.4byte anim_data__0017_0
	.4byte anim_data__0017_1
