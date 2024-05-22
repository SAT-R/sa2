

anim_data__0693_0:
	mGetPalette 0x98, 16, 0xC0
	mGetTiles 0x1CEDB, 8
	mAnimCmd6 0x0, 0x21092108
	.4byte	1, 0

	mAnimCmd4 

anim_data__0693_1:
	mGetPalette 0x98, 16, 0xC0
	mGetTiles 0x1CEE3, 8
	.4byte	6, 1

	mGetTiles 0x1CEEB, 8
	.4byte	6, 2

	mGetTiles 0x1CEE3, 8
	.4byte	6, 1

	mGetTiles 0x1CEEB, 8
	.4byte	6, 2

	mGetTiles 0x1CEE3, 8
	.4byte	6, 1

	mGetTiles 0x1CEEB, 8
	.4byte	6, 2

	mAnimCmd4 

anim_data__0693_2:
	mGetPalette 0x98, 16, 0xC0
	mGetTiles 0x1CEF3, 8
	.4byte	8, 3

	mGetTiles 0x1CEFB, 8
	.4byte	4, 4

	mGetTiles 0x1CEF3, 8
	.4byte	8, 3

	mGetTiles 0x1CEFB, 8
	.4byte	4, 4

	mGetTiles 0x1CEF3, 8
	.4byte	8, 3

	mGetTiles 0x1CEFB, 8
	.4byte	4, 4

	mAnimCmd4 

anim_data__0693_3:
	mGetPalette 0x98, 16, 0xC0
	mGetTiles 0x1CF03, 8
	.4byte	1, 5

	mAnimCmd4 


anim_0693:
	.4byte anim_data__0693_0
	.4byte anim_data__0693_1
	.4byte anim_data__0693_2
	.4byte anim_data__0693_3
