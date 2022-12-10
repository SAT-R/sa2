

anim_data__0287_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xFA1D 20
	mAnimCmd6 0x0 0x1006F2FA
	.4byte	2, 0

	mGetTiles 0xFA1D 20
	.4byte	2, 0

	mGetTiles 0xFA31 30
	mAnimCmd6 0x0 0x1002F2F0
	mAnimCmd6 0x1 0x10F2EFDD
	mPlaySoundEffect 126
	.4byte	2, 1

	mGetTiles 0xFA4F 35
	mAnimCmd6 0x0 0x1006F2FA
	mAnimCmd6 0x1 0x0
	.4byte	4, 2

	mGetTiles 0xFA72 30
	mAnimCmd6 0x0 0x1006F2FA
	mAnimCmd6 0x1 0x0
	.4byte	2, 3

	mGetTiles 0xFA1D 20
	mAnimCmd6 0x0 0x1006F2FA
	.4byte	2, 0

	mAnimCmd4 

anim_data__0287_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xFA90 20
	mAnimCmd6 0x0 0x1006F2FA
	.4byte	2, 4

	mGetTiles 0xFAA4 20
	.4byte	2, 5

	mGetTiles 0xFAB8 35
	mAnimCmd6 0x0 0x1006F2EF
	mAnimCmd6 0x1 0x10F3EFDD
	mPlaySoundEffect 126
	.4byte	2, 6

	mGetTiles 0xFADB 35
	mAnimCmd6 0x0 0x1006F2EF
	mAnimCmd6 0x1 0x0
	.4byte	8, 7

	mGetTiles 0xFAA4 20
	mAnimCmd6 0x0 0x1006F2FA
	.4byte	3, 5

	mGetTiles 0xFA90 20
	.4byte	2, 4

	mAnimCmd4 


anim_0287:
	.4byte anim_data__0287_0
	.4byte anim_data__0287_1
