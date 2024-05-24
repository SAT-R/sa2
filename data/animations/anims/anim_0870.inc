

anim_data__0870_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235BA, 4
	.4byte	60, 0

	mAnimCmd4 

anim_data__0870_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235BE, 4
	.4byte	60, 1

	mAnimCmd4 

anim_data__0870_2:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235C2, 4
	.4byte	60, 2

	mAnimCmd4 

anim_data__0870_3:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235C6, 4
	.4byte	60, 3

	mAnimCmd4 

anim_data__0870_4:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235CA, 4
	.4byte	60, 4

	mAnimCmd4 

anim_data__0870_5:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x235CE, 4
	.4byte	60, 5

	mAnimCmd4 


anim_0870:
	.4byte anim_data__0870_0
	.4byte anim_data__0870_1
	.4byte anim_data__0870_2
	.4byte anim_data__0870_3
	.4byte anim_data__0870_4
	.4byte anim_data__0870_5
