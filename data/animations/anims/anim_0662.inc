

anim_data__0662_0:
	mGetPalette 0x8C, 16, 0x80
	mGetTiles 0x1C93F, 15
	mAnimCmd6 0x0, 0x90FF9F0
	.4byte	1, 0

	mAnimCmd4 

anim_data__0662_1:
	mGetPalette 0x8C, 16, 0x80
	mGetTiles 0x1C93F, 15
	mAnimCmd6 0x0, 0x912F9ED
	.4byte	8, 1

	mGetTiles 0x1C94E, 15
	mAnimCmd6 0x0, 0x910F9EE
	.4byte	8, 2

	mGetTiles 0x1C95D, 15
	mAnimCmd6 0x0, 0x912F9EC
	.4byte	8, 3

	mGetTiles 0x1C94E, 15
	mAnimCmd6 0x0, 0x910F9EE
	.4byte	8, 4

	mGetTiles 0x1C93F, 15
	mAnimCmd6 0x0, 0x911F9EC
	.4byte	8, 0

	mAnimCmd4 

anim_data__0662_2:
	mGetPalette 0x8C, 16, 0x80
	mGetTiles 0x1C96C, 20
	.4byte	6, 5

	mGetTiles 0x1C980, 20
	.4byte	6, 6

	mGetTiles 0x1C994, 25
	.4byte	6, 7

	mAnimCmd4 

anim_data__0662_3:
	mGetPalette 0x8C, 16, 0x80
	mGetTiles 0x1C994, 25
	.4byte	6, 7

	mGetTiles 0x1C980, 20
	.4byte	6, 6

	mGetTiles 0x1C96C, 20
	.4byte	6, 5

	mGetTiles 0x1C93F, 15
	mAnimCmd6 0x0, 0x90FF9F0
	.4byte	1, 0

	mAnimCmd4 


anim_0662:
	.4byte anim_data__0662_0
	.4byte anim_data__0662_1
	.4byte anim_data__0662_2
	.4byte anim_data__0662_3
