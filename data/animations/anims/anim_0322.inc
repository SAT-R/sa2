
.align 2, 0
	anim_data__0322_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10F39 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x10F57 36
		.4byte	2, 1

		mGetTiles 0x10F7B 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 2

		mGetTiles 0x10F93 30
		.4byte	2, 3

		mGetTiles 0x10FB1 30
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0322_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10FCF 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 5

		mGetTiles 0x10FE3 25
		.4byte	2, 6

		mGetTiles 0x10FFC 24
		.4byte	2, 7

		mGetTiles 0x11014 24
		mAnimCmd6 0x0 0x60EF7F2
		mAnimCmd6 0x1 0xEFCF0ED
		.4byte	2, 8

		mGetTiles 0x1102C 24
		.4byte	2, 9

		mJumpBack 0x10

	anim_data__0322_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11044 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 10

		mGetTiles 0x11062 36
		.4byte	2, 11

		mGetTiles 0x11086 20
		.4byte	2, 12

		mGetTiles 0x1109A 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 13

		mGetTiles 0x110AA 16
		.4byte	2, 14

		mGetTiles 0x110BA 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		mPlaySoundEffect 109
		.4byte	2, 15

		mGetTiles 0x110CA 16
		.4byte	2, 16

		mGetTiles 0x110DA 16
		.4byte	2, 17

		mGetTiles 0x110EA 16
		.4byte	2, 18

		mAnimCmd4 


.align 2, 0
	anim_0322:
		.4byte anim_data__0322_0
		.4byte anim_data__0322_1
		.4byte anim_data__0322_2
