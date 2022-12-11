

anim_data__0051_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x292E 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x2942 18
	.4byte	3, 1

	mGetTiles 0x2954 24
	.4byte	6, 2

	mGetTiles 0x2942 18
	.4byte	2, 1

	mGetTiles 0x296C 25
	.4byte	2, 3

	mGetTiles 0x2985 20
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 4

	mGetTiles 0x2999 20
	.4byte	2, 5

	mGetTiles 0x29AD 16
	.4byte	2, 6

	mAnimCmd4 

anim_data__0051_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x29BD 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 7

	mGetTiles 0x29CD 16
	.4byte	2, 8

	mGetTiles 0x29DD 16
	.4byte	2, 9

	mGetTiles 0x29ED 16
	.4byte	2, 10

	mJumpBack 0x1D

anim_data__0051_2:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x29FD 20
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 11

	mGetTiles 0x2A11 16
	.4byte	2, 12

	mGetTiles 0x2A21 20
	.4byte	2, 13

	mGetTiles 0x2A35 20
	.4byte	2, 14

	mGetTiles 0x2A49 20
	.4byte	3, 15

	mGetTiles 0x2A5D 20
	.4byte	3, 16

	mGetTiles 0x2A71 20
	.4byte	3, 17

	mJumpBack 0xF

anim_data__0051_3:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x2A85 16
	.4byte	1, 18

	mGetTiles 0x2A95 16
	.4byte	1, 19

	mJumpBack 0xD


anim_0051:
	.4byte anim_data__0051_0
	.4byte anim_data__0051_1
	.4byte anim_data__0051_2
	.4byte anim_data__0051_3
