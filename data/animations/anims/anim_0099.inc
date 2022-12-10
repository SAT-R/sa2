
.align 2, 0
	anim_data__0099_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4DAE 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x4DC2 16
		.4byte	2, 1

		mGetTiles 0x4DD2 20
		.4byte	2, 2

		mGetTiles 0x4DE6 24
		.4byte	2, 3

		mGetTiles 0x4DFE 24
		.4byte	2, 4

		mGetTiles 0x4E16 24
		.4byte	2, 5

		mGetTiles 0x4E2E 20
		.4byte	2, 6

		mGetTiles 0x4E42 16
		.4byte	2, 7

		mGetTiles 0x4E52 20
		.4byte	2, 8

		mGetTiles 0x4DC2 16
		.4byte	2, 1

		mGetTiles 0x4DD2 20
		.4byte	2, 2

		mGetTiles 0x4DE6 24
		.4byte	2, 3

		mGetTiles 0x4DFE 24
		.4byte	2, 4

		mGetTiles 0x4E66 24
		.4byte	2, 9

		mGetTiles 0x4E7E 20
		.4byte	2, 10

		mGetTiles 0x4E92 16
		.4byte	2, 11

		mGetTiles 0x4E52 20
		.4byte	2, 8

		mJumpBack 0x50

	anim_data__0099_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4EA2 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 12

		mGetTiles 0x4EB6 16
		.4byte	2, 13

		mGetTiles 0x4EC6 16
		.4byte	1, 14

		mAnimCmd4 


.align 2, 0
	anim_0099:
		.4byte anim_data__0099_0
		.4byte anim_data__0099_1
