

anim_data__0810_0:
	mGetPalette 0xAA 16 0x0
	mGetTiles 0x218F5 63
	.4byte	1, 0

	mAnimCmd4 

anim_data__0810_1:
	mGetPalette 0xAA 16 0x0
	mGetTiles 0x21934 63
	.4byte	3, 1

	mGetTiles 0x21973 63
	.4byte	3, 2

	mGetTiles 0x219B2 70
	.4byte	3, 3

	mGetTiles 0x219F8 70
	.4byte	6, 4

	mGetTiles 0x21A3E 70
	.4byte	4, 5

	mGetTiles 0x21A84 70
	.4byte	2, 6

	mGetTiles 0x21ACA 80
	.4byte	15, 7

	mAnimCmd4 


anim_0810:
	.4byte anim_data__0810_0
	.4byte anim_data__0810_1
