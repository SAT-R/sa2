

anim_data__0315_0:
	mGetPalette 0x18, 16, 0x20
	mGetTiles 0x10C4D, 9
	.4byte	40, 0

	mGetTiles 0x10C56, 9
	.4byte	12, 1

	mGetTiles 0x10C4D, 9
	.4byte	10, 0

	mGetTiles 0x10C5F, 9
	.4byte	12, 2

	mJumpBack 0x17

anim_data__0315_1:
	mGetPalette 0x18, 16, 0x20
	mGetTiles 0x10C5F, 9
	.4byte	8, 2

	mGetTiles 0x10C4D, 9
	.4byte	6, 0

	mGetTiles 0x10C56, 9
	.4byte	8, 1

	mGetTiles 0x10C4D, 9
	.4byte	6, 0

	mGetTiles 0x10C5F, 9
	.4byte	8, 2

	mGetTiles 0x10C4D, 9
	.4byte	6, 0

	mGetTiles 0x10C56, 9
	.4byte	12, 1

	mJumpBack 0x26

anim_data__0315_2:
	mGetPalette 0x18, 16, 0x20
	mGetTiles 0x10C4D, 9
	.4byte	4, 0

	mGetTiles 0x10C68, 9
	.4byte	8, 3

	mGetTiles 0x10C4D, 9
	.4byte	4, 0

	mGetTiles 0x10C68, 9
	.4byte	8, 3

	mGetTiles 0x10C4D, 9
	.4byte	4, 0

	mGetTiles 0x10C68, 9
	.4byte	8, 3

	mAnimCmd4 

anim_data__0315_3:
	mGetPalette 0x18, 16, 0x20
	mGetTiles 0x10C4D, 9
	.4byte	6, 0

	mGetTiles 0x10C71, 15
	.4byte	6, 4

	mGetTiles 0x10C80, 15
	.4byte	6, 5

	mAnimCmd4 


anim_0315:
	.4byte anim_data__0315_0
	.4byte anim_data__0315_1
	.4byte anim_data__0315_2
	.4byte anim_data__0315_3
