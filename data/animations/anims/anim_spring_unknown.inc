

anim_spring_unknown_variant_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1AD21 20
	mAnimCmd6 0x0 0x130DF0F3
	.4byte	1, 0

	mAnimCmd4 

anim_spring_unknown_variant_1:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1AD21 20
	mAnimCmd6 0x0 0x130DF0F3
	.4byte	1, 0

	mGetTiles 0x1AD35 20
	.4byte	2, 1

	mGetTiles 0x1AD49 28
	.4byte	1, 2

	mGetTiles 0x1AD65 28
	.4byte	5, 3

	mGetTiles 0x1AD81 28
	.4byte	3, 4

	mAnimCmd4 

anim_spring_unknown_variant_2:
	mGetPalette 0x68 16 0x50
	mGetTiles 0x1AD9D 20
	mAnimCmd6 0x0 0x130DF0F3
	.4byte	1, 5

	mAnimCmd4 

anim_spring_unknown_variant_3:
	mGetPalette 0x68 16 0x50
	mGetTiles 0x1AD9D 20
	mAnimCmd6 0x0 0x130DF0F3
	.4byte	1, 5

	mGetTiles 0x1ADB1 20
	.4byte	2, 6

	mGetTiles 0x1ADC5 28
	.4byte	1, 7

	mGetTiles 0x1ADE1 28
	.4byte	5, 8

	mGetTiles 0x1ADFD 28
	.4byte	3, 9

	mAnimCmd4 


anim_spring_unknown:
	.4byte anim_spring_unknown_variant_0
	.4byte anim_spring_unknown_variant_1
	.4byte anim_spring_unknown_variant_2
	.4byte anim_spring_unknown_variant_3
