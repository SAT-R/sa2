

anim_data__0839_0:
	mGetPalette 0x2B, 16, 0x60
	mGetTiles 0x22866, 15
	.4byte	2, 0

	mGetTiles 0x22875, 16
	.4byte	2, 1

	mGetTiles 0x22885, 16
	.4byte	2, 2

	mGetTiles 0x22895, 16
	.4byte	2, 3

	mJumpBack 0x17

anim_data__0839_1:
	mGetPalette 0x2B, 16, 0x60
	mGetTiles 0x228A5, 18
	.4byte	3, 4

	mGetTiles 0x228B7, 15
	.4byte	3, 5

	mAnimCmd4 


anim_0839:
	.4byte anim_data__0839_0
	.4byte anim_data__0839_1
