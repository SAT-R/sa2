

anim_data__0791_0:
	mGetPalette 0xCC, 16, 0x30
	mGetTiles 0x213C3, 42
	.4byte	1, 0

	mAnimCmd4 

anim_data__0791_1:
	mGetPalette 0xCC, 16, 0x30
	mGetTiles 0x213ED, 42
	.4byte	8, 1

	mGetTiles 0x21417, 42
	.4byte	8, 2

	mGetTiles 0x21441, 42
	.4byte	8, 3

	mGetTiles 0x2146B, 42
	.4byte	8, 4

	mAnimCmd4 

anim_data__0791_2:
	mGetPalette 0xCC, 16, 0x30
	mGetTiles 0x21495, 64
	.4byte	1, 5

	mAnimCmd4 


anim_0791:
	.4byte anim_data__0791_0
	.4byte anim_data__0791_1
	.4byte anim_data__0791_2
