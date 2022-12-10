
.align 2, 0
	anim_data__0345_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x128DD 24
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0x128F5 30
		mAnimCmd6 0x0 0x12F5F4EE
		.4byte	3, 1

		mGetTiles 0x12913 36
		mAnimCmd6 0x0 0x12FAF4E8
		.4byte	3, 2

		mGetTiles 0x12937 30
		mAnimCmd6 0x0 0x12FCF4EA
		.4byte	3, 3

		mGetTiles 0x12955 24
		mAnimCmd6 0x0 0x1206F4F7
		.4byte	3, 4

		mGetTiles 0x1296D 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 5

		mGetTiles 0x12985 36
		mAnimCmd6 0x0 0x1218F406
		.4byte	3, 6

		mGetTiles 0x129A9 30
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0345:
		.4byte anim_data__0345_0
