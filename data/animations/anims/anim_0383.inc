

anim_data__0383_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14E22, 20
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	1, 0

	mGetTiles 0x14E36, 20
	.4byte	1, 1

	mGetTiles 0x14E4A, 25
	.4byte	1, 2

	mGetTiles 0x14E63, 30
	.4byte	1, 3

	mGetTiles 0x14E81, 30
	.4byte	3, 4

	mGetTiles 0x14E9F, 36
	.4byte	4, 5

	mGetTiles 0x14EC3, 36
	.4byte	2, 6

	mGetTiles 0x14EE7, 35
	.4byte	1, 7

	mGetTiles 0x14F0A, 42
	mAnimCmd6 0x0, 0x1006F4FA
	mAnimCmd6 0x1, 0xD6E0
	.4byte	1, 8

	mGetTiles 0x14F34, 42
	mAnimCmd6 0x0, 0x10FEF4F2
	mAnimCmd6 0x1, 0x6F9DED8
	.4byte	1, 9

	mGetTiles 0x14F5E, 42
	mAnimCmd6 0x0, 0x10FEF4F2
	mAnimCmd6 0x1, 0x10F5E9D4
	mPlaySoundEffect 128
	.4byte	1, 10

	mGetTiles 0x14F88, 42
	.4byte	2, 11

	mGetTiles 0x14FB2, 42
	.4byte	2, 12

	mGetTiles 0x14FDC, 28
	.4byte	2, 13

	mGetTiles 0x14FF8, 28
	.4byte	8, 14

	mGetTiles 0x15014, 16
	mAnimCmd6 0x0, 0x1004F4F8
	mAnimCmd6 0x1, 0x0
	.4byte	3, 15

	mGetTiles 0x15024, 16
	mAnimCmd6 0x0, 0x1008F4FC
	.4byte	3, 16

	mGetTiles 0x15034, 12
	mAnimCmd6 0x0, 0x100AF4FE
	.4byte	3, 17

	mAnimCmd4 


anim_0383:
	.4byte anim_data__0383_0
