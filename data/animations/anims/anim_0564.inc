

anim_data__0564_0:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB42 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__0564_1:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB52 1
	.4byte	1, 1

	mAnimCmd4 

anim_data__0564_2:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB53 1
	.4byte	1, 2

	mAnimCmd4 


anim_0564:
	.4byte anim_data__0564_0
	.4byte anim_data__0564_1
	.4byte anim_data__0564_2
