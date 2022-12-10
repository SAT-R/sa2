

anim_data__0297_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xFFE2 20
	mAnimCmd6 0x0 0xF0AF6FA
	.4byte	4, 0

	mGetTiles 0xFFF6 24
	mPlaySoundEffect 125
	.4byte	4, 1

	mGetTiles 0x1000E 20
	.4byte	4, 2

	mGetTiles 0x10022 20
	.4byte	4, 3

	mGetTiles 0x10036 24
	mPlaySoundEffect 125
	.4byte	4, 4

	mGetTiles 0x1004E 20
	.4byte	4, 5

	mJumpBack 0x28

anim_data__0297_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1004E 20
	mAnimCmd6 0x0 0xF0AF6FA
	.4byte	4, 5

	mGetTiles 0x10036 24
	.4byte	4, 4

	mGetTiles 0x10022 20
	mPlaySoundEffect 125
	.4byte	4, 3

	mGetTiles 0x1000E 20
	.4byte	4, 2

	mGetTiles 0xFFF6 24
	.4byte	4, 1

	mGetTiles 0xFFE2 20
	mPlaySoundEffect 125
	.4byte	4, 0

	mJumpBack 0x28

anim_data__0297_2:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x10062 16
	mAnimCmd6 0x0 0xF0AF6FA
	.4byte	1, 6

	mAnimCmd4 

anim_data__0297_3:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x10072 20
	mAnimCmd6 0x0 0xF07F8F7
	.4byte	4, 7

	mGetTiles 0x10086 18
	mAnimCmd6 0x0 0xA01F0F1
	.4byte	4, 8

	mGetTiles 0x10098 24
	mAnimCmd6 0x0 0x6F9ECEF
	.4byte	4, 9

	mGetTiles 0x100B0 24
	.4byte	4, 10

	mGetTiles 0x100C8 20
	mAnimCmd6 0x0 0xF9ECED
	.4byte	4, 11

	mAnimCmd4 

anim_data__0297_4:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x100DC 16
	mAnimCmd6 0x0 0x1006FAFA
	.4byte	4, 12

	mGetTiles 0x100EC 16
	.4byte	4, 13

	mAnimCmd4 


anim_0297:
	.4byte anim_data__0297_0
	.4byte anim_data__0297_1
	.4byte anim_data__0297_2
	.4byte anim_data__0297_3
	.4byte anim_data__0297_4
