
.align 2, 0
	anim_data__0378_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14841 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x14855 24
		mAnimCmd6 0x0 0x100EF400
		.4byte	1, 1

		mGetTiles 0x1486D 20
		mAnimCmd6 0x0 0x100EF402
		.4byte	1, 2

		mGetTiles 0x14881 30
		mAnimCmd6 0x0 0x1012F406
		.4byte	1, 3

		mGetTiles 0x1489F 35
		.4byte	2, 4

		mGetTiles 0x148C2 35
		.4byte	3, 5

		mGetTiles 0x148E5 36
		mAnimCmd6 0x0 0x100EF402
		.4byte	1, 6

		mGetTiles 0x14909 24
		mAnimCmd6 0x0 0x100CF400
		mAnimCmd6 0x1 0xFE0ADDEC
		.4byte	1, 7

		mGetTiles 0x14921 42
		mAnimCmd6 0x0 0x1006F4FA
		mAnimCmd6 0x1 0x1000E9E0
		mPlaySoundEffect 128
		.4byte	2, 8

		mGetTiles 0x1494B 35
		.4byte	2, 9

		mGetTiles 0x1496E 35
		.4byte	2, 10

		mGetTiles 0x14991 28
		.4byte	2, 11

		mGetTiles 0x149AD 20
		mAnimCmd6 0x0 0x1006F4FA
		mAnimCmd6 0x1 0x0
		.4byte	3, 12

		mGetTiles 0x149C1 20
		.4byte	3, 13

		mGetTiles 0x149D5 16
		.4byte	3, 14

		mAnimCmd4 


.align 2, 0
	anim_0378:
		.4byte anim_data__0378_0
