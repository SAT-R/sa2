
.align 2, 0
	anim_data__0014_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1256 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	2, 0

		mGetTiles 0x1266 30
		mAnimCmd6 0x0 0x100AFAF6
		mAnimCmd6 0x1 0x1006ECE9
		.4byte	2, 1

		mGetTiles 0x1284 18
		.4byte	2, 2

		mGetTiles 0x1296 24
		.4byte	1, 3

		mGetTiles 0x12AE 30
		.4byte	1, 4

		mGetTiles 0x12CC 30
		.4byte	1, 5

		mGetTiles 0x12EA 36
		.4byte	1, 6

		mGetTiles 0x130E 25
		.4byte	1, 7

		mGetTiles 0x1327 30
		.4byte	1, 8

		mGetTiles 0x1345 30
		.4byte	1, 9

		mGetTiles 0x1363 20
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0014_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1377 24
		mAnimCmd6 0x0 0x100EFEF2
		mAnimCmd6 0x1 0x1203F8EB
		.4byte	2, 11

		mGetTiles 0x138F 24
		.4byte	2, 12

		mGetTiles 0x13A7 24
		.4byte	2, 13

		mJumpBack 0x18

	anim_data__0014_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x13BF 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 14

		mGetTiles 0x13CF 16
		.4byte	1, 15

		mGetTiles 0x13DF 16
		.4byte	1, 16

		mAnimCmd4 


.align 2, 0
	anim_0014:
		.4byte anim_data__0014_0
		.4byte anim_data__0014_1
		.4byte anim_data__0014_2
