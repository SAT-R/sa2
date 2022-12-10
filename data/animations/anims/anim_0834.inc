

anim_data__0834_0:
	mGetPalette 0xDB 16 0x0
	mGetTiles 0x2215B 20
	.4byte	4, 0

	mGetTiles 0x2216F 20
	.4byte	4, 1

	mAnimCmd4 

anim_data__0834_1:
	mGetPalette 0xDB 16 0x0
	mGetTiles 0x22183 20
	.4byte	6, 2

	mGetTiles 0x22197 20
	.4byte	6, 3

	mAnimCmd4 

anim_data__0834_2:
	mGetPalette 0xDB 16 0x0
	mGetTiles 0x221AB 20
	.4byte	6, 4

	mGetTiles 0x221BF 25
	.4byte	12, 5

	mGetTiles 0x221D8 25
	.4byte	4, 6

	mGetTiles 0x221BF 25
	.4byte	4, 5

	mJumpBack 0xA

anim_data__0834_3:
	mGetPalette 0xDB 16 0x0
	mGetTiles 0x221AB 20
	.4byte	6, 4

	mGetTiles 0x221F1 25
	.4byte	6, 7

	mAnimCmd4 

anim_data__0834_4:
	mGetPalette 0xDB 16 0x0
	mGetTiles 0x2220A 15
	.4byte	2, 8

	mGetTiles 0x22219 20
	.4byte	2, 9

	mGetTiles 0x2222D 20
	.4byte	2, 10

	mGetTiles 0x22241 20
	.4byte	2, 11

	mJumpBack 0xF


anim_0834:
	.4byte anim_data__0834_0
	.4byte anim_data__0834_1
	.4byte anim_data__0834_2
	.4byte anim_data__0834_3
	.4byte anim_data__0834_4
