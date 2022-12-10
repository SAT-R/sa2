
.align 2, 0
	anim_data__0248_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD873 35
		mAnimCmd6 0x0 0xFE06E8FA
		.4byte	3, 0

		mGetTiles 0xD896 35
		.4byte	3, 1

		mGetTiles 0xD8B9 35
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0248_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD8DC 25
		mAnimCmd6 0x0 0x6EAFA
		.4byte	3, 3

		mGetTiles 0xD8F5 20
		.4byte	3, 4

		mGetTiles 0xD909 25
		.4byte	3, 5

		mGetTiles 0xD922 20
		.4byte	3, 6

		mGetTiles 0xD936 30
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0248_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD954 30
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 8

		mGetTiles 0xD972 30
		.4byte	3, 9

		mGetTiles 0xD990 30
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0248:
		.4byte anim_data__0248_0
		.4byte anim_data__0248_1
		.4byte anim_data__0248_2
