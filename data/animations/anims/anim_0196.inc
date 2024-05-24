

anim_data__0196_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAE91, 20
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0xAEA5, 20
	mAnimCmd6 0x0, 0x1002F6F6
	.4byte	2, 1

	mGetTiles 0xAEB9, 20
	mAnimCmd6 0x0, 0x1000F6F4
	mPlaySoundEffect 121
	.4byte	2, 2

	mGetTiles 0xAECD, 20
	mAnimCmd6 0x0, 0x1006F6FA
	mAnimCmd6 0x1, 0x10FAF6EC
	.4byte	2, 3

	mGetTiles 0xAEE1, 28
	mAnimCmd6 0x0, 0x10FEF6F2
	mAnimCmd6 0x1, 0x10F4F6D0
	.4byte	2, 4

	mGetTiles 0xAEFD, 24
	mAnimCmd6 0x0, 0x10FEF6F2
	mAnimCmd6 0x1, 0x10F2F6D8
	.4byte	2, 5

	mGetTiles 0xAF15, 24
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	3, 6

	mGetTiles 0xAF2D, 16
	mAnimCmd6 0x0, 0x1004F6F8
	.4byte	3, 7

	mGetTiles 0xAF3D, 20
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	3, 8

	mAnimCmd4 


anim_0196:
	.4byte anim_data__0196_0
