

anim_data__0747_0:
	mGetPalette 0xAE, 16, 0x10
	mGetTiles 0x1F18A, 36
	.4byte	1, 0

	mAnimCmd4 

anim_data__0747_1:
	mGetPalette 0xAE, 16, 0x10
	mGetTiles 0x1F1AE, 32
	.4byte	1, 1

	mAnimCmd4 

anim_data__0747_2:
	mGetPalette 0xAE, 16, 0x10
	mGetTiles 0x1F1CE, 36
	.4byte	1, 2

	mAnimCmd4 

anim_data__0747_3:
	mGetPalette 0xAE, 16, 0x10
	mGetTiles 0x1F1F2, 36
	.4byte	1, 3

	mAnimCmd4 

anim_data__0747_4:
	mGetPalette 0xAE, 16, 0x10
	mGetTiles 0x1F216, 20
	.4byte	1, 4

	mAnimCmd4 


anim_0747:
	.4byte anim_data__0747_0
	.4byte anim_data__0747_1
	.4byte anim_data__0747_2
	.4byte anim_data__0747_3
	.4byte anim_data__0747_4
