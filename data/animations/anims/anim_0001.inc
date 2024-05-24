

anim_data__0001_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0xEC, 20
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	4, 0

	mGetTiles 0x100, 20
	.4byte	12, 1

	mGetTiles 0x114, 20
	.4byte	4, 2

	mGetTiles 0x128, 20
	.4byte	4, 3

	mGetTiles 0x13C, 25
	.4byte	4, 4

	mGetTiles 0x155, 25
	.4byte	4, 5

	mGetTiles 0x16E, 20
	.4byte	6, 6

	mGetTiles 0x155, 25
	.4byte	4, 5

	mGetTiles 0x13C, 25
	.4byte	6, 4

	mGetTiles 0x155, 25
	.4byte	4, 5

	mGetTiles 0x16E, 20
	.4byte	6, 6

	mGetTiles 0x155, 25
	.4byte	4, 5

	mGetTiles 0x182, 20
	.4byte	4, 7

	mGetTiles 0x128, 20
	.4byte	4, 3

	mGetTiles 0x114, 20
	.4byte	4, 2

	mGetTiles 0x196, 20
	.4byte	4, 8

	mGetTiles 0x1AA, 25
	.4byte	4, 9

	mGetTiles 0x1C3, 25
	.4byte	4, 10

	mGetTiles 0x1DC, 20
	.4byte	6, 11

	mGetTiles 0x1C3, 25
	.4byte	4, 10

	mGetTiles 0x1AA, 25
	.4byte	6, 9

	mGetTiles 0x1C3, 25
	.4byte	4, 10

	mGetTiles 0x1DC, 20
	.4byte	4, 11

	mGetTiles 0x1C3, 25
	.4byte	4, 10

	mGetTiles 0x196, 20
	.4byte	4, 8

	mGetTiles 0x114, 20
	.4byte	4, 2

	mGetTiles 0x100, 20
	.4byte	4, 1

	mGetTiles 0x1F0, 20
	.4byte	4, 12

	mGetTiles 0x204, 20
	.4byte	4, 13

	mGetTiles 0x218, 30
	.4byte	4, 14

	mGetTiles 0x236, 30
	.4byte	4, 15

	mGetTiles 0x254, 30
	.4byte	4, 16

	mGetTiles 0x272, 24
	.4byte	4, 17

	mGetTiles 0x218, 30
	.4byte	4, 14

	mGetTiles 0x236, 30
	.4byte	4, 15

	mGetTiles 0x254, 30
	.4byte	4, 16

	mGetTiles 0x28A, 24
	.4byte	4, 18

	mGetTiles 0x2A2, 30
	.4byte	4, 19

	mGetTiles 0x2C0, 30
	.4byte	4, 20

	mGetTiles 0x2DE, 30
	.4byte	4, 21

	mGetTiles 0x2FC, 24
	.4byte	4, 22

	mGetTiles 0x2A2, 30
	.4byte	4, 19

	mGetTiles 0x2C0, 30
	.4byte	4, 20

	mGetTiles 0x2DE, 30
	.4byte	4, 21

	mGetTiles 0x2FC, 24
	.4byte	4, 22

	mGetTiles 0x314, 30
	.4byte	4, 23

	mGetTiles 0x236, 30
	.4byte	4, 15

	mGetTiles 0x254, 30
	.4byte	4, 16

	mGetTiles 0x272, 24
	.4byte	4, 17

	mGetTiles 0x218, 30
	.4byte	4, 14

	mGetTiles 0x236, 30
	.4byte	4, 15

	mGetTiles 0x254, 30
	.4byte	4, 16

	mGetTiles 0x272, 24
	.4byte	4, 17

	mJumpBack 0x14

anim_data__0001_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x218, 30
	mAnimCmd6 0x0, 0x1006F3FA
	.4byte	4, 14

	mGetTiles 0x236, 30
	.4byte	4, 15

	mGetTiles 0x254, 30
	.4byte	4, 16

	mGetTiles 0x332, 30
	.4byte	4, 24

	mGetTiles 0x350, 30
	.4byte	4, 25

	mGetTiles 0x100, 20
	.4byte	16, 1

	mGetTiles 0xEC, 20
	.4byte	4, 0

	mAnimCmd4 


anim_0001:
	.4byte anim_data__0001_0
	.4byte anim_data__0001_1
