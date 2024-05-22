

anim_data__0753_0:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F318, 16
	.4byte	6, 0

	mGetTiles 0x1F328, 16
	.4byte	6, 1

	mGetTiles 0x1F338, 16
	.4byte	6, 2

	mGetTiles 0x1F348, 16
	.4byte	6, 3

	mGetTiles 0x1F358, 16
	.4byte	6, 4

	mGetTiles 0x1F368, 16
	.4byte	6, 5

	mGetTiles 0x1F378, 16
	.4byte	6, 6

	mAnimCmd4 

anim_data__0753_1:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F378, 16
	.4byte	1, 6

	mAnimCmd4 


anim_0753:
	.4byte anim_data__0753_0
	.4byte anim_data__0753_1
