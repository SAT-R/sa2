

anim_data__0661_0:
	mGetPalette 0x8C 16 0x80
	mGetTiles 0x1C80F 64
	mAnimCmd6 0x0 0x619E9E7
	mAnimCmd6 0x1 0x120606F9
	.4byte	1, 0

	mAnimCmd4 

anim_data__0661_1:
	mGetPalette 0x8C 16 0x80
	mGetTiles 0x1C80F 64
	mAnimCmd6 0x0 0x619E9E7
	mAnimCmd6 0x1 0x120606F9
	.4byte	8, 0

	mGetTiles 0x1C84F 64
	.4byte	8, 1

	mGetTiles 0x1C88F 64
	.4byte	8, 2

	mGetTiles 0x1C84F 64
	.4byte	8, 3

	mGetTiles 0x1C80F 64
	.4byte	8, 4

	mAnimCmd4 

anim_data__0661_2:
	mGetPalette 0x8C 16 0x80
	mGetTiles 0x1C8CF 56
	mAnimCmd6 0x0 0x619E9E7
	.4byte	10, 5

	mGetTiles 0x1C907 56
	mAnimCmd6 0x0 0x619E9E7
	mAnimCmd6 0x1 0x120A06F6
	.4byte	10, 6

	mGetTiles 0x1C80F 64
	.4byte	10, 0

	mAnimCmd4 

anim_data__0661_3:
	mGetPalette 0x8C 16 0x80
	mGetTiles 0x1C8CF 56
	mAnimCmd6 0x0 0x619E9E7
	.4byte	1, 5

	mAnimCmd4 


anim_0661:
	.4byte anim_data__0661_0
	.4byte anim_data__0661_1
	.4byte anim_data__0661_2
	.4byte anim_data__0661_3
