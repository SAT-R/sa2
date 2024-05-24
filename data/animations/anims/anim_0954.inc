

anim_data__0954_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x247B0, 18
	.4byte	1, 0

	mAnimCmd4 

anim_data__0954_1:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x247C2, 48
	.4byte	1, 1

	mAnimCmd4 

anim_data__0954_2:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x247F2, 48
	.4byte	1, 2

	mAnimCmd4 

anim_data__0954_3:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24822, 3
	.4byte	1, 3

	mAnimCmd4 

anim_data__0954_4:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24825, 3
	.4byte	1, 4

	mAnimCmd4 

anim_data__0954_5:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24828, 8
	.4byte	1, 5

	mAnimCmd4 

anim_data__0954_6:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24830, 2
	.4byte	1, 6

	mAnimCmd4 

anim_data__0954_7:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24832, 4
	.4byte	1, 7

	mAnimCmd4 

anim_data__0954_8:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24836, 10
	.4byte	1, 8

	mAnimCmd4 


anim_0954:
	.4byte anim_data__0954_0
	.4byte anim_data__0954_1
	.4byte anim_data__0954_2
	.4byte anim_data__0954_3
	.4byte anim_data__0954_4
	.4byte anim_data__0954_5
	.4byte anim_data__0954_6
	.4byte anim_data__0954_7
	.4byte anim_data__0954_8
