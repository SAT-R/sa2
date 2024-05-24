

anim_data__0269_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE583, 36
	.4byte	2, 0

	mGetTiles 0xE5A7, 30
	.4byte	2, 1

	mJumpBack 0xD

anim_data__0269_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE5C5, 16
	.4byte	3, 2

	mAnimCmd4 

anim_data__0269_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE5D5, 25
	.4byte	2, 3

	mGetTiles 0xE5EE, 25
	.4byte	2, 4

	mJumpBack 0xD

anim_data__0269_3:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE607, 24
	.4byte	3, 5

	mAnimCmd4 


anim_0269:
	.4byte anim_data__0269_0
	.4byte anim_data__0269_1
	.4byte anim_data__0269_2
	.4byte anim_data__0269_3
