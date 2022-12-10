
.align 2, 0
	anim_data__0093_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4AEB 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 0

		mGetTiles 0x4AFB 16
		.4byte	1, 1

		mGetTiles 0x4B0B 16
		.4byte	1, 2

		mGetTiles 0x4B1B 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0093_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4B27 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 4

		mGetTiles 0x4B37 16
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0093:
		.4byte anim_data__0093_0
		.4byte anim_data__0093_1
