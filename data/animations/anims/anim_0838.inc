

anim_data__0838_0:
	mGetPalette 0x2 16 0x50
	mGetTiles 0x22839 4
	.4byte	2, 0

	mGetTiles 0x2283D 4
	.4byte	2, 1

	mGetTiles 0x22841 4
	.4byte	2, 2

	mGetTiles 0x22845 4
	.4byte	2, 3

	mGetTiles 0x22849 4
	.4byte	2, 4

	mGetTiles 0x2284D 4
	.4byte	2, 5

	mGetTiles 0x22851 4
	.4byte	2, 6

	mGetTiles 0x22839 4
	.4byte	2, 0

	mAnimCmd4 

anim_data__0838_1:
	mGetPalette 0x2 16 0x50
	mGetTiles 0x22855 1
	.4byte	2, 7

	mGetTiles 0x22839 4
	.4byte	2, 0

	mGetTiles 0x22856 4
	.4byte	2, 8

	mGetTiles 0x2285A 4
	.4byte	2, 9

	mGetTiles 0x2285E 4
	.4byte	2, 10

	mGetTiles 0x22862 4
	.4byte	2, 11

	mGetTiles 0x22839 4
	.4byte	2, 0

	mGetTiles 0x22855 1
	.4byte	2, 7

	mAnimCmd4 


anim_0838:
	.4byte anim_data__0838_0
	.4byte anim_data__0838_1
