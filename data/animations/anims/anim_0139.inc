

anim_data__0139_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x76BF, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	1, 0

	mGetTiles 0x76D7, 20
	.4byte	4, 1

	mGetTiles 0x76EB, 16
	.4byte	4, 2

	mGetTiles 0x76FB, 18
	.4byte	4, 3

	mGetTiles 0x770D, 20
	.4byte	2, 4

	mAnimCmd4 

anim_data__0139_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x770D, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 4

	mGetTiles 0x7721, 24
	.4byte	2, 5

	mGetTiles 0x7739, 20
	.4byte	2, 6

	mGetTiles 0x774D, 24
	.4byte	3, 7

	mGetTiles 0x7765, 24
	.4byte	3, 8

	mGetTiles 0x777D, 24
	.4byte	3, 9

	mJumpBack 0xF

anim_data__0139_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7795, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 10

	mGetTiles 0x77AD, 20
	.4byte	2, 11

	mGetTiles 0x77C1, 16
	.4byte	2, 12

	mGetTiles 0x77D1, 20
	.4byte	2, 13

	mGetTiles 0x77E5, 24
	.4byte	2, 14

	mGetTiles 0x77FD, 28
	.4byte	3, 15

	mGetTiles 0x7819, 28
	.4byte	3, 16

	mGetTiles 0x7835, 28
	.4byte	3, 17

	mJumpBack 0xF


anim_0139:
	.4byte anim_data__0139_0
	.4byte anim_data__0139_1
	.4byte anim_data__0139_2
