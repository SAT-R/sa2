

anim_data__0741_0:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1EFFA 36
	.4byte	1, 0

	mAnimCmd4 

anim_data__0741_1:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1F01E 30
	.4byte	1, 1

	mAnimCmd4 

anim_data__0741_2:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1F03C 36
	.4byte	1, 2

	mAnimCmd4 

anim_data__0741_3:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1F060 36
	.4byte	1, 3

	mAnimCmd4 

anim_data__0741_4:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1F084 18
	.4byte	1, 4

	mAnimCmd4 

anim_data__0741_5:
	mGetPalette 0xAE 16 0x10
	mGetTiles 0x1F096 12
	.4byte	1, 5

	mAnimCmd4 


anim_0741:
	.4byte anim_data__0741_0
	.4byte anim_data__0741_1
	.4byte anim_data__0741_2
	.4byte anim_data__0741_3
	.4byte anim_data__0741_4
	.4byte anim_data__0741_5
