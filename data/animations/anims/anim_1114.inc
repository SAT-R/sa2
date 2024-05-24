

anim_data__1114_0:
	mGetPalette 0xAC, 16, 0x80
	mGetTiles 0x2ADC0, 9
	.4byte	1, 0

	mAnimCmd4 

anim_data__1114_1:
	mGetPalette 0xAC, 16, 0x80
	mGetTiles 0x2ADC9, 9
	.4byte	1, 1

	mAnimCmd4 

anim_data__1114_2:
	mGetPalette 0xAC, 16, 0x80
	mGetTiles 0x2ADD2, 9
	.4byte	1, 2

	mAnimCmd4 

anim_data__1114_3:
	mGetPalette 0xAC, 16, 0x80
	mGetTiles 0x2ADDB, 9
	.4byte	1, 3

	mAnimCmd4 

anim_data__1114_4:
	mGetPalette 0xAC, 16, 0x80
	mGetTiles 0x2ADE4, 9
	.4byte	1, 4

	mAnimCmd4 


anim_1114:
	.4byte anim_data__1114_0
	.4byte anim_data__1114_1
	.4byte anim_data__1114_2
	.4byte anim_data__1114_3
	.4byte anim_data__1114_4
