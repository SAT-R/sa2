

anim_data__0603_0:
	mGetPalette 0x77 16 0xB0
	mGetTiles 0x1B700 12
	mAnimCmd6 0x0 0x5EBFB
	.4byte	1, 0

	mAnimCmd4 

anim_data__0603_1:
	mGetPalette 0x77 16 0xB0
	mGetTiles 0x1B700 12
	mAnimCmd6 0x0 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1B70C 12
	mAnimCmd6 0x0 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1B718 16
	mAnimCmd6 0x0 0x5E7FB
	.4byte	1, 2

	mGetTiles 0x1B70C 12
	mAnimCmd6 0x0 0x5EEFB
	.4byte	5, 1

	mGetTiles 0x1B718 16
	mAnimCmd6 0x0 0x5E7FB
	.4byte	3, 2

	mAnimCmd4 

anim_data__0603_2:
	mGetPalette 0x77 16 0xB0
	mGetTiles 0x1B700 12
	mAnimCmd6 0x0 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1B70C 12
	mAnimCmd6 0x0 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1B728 16
	mAnimCmd6 0x0 0x5E4FB
	.4byte	1, 3

	mGetTiles 0x1B700 12
	mAnimCmd6 0x0 0x5EBFB
	.4byte	5, 0

	mGetTiles 0x1B738 16
	mAnimCmd6 0x0 0x5E6FB
	.4byte	3, 4

	mAnimCmd4 

anim_data__0603_3:
	mGetPalette 0x77 16 0xB0
	mGetTiles 0x1B700 12
	mAnimCmd6 0x0 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1B70C 12
	mAnimCmd6 0x0 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1B748 24
	mAnimCmd6 0x0 0x5D3FB
	.4byte	1, 5

	mGetTiles 0x1B718 16
	mAnimCmd6 0x0 0x5E7FB
	.4byte	5, 2

	mGetTiles 0x1B728 16
	mAnimCmd6 0x0 0x5E4FB
	.4byte	3, 3

	mAnimCmd4 


anim_0603:
	.4byte anim_data__0603_0
	.4byte anim_data__0603_1
	.4byte anim_data__0603_2
	.4byte anim_data__0603_3
