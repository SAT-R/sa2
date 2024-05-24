

anim_data__0086_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x43E8, 24
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 0

	mGetTiles 0x4400, 24
	.4byte	3, 1

	mGetTiles 0x4418, 20
	.4byte	3, 2

	mGetTiles 0x442C, 24
	.4byte	3, 3

	mGetTiles 0x4444, 24
	.4byte	3, 4

	mGetTiles 0x445C, 20
	.4byte	3, 5

	mJumpBack 0x24

anim_data__0086_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x4470, 20
	mAnimCmd6 0x0, 0x8E0F8
	.4byte	3, 6

	mGetTiles 0x4484, 20
	.4byte	3, 7

	mGetTiles 0x4498, 20
	.4byte	3, 8

	mGetTiles 0x44AC, 20
	.4byte	3, 9

	mGetTiles 0x44C0, 20
	.4byte	3, 10

	mGetTiles 0x44D4, 20
	.4byte	3, 11

	mJumpBack 0x24

anim_data__0086_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x44E8, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 12

	mGetTiles 0x44FC, 20
	.4byte	3, 13

	mGetTiles 0x4510, 20
	.4byte	3, 14

	mGetTiles 0x4524, 20
	.4byte	3, 15

	mGetTiles 0x4538, 20
	.4byte	3, 16

	mGetTiles 0x454C, 20
	.4byte	3, 17

	mJumpBack 0x24

anim_data__0086_3:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x4560, 20
	mAnimCmd6 0x0, 0x6E2FA
	.4byte	3, 18

	mGetTiles 0x4574, 20
	.4byte	3, 19

	mGetTiles 0x4588, 20
	.4byte	3, 20

	mGetTiles 0x459C, 20
	.4byte	3, 21

	mGetTiles 0x45B0, 20
	.4byte	3, 22

	mGetTiles 0x45C4, 20
	.4byte	3, 23

	mJumpBack 0x24


anim_0086:
	.4byte anim_data__0086_0
	.4byte anim_data__0086_1
	.4byte anim_data__0086_2
	.4byte anim_data__0086_3
