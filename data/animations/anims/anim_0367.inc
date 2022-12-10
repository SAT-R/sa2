

anim_data__0367_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1357C 16
	mAnimCmd6 0x0 0xA06EEFA
	mAnimCmd6 0x1 0xA06EEFA
	.4byte	3, 0

	mGetTiles 0x1358C 16
	.4byte	3, 1

	mGetTiles 0x1359C 16
	.4byte	3, 2

	mJumpBack 0x18

anim_data__0367_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x1357C 16
	mAnimCmd6 0x0 0xA06EEFA
	mAnimCmd6 0x1 0xA06EEFA
	.4byte	3, 0

	mGetTiles 0x1358C 16
	.4byte	3, 1

	mGetTiles 0x1359C 16
	.4byte	3, 2

	mJumpBack 0x18


anim_0367:
	.4byte anim_data__0367_0
	.4byte anim_data__0367_1
