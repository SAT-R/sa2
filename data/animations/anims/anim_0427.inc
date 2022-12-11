

anim_data__0427_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x16DF9 16
	mAnimCmd6 0x0 0xA0EFCFC
	.4byte	2, 0

	mGetTiles 0x16E09 16
	mAnimCmd6 0x0 0x20EF2FC
	.4byte	2, 1

	mGetTiles 0x16E19 24
	mAnimCmd6 0x0 0xFF0EF1FC
	.4byte	4, 2

	mGetTiles 0x16E31 16
	mAnimCmd6 0x0 0xEF2FC
	.4byte	3, 3

	mGetTiles 0x16E41 12
	mAnimCmd6 0x0 0x60EFAFC
	.4byte	2, 4

	mGetTiles 0x16E4D 20
	mAnimCmd6 0x0 0x100E02FC
	.4byte	2, 5

	mGetTiles 0x16E61 24
	mAnimCmd6 0x0 0x140E02FC
	.4byte	4, 6

	mGetTiles 0x16E79 20
	mAnimCmd6 0x0 0xE0E00FC
	.4byte	3, 7

	mGetTiles 0x16DF9 16
	mAnimCmd6 0x0 0xA0EFCFC
	.4byte	2, 0

	mAnimCmd4 

anim_data__0427_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x16E8D 16
	mAnimCmd6 0x0 0x60EF8FC
	.4byte	2, 8

	mGetTiles 0x16E9D 16
	mAnimCmd6 0x0 0xC0E00FC
	.4byte	2, 9

	mGetTiles 0x16EAD 24
	mAnimCmd6 0x0 0x130E02FC
	.4byte	4, 10

	mGetTiles 0x16EC5 16
	mAnimCmd6 0x0 0xE0EFEFC
	.4byte	3, 11

	mGetTiles 0x16ED5 12
	mAnimCmd6 0x0 0x80EFAFC
	.4byte	2, 12

	mGetTiles 0x16EE1 20
	mAnimCmd6 0x0 0xEF0FC
	.4byte	2, 13

	mGetTiles 0x16EF5 24
	mAnimCmd6 0x0 0xEECFC
	.4byte	4, 14

	mGetTiles 0x16F0D 20
	mAnimCmd6 0x0 0x20EF2FC
	.4byte	3, 15

	mGetTiles 0x16E8D 16
	mAnimCmd6 0x0 0x60EF8FC
	.4byte	2, 8

	mAnimCmd4 


anim_0427:
	.4byte anim_data__0427_0
	.4byte anim_data__0427_1
