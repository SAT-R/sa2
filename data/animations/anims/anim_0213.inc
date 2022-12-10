
.align 2, 0
	anim_data__0213_0:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB7CD 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0213_1:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB7E1 20
		.4byte	3, 1

		mGetTiles 0xB7F5 25
		.4byte	3, 2

		mGetTiles 0xB80E 25
		.4byte	3, 3

		mGetTiles 0xB7F5 25
		.4byte	3, 2

		mJumpBack 0x17

	anim_data__0213_2:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB827 20
		.4byte	4, 4

		mGetTiles 0xB83B 24
		.4byte	2, 5

		mAnimCmd4 


.align 2, 0
	anim_0213:
		.4byte anim_data__0213_0
		.4byte anim_data__0213_1
		.4byte anim_data__0213_2
