

anim_data__0198_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xAF51, 20
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	1, 0

	mGetTiles 0xAF65, 20
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	2, 1

	mGetTiles 0xAF79, 20
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	2, 2

	mGetTiles 0xAF8D, 20
	mAnimCmd6 0x0, 0x1004F6F8
	mAnimCmd6 0x1, 0x1000FDE9
	.4byte	2, 3

	mGetTiles 0xAFA1, 28
	mAnimCmd6 0x0, 0x1004F6F8
	mAnimCmd6 0x1, 0x1000F8DD
	.4byte	2, 4

	mGetTiles 0xAFBD, 24
	mAnimCmd6 0x0, 0x1004F6F8
	mAnimCmd6 0x1, 0xF00F7E0
	.4byte	2, 5

	mGetTiles 0xAFD5, 20
	mAnimCmd6 0x0, 0x1004F6F8
	.4byte	2, 6

	mGetTiles 0xAFE9, 16
	mAnimCmd6 0x0, 0x1004F6F8
	.4byte	3, 7

	mAnimCmd4 

anim_data__0198_1:
	mGetPalette 0xE, 16, 0x50
	.4byte	5, -1

	mGetTiles 0xAFF9, 12
	.4byte	2, 8

	mGetTiles 0xB005, 24
	.4byte	3, 9

	mGetTiles 0xB01D, 16
	.4byte	3, 10

	mGetTiles 0xB02D, 9
	.4byte	4, 11

	mAnimCmd4 


anim_0198:
	.4byte anim_data__0198_0
	.4byte anim_data__0198_1
