

anim_data__0774_0:
	mGetPalette 0xBB 16 0x0
	mGetTiles 0x1FE2C 20
	.4byte	4, 0

	mGetTiles 0x1FE40 15
	.4byte	4, 1

	mGetTiles 0x1FE4F 24
	.4byte	8, 2

	mGetTiles 0x1FE67 15
	.4byte	40, 3

	mAnimCmd4 


anim_0774:
	.4byte anim_data__0774_0
