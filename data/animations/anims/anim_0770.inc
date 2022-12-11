

anim_data__0770_0:
	mGetPalette 0x17 16 0x40
	mGetTiles 0x1FCF4 9
	.4byte	3, 0

	mGetTiles 0x1FCFD 16
	.4byte	3, 1

	mGetTiles 0x1FD0D 16
	.4byte	3, 2

	mGetTiles 0x1FD1D 16
	.4byte	3, 3

	mGetTiles 0x1FD2D 16
	.4byte	3, 4

	mGetTiles 0x1FD3D 16
	.4byte	3, 5

	mGetTiles 0x1FD4D 12
	.4byte	3, 6

	mAnimCmd4 


anim_0770:
	.4byte anim_data__0770_0
