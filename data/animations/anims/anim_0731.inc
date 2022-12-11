

anim_data__0731_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x1DA56 64
	mAnimCmd6 0x0 0x46474547
	.4byte	1, 0

	mAnimCmd4 

anim_data__0731_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x1DA96 64
	.4byte	1, 1

	mAnimCmd4 

anim_data__0731_2:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x1DAD6 64
	mAnimCmd6 0x0 0xFF00FF00
	.4byte	1, 2

	mAnimCmd4 

anim_data__0731_3:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x1DB16 64
	.4byte	1, 3

	mAnimCmd4 

anim_data__0731_4:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x1DB56 14
	.4byte	1, 4

	mAnimCmd4 


anim_0731:
	.4byte anim_data__0731_0
	.4byte anim_data__0731_1
	.4byte anim_data__0731_2
	.4byte anim_data__0731_3
	.4byte anim_data__0731_4
