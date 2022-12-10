
.align 2, 0
	anim_data__0272_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xE70B 16
		.4byte	2, 0

		mGetTiles 0xE71B 16
		.4byte	2, 1

		mGetTiles 0xE72B 16
		.4byte	2, 2

		mGetTiles 0xE73B 16
		.4byte	2, 3

		mGetTiles 0xE74B 20
		.4byte	3, 4

		mGetTiles 0xE75F 12
		.4byte	3, 5

		mGetTiles 0xE76B 16
		.4byte	3, 6

		mGetTiles 0xE77B 16
		.4byte	3, 7

		mGetTiles 0xE78B 16
		.4byte	3, 8

		mGetTiles 0xE79B 16
		.4byte	3, 9

		mGetTiles 0xE7AB 16
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0272:
		.4byte anim_data__0272_0
