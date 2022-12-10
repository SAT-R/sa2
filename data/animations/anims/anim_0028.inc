
.align 2, 0
	anim_data__0028_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x19E1 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0x19F5 25
		.4byte	8, 1

		mGetTiles 0x1A0E 20
		.4byte	8, 2

		mGetTiles 0x1A22 25
		.4byte	8, 3

		mGetTiles 0x1A3B 20
		.4byte	8, 4

		mJumpBack 0x5

	anim_data__0028_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1A4F 30
		mAnimCmd6 0x0 0x1806F8FA
		.4byte	5, 5

		mGetTiles 0x1A6D 24
		.4byte	5, 6

		mGetTiles 0x1A85 24
		.4byte	5, 7

		mGetTiles 0x1A9D 25
		.4byte	5, 8

		mGetTiles 0x1AB6 25
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0028_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1ACF 16
		.4byte	5, 10

		mGetTiles 0x1ADF 16
		.4byte	3, 11

		mGetTiles 0x1AEF 20
		.4byte	3, 12

		mGetTiles 0x1B03 20
		.4byte	3, 13

		mAnimCmd4 


.align 2, 0
	anim_0028:
		.4byte anim_data__0028_0
		.4byte anim_data__0028_1
		.4byte anim_data__0028_2
