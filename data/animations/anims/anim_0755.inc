

anim_data__0755_0:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F40A, 36
	.4byte	6, 0

	mGetTiles 0x1F42E, 36
	.4byte	6, 1

	mGetTiles 0x1F452, 36
	.4byte	6, 2

	mGetTiles 0x1F476, 36
	.4byte	6, 3

	mGetTiles 0x1F49A, 36
	.4byte	6, 4

	mGetTiles 0x1F4BE, 36
	.4byte	6, 5

	mGetTiles 0x1F4E2, 36
	.4byte	6, 6

	mGetTiles 0x1F506, 36
	.4byte	6, 7

	mGetTiles 0x1F52A, 36
	.4byte	6, 8

	mGetTiles 0x1F54E, 36
	.4byte	6, 9

	mGetTiles 0x1F572, 36
	.4byte	6, 10

	mGetTiles 0x1F596, 36
	.4byte	6, 11

	mAnimCmd4 

anim_data__0755_1:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F596, 36
	.4byte	1, 11

	mAnimCmd4 


anim_0755:
	.4byte anim_data__0755_0
	.4byte anim_data__0755_1
