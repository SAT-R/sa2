

anim_data__0842_0:
	mGetPalette 0xE1 16 0x0
	mGetTiles 0x22C04 20
	.4byte	4, 0

	mGetTiles 0x22C18 25
	.4byte	4, 1

	mGetTiles 0x22C31 25
	.4byte	4, 2

	mAnimCmd4 

anim_data__0842_1:
	mGetPalette 0xE1 16 0x0
	mGetTiles 0x22C4A 25
	.4byte	4, 3

	mGetTiles 0x22C63 20
	.4byte	4, 4

	mGetTiles 0x22C77 20
	.4byte	5, 5

	mGetTiles 0x22C8B 20
	.4byte	6, 6

	mGetTiles 0x22C9F 20
	.4byte	6, 7

	mAnimCmd4 

anim_data__0842_2:
	mGetPalette 0xE1 16 0x0
	mGetTiles 0x22CB3 20
	.4byte	6, 8

	mGetTiles 0x22CC7 20
	.4byte	6, 9

	mGetTiles 0x22CDB 25
	.4byte	12, 10

	mGetTiles 0x22CF4 25
	.4byte	4, 11

	mGetTiles 0x22CDB 25
	.4byte	4, 10

	mJumpBack 0xA

anim_data__0842_3:
	mGetPalette 0xE1 16 0x0
	mGetTiles 0x22D0D 20
	.4byte	6, 12

	mGetTiles 0x22D21 16
	.4byte	6, 13

	mAnimCmd4 

anim_data__0842_4:
	mGetPalette 0xE1 16 0x0
	mGetTiles 0x22D31 20
	.4byte	2, 14

	mGetTiles 0x22D45 20
	.4byte	2, 15

	mGetTiles 0x22D59 20
	.4byte	2, 16

	mGetTiles 0x22D6D 20
	.4byte	2, 17

	mJumpBack 0xF


anim_0842:
	.4byte anim_data__0842_0
	.4byte anim_data__0842_1
	.4byte anim_data__0842_2
	.4byte anim_data__0842_3
	.4byte anim_data__0842_4
