

anim_data__1097_0:
	mGetPalette 0x2D9, 16, 0x0
	mGetTiles 0x2A197, 36
	.4byte	1, 0

	mAnimCmd4 

anim_data__1097_1:
	mGetPalette 0x2D7, 16, 0x10
	mGetTiles 0x2A1BB, 36
	.4byte	1, 1

	mAnimCmd4 

anim_data__1097_2:
	mGetPalette 0x2D9, 16, 0x0
	mGetTiles 0x2A1DF, 168
	.4byte	1, 2

	mAnimCmd4 

anim_data__1097_3:
	mGetPalette 0x2D9, 16, 0x0
	mGetTiles 0x2A287, 168
	.4byte	1, 3

	mAnimCmd4 


anim_1097:
	.4byte anim_data__1097_0
	.4byte anim_data__1097_1
	.4byte anim_data__1097_2
	.4byte anim_data__1097_3
