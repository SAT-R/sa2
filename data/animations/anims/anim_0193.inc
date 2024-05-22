

anim_data__0193_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAC62, 20
	mAnimCmd6 0x0, 0x406EEFA
	mAnimCmd6 0x1, 0x406EEFA
	.4byte	3, 0

	mGetTiles 0xAC76, 20
	.4byte	3, 1

	mAnimCmd4 

anim_data__0193_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAC8A, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 2

	mGetTiles 0xAC9A, 16
	.4byte	2, 3

	mGetTiles 0xACAA, 16
	.4byte	2, 4

	mGetTiles 0xACBA, 16
	.4byte	2, 5

	mGetTiles 0xACCA, 16
	.4byte	2, 6

	mGetTiles 0xACDA, 16
	.4byte	2, 7

	mGetTiles 0xACEA, 16
	.4byte	2, 8

	mGetTiles 0xACFA, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0193_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAD0A, 20
	mAnimCmd6 0x0, 0x406EEFA
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	1, 10

	mGetTiles 0xAD1E, 20
	mAnimCmd6 0x0, 0x406EEF8
	mAnimCmd6 0x1, 0x909F7F7
	.4byte	2, 11

	mGetTiles 0xAD32, 25
	.4byte	2, 12

	mGetTiles 0xAD4B, 30
	.4byte	2, 13

	mGetTiles 0xAD69, 30
	.4byte	2, 14

	mGetTiles 0xAD87, 30
	.4byte	2, 15

	mJumpBack 0xF


anim_0193:
	.4byte anim_data__0193_0
	.4byte anim_data__0193_1
	.4byte anim_data__0193_2
