

anim_data__0598_0:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B67E 8
	mAnimCmd6 0x0 0x810F8F0
	.4byte	1, 0

	mAnimCmd4 

anim_data__0598_1:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B686 8
	mAnimCmd6 0x0 0x810F8F0
	.4byte	1, 1

	mAnimCmd4 

anim_data__0598_2:
	mGetPalette 0x72 16 0xB0
	mGetTiles 0x1B68E 8
	mAnimCmd6 0x0 0x810F8F0
	.4byte	1, 2

	mAnimCmd4 


anim_0598:
	.4byte anim_data__0598_0
	.4byte anim_data__0598_1
	.4byte anim_data__0598_2
