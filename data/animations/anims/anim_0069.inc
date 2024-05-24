

anim_data__0069_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x3D7E, 20
	mAnimCmd6 0x0, 0xA0AF8F8
	.4byte	2, 0

	mGetTiles 0x3D92, 20
	.4byte	2, 1

	mGetTiles 0x3DA6, 20
	.4byte	2, 2

	mGetTiles 0x3DBA, 20
	.4byte	2, 3

	mGetTiles 0x3DCE, 20
	.4byte	2, 4

	mGetTiles 0x3DE2, 20
	.4byte	2, 5

	mGetTiles 0x3DF6, 25
	.4byte	2, 6

	mGetTiles 0x3E0F, 20
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0069_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x3E23, 20
	mAnimCmd6 0x0, 0xA0AF8F8
	.4byte	2, 8

	mGetTiles 0x3E37, 20
	.4byte	2, 9

	mGetTiles 0x3E4B, 20
	.4byte	2, 10

	mGetTiles 0x3E5F, 20
	.4byte	2, 11

	mGetTiles 0x3E73, 20
	.4byte	2, 12

	mGetTiles 0x3E87, 20
	.4byte	2, 13

	mGetTiles 0x3E9B, 25
	.4byte	2, 14

	mGetTiles 0x3EB4, 20
	.4byte	2, 15

	mJumpBack 0x2E


anim_0069:
	.4byte anim_data__0069_0
	.4byte anim_data__0069_1
