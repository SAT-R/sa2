
.align 2, 0
	anim_data__0088_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4683 20
		.4byte	6, 0

		mGetTiles 0x4697 20
		.4byte	6, 1

		mGetTiles 0x46AB 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0088_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x46BF 20
		.4byte	6, 3

		mGetTiles 0x46D3 20
		.4byte	6, 4

		mGetTiles 0x46E7 30
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0088:
		.4byte anim_data__0088_0
		.4byte anim_data__0088_1
