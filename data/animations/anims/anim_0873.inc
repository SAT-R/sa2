

anim_data__0873_0:
	mGetPalette 0x17 16 0x40
	mGetTiles 0x239AE 1
	.4byte	2, 0

	mGetTiles 0x239AF 1
	.4byte	2, 1

	mJumpBack 0xD

anim_data__0873_1:
	mGetPalette 0x17 16 0x40
	mGetTiles 0x239AE 1
	.4byte	2, 0

	mGetTiles 0x239AF 1
	.4byte	2, 1

	mGetTiles 0x239AE 1
	.4byte	2, 0

	mGetTiles 0x239AF 1
	.4byte	2, 1

	mGetTiles 0x239AE 1
	.4byte	2, 0

	mGetTiles 0x239AF 1
	.4byte	2, 1

	mGetTiles 0x239B0 1
	.4byte	2, 2

	mGetTiles 0x239B1 1
	.4byte	2, 3

	mGetTiles 0x239B2 1
	.4byte	2, 4

	mGetTiles 0x239B3 1
	.4byte	2, 5

	mAnimCmd4 


anim_0873:
	.4byte anim_data__0873_0
	.4byte anim_data__0873_1
