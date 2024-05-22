

anim_data__0891_0:
	mGetTiles 0x24327, 4
	mGetPalette 0xA1, 16, 0x70
	.4byte	4, 0

	mAnimCmd4 

anim_data__0891_1:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x2432B, 4
	.4byte	4, 1

	mAnimCmd4 

anim_data__0891_2:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x2432F, 4
	.4byte	4, 2

	mAnimCmd4 

anim_data__0891_3:
	mGetPalette 0xA1, 16, 0x70
	mGetTiles 0x24333, 4
	.4byte	4, 3

	mAnimCmd4 


anim_0891:
	.4byte anim_data__0891_0
	.4byte anim_data__0891_1
	.4byte anim_data__0891_2
	.4byte anim_data__0891_3
