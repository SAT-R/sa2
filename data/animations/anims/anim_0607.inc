

anim_data__0607_0:
	mGetPalette 0x7E 16 0xB0
	mGetTiles 0x1B9AB 16
	mAnimCmd6 0x0 0xFE8F0
	.4byte	2, 0

	.4byte	2, -1

	mJumpBack 0xD

anim_data__0607_1:
	mGetPalette 0x7E 16 0xB0
	mGetTiles 0x1B9BB 4
	.4byte	2, 1

	.4byte	2, -1

	mJumpBack 0xA

anim_data__0607_2:
	mGetPalette 0x7E 16 0xB0
	mGetTiles 0x1B9BF 12
	.4byte	2, 2

	.4byte	2, -1

	mJumpBack 0xA

anim_data__0607_3:
	mGetPalette 0x7E 16 0xB0
	mGetTiles 0x1B9CB 16
	mAnimCmd6 0x0 0xF18F000
	.4byte	2, 3

	.4byte	2, -1

	mJumpBack 0xD


anim_0607:
	.4byte anim_data__0607_0
	.4byte anim_data__0607_1
	.4byte anim_data__0607_2
	.4byte anim_data__0607_3
