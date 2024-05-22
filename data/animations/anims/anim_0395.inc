

anim_data__0395_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15427, 12
	mAnimCmd6 0x0, 0x1006F4F8
	.4byte	3, 0

	mGetTiles 0x15433, 12
	.4byte	3, 1

	mAnimCmd4 

anim_data__0395_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1543F, 20
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	2, 2

	mGetTiles 0x15453, 20
	.4byte	2, 3

	mGetTiles 0x15467, 20
	.4byte	2, 4

	mJumpBack 0x15

anim_data__0395_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15433, 12
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	2, 1

	mGetTiles 0x15427, 12
	.4byte	2, 0

	mGetTiles 0x1547B, 15
	.4byte	4, 5

	mAnimCmd4 


anim_0395:
	.4byte anim_data__0395_0
	.4byte anim_data__0395_1
	.4byte anim_data__0395_2
