

anim_data__0374_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14574, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	3, 0

	mGetTiles 0x14584, 16
	.4byte	2, 1

	mAnimCmd4 

anim_data__0374_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14594, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	2, 2

	mGetTiles 0x145A4, 16
	.4byte	2, 3

	mGetTiles 0x145B4, 16
	.4byte	2, 4

	mGetTiles 0x145C4, 16
	.4byte	2, 5

	mGetTiles 0x145D4, 16
	.4byte	2, 6

	mGetTiles 0x145E4, 16
	.4byte	2, 7

	mGetTiles 0x145F4, 16
	.4byte	2, 8

	mGetTiles 0x14604, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0374_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14614, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	1, 10

	mGetTiles 0x14624, 20
	mAnimCmd6 0x0, 0xA06F0FA
	mAnimCmd6 0x1, 0xF0BF9F6
	.4byte	2, 11

	mGetTiles 0x14638, 25
	.4byte	2, 12

	mGetTiles 0x14651, 25
	.4byte	2, 13

	mGetTiles 0x1466A, 30
	.4byte	2, 14

	mJumpBack 0xF


anim_0374:
	.4byte anim_data__0374_0
	.4byte anim_data__0374_1
	.4byte anim_data__0374_2
