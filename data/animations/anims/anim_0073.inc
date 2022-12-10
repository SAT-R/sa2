

anim_data__0073_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x4143 16
	mAnimCmd6 0x0 0x1006F3FA
	.4byte	3, 0

	mGetTiles 0x4153 16
	.4byte	3, 1

	mGetTiles 0x4163 16
	.4byte	3, 2

	mGetTiles 0x4173 16
	.4byte	3, 3

	mGetTiles 0x4183 16
	.4byte	3, 4

	mGetTiles 0x4193 16
	.4byte	3, 5

	mGetTiles 0x41A3 16
	.4byte	3, 6

	mGetTiles 0x41B3 16
	.4byte	3, 7

	mJumpBack 0x2E

anim_data__0073_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x41C3 20
	mAnimCmd6 0x0 0x1006F3FA
	.4byte	3, 8

	mGetTiles 0x41D7 20
	.4byte	3, 9

	mGetTiles 0x41EB 16
	.4byte	3, 10

	mGetTiles 0x41FB 20
	.4byte	3, 11

	mGetTiles 0x420F 20
	.4byte	3, 12

	mGetTiles 0x4223 20
	.4byte	3, 13

	mGetTiles 0x4237 20
	.4byte	3, 14

	mGetTiles 0x424B 20
	.4byte	3, 15

	mJumpBack 0x2E

anim_data__0073_2:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x425F 20
	mAnimCmd6 0x0 0x1006F3FA
	.4byte	3, 16

	mGetTiles 0x4273 20
	.4byte	3, 17

	mGetTiles 0x4287 25
	.4byte	3, 18

	mGetTiles 0x42A0 20
	.4byte	3, 19

	mGetTiles 0x42B4 20
	.4byte	3, 20

	mGetTiles 0x42C8 20
	.4byte	3, 21

	mGetTiles 0x42DC 16
	.4byte	3, 22

	mGetTiles 0x42EC 20
	.4byte	3, 23

	mJumpBack 0x2E


anim_0073:
	.4byte anim_data__0073_0
	.4byte anim_data__0073_1
	.4byte anim_data__0073_2
