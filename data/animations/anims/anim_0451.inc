

anim_data__0451_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x17B65 36
	.4byte	2, 0

	mGetTiles 0x17B89 25
	.4byte	2, 1

	mJumpBack 0xD

anim_data__0451_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x17BA2 16
	.4byte	3, 2

	mAnimCmd4 

anim_data__0451_2:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x17BB2 25
	.4byte	2, 3

	mGetTiles 0x17BCB 25
	.4byte	2, 4

	mJumpBack 0xD

anim_data__0451_3:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x17BE4 20
	.4byte	3, 5

	mAnimCmd4 


anim_0451:
	.4byte anim_data__0451_0
	.4byte anim_data__0451_1
	.4byte anim_data__0451_2
	.4byte anim_data__0451_3
