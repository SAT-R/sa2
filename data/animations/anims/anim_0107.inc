
.align 2, 0
	anim_data__0107_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x60B7 12
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x60C3 12
		.4byte	1, 1

		mGetTiles 0x60CF 16
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	3, 2

		mGetTiles 0x60DF 20
		mAnimCmd6 0x0 0x606ECFA
		mAnimCmd6 0x1 0x810E8F0
		.4byte	2, 3

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x611B 20
		.4byte	2, 6

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x611B 20
		.4byte	2, 6

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x612F 20
		.4byte	2, 7

		mGetTiles 0x6143 20
		.4byte	2, 8

		mGetTiles 0x6157 25
		.4byte	2, 9

		mGetTiles 0x6170 25
		.4byte	2, 10

		mGetTiles 0x6189 16
		mAnimCmd6 0x0 0x1006F6FA
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	2, 11

		mGetTiles 0x6199 16
		mAnimCmd6 0x1 0x0
		.4byte	4, 12

		mGetTiles 0x61A9 16
		.4byte	2, 13

		mGetTiles 0x61B9 16
		.4byte	2, 14

		mAnimCmd4 


.align 2, 0
	anim_0107:
		.4byte anim_data__0107_0
