

anim_data__0771_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1FD59, 20
	.4byte	8, 0

	mGetTiles 0x1FD6D, 30
	.4byte	8, 1

	mGetTiles 0x1FD8B, 20
	.4byte	40, 2

	mAnimCmd4 


anim_0771:
	.4byte anim_data__0771_0
