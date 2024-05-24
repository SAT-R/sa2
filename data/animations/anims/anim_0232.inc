

anim_data__0232_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC59F, 28
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0xC5BB, 30
	.4byte	2, 1

	mGetTiles 0xC5D9, 30
	.4byte	2, 2

	mGetTiles 0xC5F7, 20
	.4byte	4, 3

	mAnimCmd4 

anim_data__0232_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC60B, 25
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 4

	mGetTiles 0xC624, 30
	.4byte	2, 5

	mGetTiles 0xC642, 25
	.4byte	2, 6

	mGetTiles 0xC65B, 35
	mAnimCmd6 0x0, 0xA06F4FA
	mAnimCmd6 0x1, 0xA1700F2
	.4byte	3, 7

	mGetTiles 0xC67E, 25
	.4byte	3, 8

	mGetTiles 0xC697, 25
	.4byte	3, 9

	mGetTiles 0xC6B0, 25
	.4byte	3, 10

	mJumpBack 0x1A

anim_data__0232_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xC6C9, 25
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	4, 11

	mGetTiles 0xC6E2, 30
	.4byte	4, 12

	mGetTiles 0xC700, 25
	.4byte	4, 13

	mGetTiles 0xC719, 20
	.4byte	4, 14

	mGetTiles 0xC72D, 24
	.4byte	3, 15

	mGetTiles 0xC745, 25
	.4byte	3, 16

	mGetTiles 0xC75E, 25
	.4byte	3, 17

	mGetTiles 0xC777, 30
	.4byte	3, 18

	mGetTiles 0xC795, 30
	.4byte	3, 19

	mGetTiles 0xC7B3, 30
	.4byte	3, 20

	mJumpBack 0xF


anim_0232:
	.4byte anim_data__0232_0
	.4byte anim_data__0232_1
	.4byte anim_data__0232_2
