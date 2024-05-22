

anim_data__1102_0:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A541, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__1102_1:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A549, 12
	.4byte	1, 1

	mAnimCmd4 

anim_data__1102_2:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A555, 12
	.4byte	1, 2

	mAnimCmd4 

anim_data__1102_3:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A561, 8
	.4byte	1, 3

	mAnimCmd4 

anim_data__1102_4:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A569, 8
	.4byte	1, 4

	mAnimCmd4 

anim_data__1102_5:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A571, 8
	.4byte	1, 5

	mAnimCmd4 

anim_data__1102_6:
	mGetPalette 0x2DA, 16, 0x90
	mGetTiles 0x2A579, 8
	.4byte	1, 6

	mAnimCmd4 


anim_1102:
	.4byte anim_data__1102_0
	.4byte anim_data__1102_1
	.4byte anim_data__1102_2
	.4byte anim_data__1102_3
	.4byte anim_data__1102_4
	.4byte anim_data__1102_5
	.4byte anim_data__1102_6
