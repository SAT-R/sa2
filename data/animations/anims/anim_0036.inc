

anim_data__0036_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x239D 15
	.4byte	1, 0

	mAnimCmd4 

anim_data__0036_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x23AC 15
	.4byte	1, 1

	mAnimCmd4 

anim_data__0036_2:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x23BB 25
	.4byte	1, 2

	mAnimCmd4 

anim_data__0036_3:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x23D4 25
	.4byte	1, 3

	mAnimCmd4 


anim_0036:
	.4byte anim_data__0036_0
	.4byte anim_data__0036_1
	.4byte anim_data__0036_2
	.4byte anim_data__0036_3
