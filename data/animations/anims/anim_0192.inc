

anim_data__0192_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAB1F, 20
	mAnimCmd6 0x0, 0x406EEFA
	mAnimCmd6 0x1, 0x406EEFA
	.4byte	3, 0

	mGetTiles 0xAB33, 20
	mAnimCmd6 0x0, 0x1007FAFB
	mAnimCmd6 0x1, 0x1007FAFB
	.4byte	3, 1

	mAnimCmd4 

anim_data__0192_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAB47, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 2

	mGetTiles 0xAB57, 16
	.4byte	2, 3

	mGetTiles 0xAB67, 16
	.4byte	2, 4

	mGetTiles 0xAB77, 16
	.4byte	2, 5

	mGetTiles 0xAB87, 16
	.4byte	2, 6

	mGetTiles 0xAB97, 16
	.4byte	2, 7

	mGetTiles 0xABA7, 16
	.4byte	2, 8

	mGetTiles 0xABB7, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0192_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xABC7, 20
	mAnimCmd6 0x0, 0x606F0FA
	mAnimCmd6 0x1, 0xC0AF8F6
	.4byte	1, 10

	mGetTiles 0xABDB, 20
	mAnimCmd6 0x0, 0x406EEF8
	mAnimCmd6 0x1, 0x909F7F7
	.4byte	2, 11

	mGetTiles 0xABEF, 25
	.4byte	2, 12

	mGetTiles 0xAC08, 30
	.4byte	2, 13

	mGetTiles 0xAC26, 30
	.4byte	2, 14

	mGetTiles 0xAC44, 30
	.4byte	2, 15

	mJumpBack 0xF


anim_0192:
	.4byte anim_data__0192_0
	.4byte anim_data__0192_1
	.4byte anim_data__0192_2
