

anim_spring_mus_pla_variant_0:
	mGetPalette 0x69, 16, 0x60
	mGetTiles 0x1AE19, 12
	mAnimCmd6 0x0, 0x5ECFB
	.4byte	1, 0

	mAnimCmd4 

anim_spring_mus_pla_variant_1:
	mGetPalette 0x69, 16, 0x60
	mGetTiles 0x1AE19, 12
	mAnimCmd6 0x0, 0x5ECFB
	.4byte	1, 0

	mGetTiles 0x1AE25, 12
	mAnimCmd6 0x0, 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1AE31, 20
	mAnimCmd6 0x0, 0x5DFFB
	.4byte	1, 2

	mGetTiles 0x1AE45, 16
	mAnimCmd6 0x0, 0x5E3FB
	.4byte	5, 3

	mGetTiles 0x1AE55, 20
	mAnimCmd6 0x0, 0x5E0FB
	.4byte	3, 4

	mAnimCmd4 


anim_spring_mus_pla:
	.4byte anim_spring_mus_pla_variant_0
	.4byte anim_spring_mus_pla_variant_1
