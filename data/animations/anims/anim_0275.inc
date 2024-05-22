

anim_data__0275_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xEAEC, 16
	mAnimCmd6 0x0, 0x1006FAFA
	.4byte	1, 0

	mGetTiles 0xEAFC, 16
	.4byte	1, 1

	mGetTiles 0xEB0C, 12
	.4byte	1, 2

	mGetTiles 0xEB18, 16
	.4byte	1, 3

	mAnimCmd4 

anim_data__0275_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xEAFC, 16
	mAnimCmd6 0x0, 0x1006FAFA
	.4byte	1, 1

	mGetTiles 0xEAEC, 16
	.4byte	1, 0

	mAnimCmd4 


anim_0275:
	.4byte anim_data__0275_0
	.4byte anim_data__0275_1
