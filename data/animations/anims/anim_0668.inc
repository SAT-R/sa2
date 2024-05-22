

anim_data__0668_0:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1CAAE, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0668_1:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1CAB6, 8
	.4byte	6, 1

	mGetTiles 0x1CABE, 8
	.4byte	6, 2

	mGetTiles 0x1CAB6, 8
	.4byte	6, 1

	mGetTiles 0x1CABE, 8
	.4byte	6, 2

	mGetTiles 0x1CAB6, 8
	.4byte	6, 1

	mGetTiles 0x1CABE, 8
	.4byte	6, 2

	mAnimCmd4 

anim_data__0668_2:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1CAC6, 8
	.4byte	8, 3

	mGetTiles 0x1CACE, 8
	.4byte	4, 4

	mGetTiles 0x1CAC6, 8
	.4byte	8, 3

	mGetTiles 0x1CACE, 8
	.4byte	4, 4

	mGetTiles 0x1CAC6, 8
	.4byte	8, 3

	mGetTiles 0x1CACE, 8
	.4byte	4, 4

	mAnimCmd4 

anim_data__0668_3:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1CAAE, 8
	.4byte	8, 0

	mGetTiles 0x1CAD6, 8
	.4byte	8, 5

	mGetTiles 0x1CADE, 8
	.4byte	8, 6

	mGetTiles 0x1CAD6, 8
	.4byte	8, 7

	mGetTiles 0x1CAAE, 8
	.4byte	8, 8

	mAnimCmd4 

anim_data__0668_4:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1CAE6, 8
	.4byte	1, 9

	mAnimCmd4 


anim_0668:
	.4byte anim_data__0668_0
	.4byte anim_data__0668_1
	.4byte anim_data__0668_2
	.4byte anim_data__0668_3
	.4byte anim_data__0668_4
