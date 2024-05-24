

anim_data__0324_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x111B2, 30
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	2, 0

	mGetTiles 0x111D0, 30
	.4byte	3, 1

	mGetTiles 0x111EE, 30
	.4byte	2, 2

	mGetTiles 0x1120C, 35
	.4byte	2, 3

	mAnimCmd4 

anim_data__0324_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x1122F, 28
	mAnimCmd6 0x0, 0x1206F4FA
	mAnimCmd6 0x1, 0x1E0E00F2
	.4byte	2, 4

	mGetTiles 0x1124B, 28
	.4byte	2, 5

	mGetTiles 0x11267, 28
	.4byte	2, 6

	mGetTiles 0x11283, 28
	.4byte	2, 7

	mGetTiles 0x1122F, 28
	.4byte	2, 4

	mGetTiles 0x1124B, 28
	.4byte	2, 5

	mGetTiles 0x11267, 28
	.4byte	2, 6

	mGetTiles 0x11283, 28
	.4byte	2, 7

	mJumpBack 0x31

anim_data__0324_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x1129F, 25
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	1, 8

	mGetTiles 0x112B8, 20
	.4byte	1, 9

	mGetTiles 0x112CC, 16
	.4byte	1, 10

	mGetTiles 0x112DC, 16
	.4byte	1, 11

	mGetTiles 0x112EC, 16
	.4byte	4, 12

	mGetTiles 0x112DC, 16
	.4byte	2, 11

	mGetTiles 0x112CC, 16
	.4byte	2, 10

	mAnimCmd4 

anim_data__0324_3:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x112FC, 6
	.4byte	2, 13

	mGetTiles 0x11302, 16
	.4byte	2, 14

	mGetTiles 0x11312, 25
	.4byte	2, 15

	mGetTiles 0x1132B, 25
	.4byte	2, 16

	mGetTiles 0x11344, 24
	.4byte	2, 17

	mGetTiles 0x1135C, 18
	.4byte	2, 18

	mGetTiles 0x1136E, 15
	.4byte	2, 19

	mGetTiles 0x1137D, 4
	.4byte	2, 20

	mJumpBack 0x2B


anim_0324:
	.4byte anim_data__0324_0
	.4byte anim_data__0324_1
	.4byte anim_data__0324_2
	.4byte anim_data__0324_3
