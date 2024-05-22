

anim_data__0119_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6AB8, 16
	mAnimCmd6 0x0, 0xD06F3FA
	.4byte	3, 0

	mGetTiles 0x6AC8, 20
	.4byte	3, 1

	mGetTiles 0x6ADC, 16
	.4byte	3, 2

	mGetTiles 0x6AEC, 12
	.4byte	3, 3

	mGetTiles 0x6AF8, 16
	.4byte	3, 4

	mAnimCmd4 

anim_data__0119_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6B08, 20
	mAnimCmd6 0x0, 0xD06F3FA
	.4byte	5, 5

	mGetTiles 0x6B1C, 15
	.4byte	5, 6

	mGetTiles 0x6B2B, 20
	.4byte	5, 7

	mGetTiles 0x6B3F, 20
	.4byte	5, 8

	mGetTiles 0x6B53, 20
	.4byte	5, 9

	mAnimCmd4 

anim_data__0119_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6B67, 16
	.4byte	2, 10

	mGetTiles 0x6B77, 20
	.4byte	2, 11

	mGetTiles 0x6B8B, 20
	.4byte	2, 12

	mGetTiles 0x6B9F, 20
	.4byte	2, 13

	mGetTiles 0x6BB3, 16
	.4byte	2, 14

	mAnimCmd4 


anim_0119:
	.4byte anim_data__0119_0
	.4byte anim_data__0119_1
	.4byte anim_data__0119_2
