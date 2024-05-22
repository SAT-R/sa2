

anim_bouncy_bar_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A792, 18
	mAnimCmd6 0x0, 0xF8D0
	.4byte	1, 0

	mAnimCmd4 

anim_bouncy_bar_variant_1:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A7B6, 18
	.4byte	5, 2

	mGetTiles 0x1A7C8, 24
	.4byte	5, 3

	mGetTiles 0x1A7E0, 20
	.4byte	5, 4

	mGetTiles 0x1A7F4, 24
	.4byte	5, 5

	mGetTiles 0x1A7C8, 24
	.4byte	5, 3

	mGetTiles 0x1A80C, 18
	.4byte	5, 6

	mGetTiles 0x1A7B6, 18
	.4byte	5, 2

	mGetTiles 0x1A81E, 18
	.4byte	5, 7

	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A830, 18
	.4byte	5, 8

	mAnimCmd4 

anim_bouncy_bar_variant_2:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A7B6, 18
	.4byte	5, 2

	mGetTiles 0x1A7C8, 24
	.4byte	5, 3

	mGetTiles 0x1A80C, 18
	.4byte	5, 6

	mGetTiles 0x1A7B6, 18
	.4byte	5, 2

	mGetTiles 0x1A81E, 18
	.4byte	5, 7

	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A830, 18
	.4byte	5, 8

	mAnimCmd4 

anim_bouncy_bar_variant_3:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A7B6, 18
	.4byte	5, 2

	mGetTiles 0x1A81E, 18
	.4byte	5, 7

	mGetTiles 0x1A7A4, 18
	.4byte	5, 1

	mGetTiles 0x1A830, 18
	.4byte	5, 8

	mAnimCmd4 


anim_bouncy_bar:
	.4byte anim_bouncy_bar_variant_0
	.4byte anim_bouncy_bar_variant_1
	.4byte anim_bouncy_bar_variant_2
	.4byte anim_bouncy_bar_variant_3
