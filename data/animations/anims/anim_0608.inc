

anim_data__0608_0:
	mGetPalette 0x7B 16 0xB0
	mGetTiles 0x1B9DB 20
	mAnimCmd6 0x0 0x14E5EC
	.4byte	1, 0

	mAnimCmd4 

anim_data__0608_1:
	mGetPalette 0x7B 16 0xB0
	mGetTiles 0x1B9EF 15
	mAnimCmd6 0x0 0x14EAEC
	.4byte	1, 1

	mAnimCmd4 


anim_0608:
	.4byte anim_data__0608_0
	.4byte anim_data__0608_1
