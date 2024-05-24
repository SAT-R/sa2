

anim_cheese_stomping_variant_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x18022, 6
	.4byte	1, 0

	mGetTiles 0x18028, 6
	.4byte	1, 1

	mGetTiles 0x1802E, 6
	.4byte	1, 2

	mGetTiles 0x18034, 6
	.4byte	1, 3

	mGetTiles 0x1803A, 6
	.4byte	1, 4

	mGetTiles 0x18040, 6
	.4byte	1, 5

	mGetTiles 0x18046, 9
	.4byte	1, 6

	mGetTiles 0x1804F, 9
	.4byte	1, 7

	mGetTiles 0x18058, 9
	.4byte	1, 8

	mGetTiles 0x18061, 9
	.4byte	1, 9

	mAnimCmd4 

anim_cheese_stomping_variant_1:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x1806A, 9
	.4byte	4, 10

	mGetTiles 0x18073, 9
	.4byte	6, 11

	mGetTiles 0x1807C, 9
	.4byte	4, 12

	mGetTiles 0x18085, 6
	.4byte	4, 13

	mGetTiles 0x1808B, 6
	.4byte	4, 14

	mGetTiles 0x18091, 6
	.4byte	4, 15

	mGetTiles 0x18091, 6
	.4byte	4, 15

	mGetTiles 0x18091, 6
	.4byte	4, 15

	mGetTiles 0x18097, 6
	.4byte	4, 16

	mGetTiles 0x1809D, 6
	.4byte	4, 17

	mGetTiles 0x180A3, 6
	.4byte	4, 18

	mGetTiles 0x180A9, 6
	.4byte	8, 19

	mGetTiles 0x180AF, 9
	.4byte	4, 20

	mGetTiles 0x180B8, 9
	.4byte	4, 21

	mGetTiles 0x180C1, 9
	.4byte	4, 22

	mGetTiles 0x180CA, 9
	.4byte	6, 23

	mGetTiles 0x180D3, 9
	.4byte	4, 24

	mGetTiles 0x180DC, 9
	.4byte	4, 25

	mGetTiles 0x180E5, 9
	.4byte	4, 26

	mGetTiles 0x180EE, 9
	.4byte	4, 27

	mGetTiles 0x180F7, 9
	.4byte	4, 28

	mGetTiles 0x18100, 9
	.4byte	16, 29

	mAnimCmd4 


anim_cheese_stomping:
	.4byte anim_cheese_stomping_variant_0
	.4byte anim_cheese_stomping_variant_1
