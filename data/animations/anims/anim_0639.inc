
.align 2, 0
	anim_data__0639_0:
		mGetPalette 0x4B 16 0xA0
		mGetTiles 0x1BEFF 20
		mAnimCmd6 0x0 0x408F5F8
		.4byte	4, 0

		mGetTiles 0x1BF13 32
		mAnimCmd6 0x0 0x308E6F8
		.4byte	4, 1

		mGetTiles 0x1BF33 32
		mAnimCmd6 0x0 0x208D5F8
		.4byte	4, 2

		mGetTiles 0x1BF53 32
		mAnimCmd6 0x0 0xEA08D5F8
		.4byte	4, 3

		mGetTiles 0x1BF73 32
		mAnimCmd6 0x0 0x45004500
		.4byte	4, 4

		mGetTiles 0x1BF93 28
		.4byte	4, 5

		mGetTiles 0x1BFAF 28
		.4byte	4, 6

		mAnimCmd4 


.align 2, 0
	anim_0639:
		.4byte anim_data__0639_0
