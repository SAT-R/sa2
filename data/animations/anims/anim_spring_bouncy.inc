

anim_spring_bouncy_variant_0:
	mGetPalette 0x47, 16, 0x70
	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mAnimCmd4 

anim_spring_bouncy_variant_1:
	mGetPalette 0x47, 16, 0x70
	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1A73E, 12
	mAnimCmd6 0x0, 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1A74A, 16
	mAnimCmd6 0x0, 0x5E7FB
	.4byte	1, 2

	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	5, 0

	mGetTiles 0x1A74A, 16
	mAnimCmd6 0x0, 0x5E7FB
	.4byte	3, 2

	mAnimCmd4 

anim_spring_bouncy_variant_2:
	mGetPalette 0x47, 16, 0x70
	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1A73E, 12
	mAnimCmd6 0x0, 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1A75A, 16
	mAnimCmd6 0x0, 0x5E4FB
	.4byte	1, 3

	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	5, 0

	mGetTiles 0x1A76A, 16
	mAnimCmd6 0x0, 0x5E6FB
	.4byte	3, 4

	mAnimCmd4 

anim_spring_bouncy_variant_3:
	mGetPalette 0x47, 16, 0x70
	mGetTiles 0x1A732, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1A73E, 12
	mAnimCmd6 0x0, 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1A77A, 24
	mAnimCmd6 0x0, 0x5D3FB
	.4byte	1, 5

	mGetTiles 0x1A74A, 16
	mAnimCmd6 0x0, 0x5E7FB
	.4byte	5, 2

	mGetTiles 0x1A75A, 16
	mAnimCmd6 0x0, 0x5E4FB
	.4byte	3, 3

	mAnimCmd4 


anim_spring_bouncy:
	.4byte anim_spring_bouncy_variant_0
	.4byte anim_spring_bouncy_variant_1
	.4byte anim_spring_bouncy_variant_2
	.4byte anim_spring_bouncy_variant_3
