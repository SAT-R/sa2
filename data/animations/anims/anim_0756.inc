

anim_data__0756_0:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F5BA 2
	.4byte	6, 0

	mGetTiles 0x1F5BC 4
	.4byte	6, 1

	mGetTiles 0x1F5C0 6
	.4byte	6, 2

	mGetTiles 0x1F5C6 8
	.4byte	6, 3

	mGetTiles 0x1F5CE 8
	.4byte	6, 4

	mGetTiles 0x1F5D6 10
	.4byte	6, 5

	mGetTiles 0x1F5E0 12
	.4byte	6, 6

	mGetTiles 0x1F5EC 21
	.4byte	6, 7

	mGetTiles 0x1F601 21
	.4byte	6, 8

	mGetTiles 0x1F616 24
	.4byte	6, 9

	mGetTiles 0x1F62E 27
	.4byte	6, 10

	mGetTiles 0x1F649 30
	.4byte	6, 11

	mAnimCmd4 

anim_data__0756_1:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F649 30
	.4byte	2, 11

	mGetTiles 0x1F667 30
	.4byte	2, 12

	mGetTiles 0x1F685 30
	.4byte	2, 13

	mGetTiles 0x1F6A3 30
	.4byte	2, 14

	mGetTiles 0x1F6C1 30
	.4byte	2, 15

	mGetTiles 0x1F6DF 30
	.4byte	2, 16

	mJumpBack 0x21


anim_0756:
	.4byte anim_data__0756_0
	.4byte anim_data__0756_1
