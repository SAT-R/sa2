

anim_data__0284_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xF84A 16
	mAnimCmd6 0x0 0x1006F0FA
	mAnimCmd6 0x1 0x1006F0FA
	.4byte	3, 0

	mGetTiles 0xF85A 16
	.4byte	2, 1

	mAnimCmd4 

anim_data__0284_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xF86A 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 2

	mGetTiles 0xF87A 16
	.4byte	2, 3

	mGetTiles 0xF88A 16
	.4byte	2, 4

	mGetTiles 0xF89A 16
	.4byte	2, 5

	mGetTiles 0xF8AA 16
	.4byte	2, 6

	mGetTiles 0xF8BA 16
	.4byte	2, 7

	mGetTiles 0xF8CA 16
	.4byte	2, 8

	mGetTiles 0xF8DA 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0284_2:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xF8EA 25
	mAnimCmd6 0x0 0x406F0FA
	mAnimCmd6 0x1 0xE08F6F8
	.4byte	1, 10

	mGetTiles 0xF903 20
	.4byte	2, 11

	mGetTiles 0xF917 25
	.4byte	2, 12

	mGetTiles 0xF930 25
	.4byte	2, 13

	mAnimCmd4 


anim_0284:
	.4byte anim_data__0284_0
	.4byte anim_data__0284_1
	.4byte anim_data__0284_2
