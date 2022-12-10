
.align 2, 0
	anim_data__0030_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1B7C 20
		.4byte	2, 0

		mGetTiles 0x1B90 20
		.4byte	2, 1

		mGetTiles 0x1BA4 20
		.4byte	4, 2

		mGetTiles 0x1BB8 25
		.4byte	4, 3

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BEA 20
		.4byte	6, 5

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BB8 25
		.4byte	6, 3

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BEA 20
		.4byte	6, 5

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BFE 20
		.4byte	4, 6

		mGetTiles 0x1BA4 20
		.4byte	4, 2

		mGetTiles 0x1B90 20
		.4byte	4, 1

		mGetTiles 0x1C12 20
		.4byte	4, 7

		mGetTiles 0x1C26 25
		.4byte	4, 8

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C58 20
		.4byte	6, 10

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C26 25
		.4byte	6, 8

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C58 20
		.4byte	4, 10

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C12 20
		.4byte	4, 7

		mGetTiles 0x1B90 20
		.4byte	4, 1

		mGetTiles 0x1B7C 20
		.4byte	4, 0

		mGetTiles 0x1C6C 20
		.4byte	8, 11

		mGetTiles 0x1C80 15
		.4byte	4, 12

		mGetTiles 0x1C8F 20
		.4byte	4, 13

		mGetTiles 0x1CA3 15
		.4byte	4, 14

		mGetTiles 0x1CB2 15
		.4byte	4, 15

		mGetTiles 0x1C80 15
		.4byte	4, 12

		mGetTiles 0x1C8F 20
		.4byte	4, 13

		mGetTiles 0x1CA3 15
		.4byte	4, 14

		mGetTiles 0x1CB2 15
		.4byte	4, 15

		mGetTiles 0x1C6C 20
		.4byte	4, 11

		mGetTiles 0x1B7C 20
		.4byte	8, 0

		mGetTiles 0x1CC1 20
		.4byte	6, 16

		mGetTiles 0x1CD5 16
		.4byte	6, 17

		mGetTiles 0x1CE5 16
		.4byte	2, 18

		mAnimCmd4 

	anim_data__0030_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1CE5 16
		.4byte	1, 18

		mGetTiles 0x1CF5 20
		.4byte	6, 19

		mGetTiles 0x1D09 20
		.4byte	60, 20

		mGetTiles 0x1D1D 25
		.4byte	4, 21

		mAnimCmd4 


.align 2, 0
	anim_0030:
		.4byte anim_data__0030_0
		.4byte anim_data__0030_1
