

anim_data__0163_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x8E93, 24
	mAnimCmd6 0x0, 0x406EEFA
	.4byte	3, 0

	mGetTiles 0x8EAB, 20
	mAnimCmd6 0x0, 0x4FEEEF1
	.4byte	3, 1

	mGetTiles 0x8EBF, 20
	mAnimCmd6 0x0, 0x4FCEEEC
	.4byte	3, 2

	mGetTiles 0x8ED3, 20
	mAnimCmd6 0x0, 0x4FEEEF0
	.4byte	3, 3

	mGetTiles 0x8EE7, 16
	mAnimCmd6 0x0, 0x406EEF8
	.4byte	3, 4

	mGetTiles 0x8EF7, 30
	mAnimCmd6 0x0, 0x412EE04
	.4byte	3, 5

	mGetTiles 0x8F15, 30
	mAnimCmd6 0x0, 0x415EE06
	.4byte	3, 6

	mGetTiles 0x8F33, 30
	mAnimCmd6 0x0, 0x412EE03
	.4byte	3, 7

	mJumpBack 0x43


anim_0163:
	.4byte anim_data__0163_0
