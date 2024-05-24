

anim_digits_variant_0:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AABC, 4
	.4byte	1, 0

	mAnimCmd4 

anim_digits_variant_1:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AAC0, 2
	.4byte	1, 1

	mAnimCmd4 

anim_digits_variant_2:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AAC2, 4
	.4byte	1, 2

	mAnimCmd4 

anim_digits_variant_3:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AAC6, 4
	.4byte	1, 3

	mAnimCmd4 

anim_digits_variant_4:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AACA, 4
	.4byte	1, 4

	mAnimCmd4 

anim_digits_variant_5:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AACE, 4
	.4byte	1, 5

	mAnimCmd4 

anim_digits_variant_6:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AAD2, 4
	.4byte	1, 6

	mAnimCmd4 

anim_digits_variant_7:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AAD6, 4
	.4byte	1, 7

	mAnimCmd4 

anim_digits_variant_8:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AADA, 4
	.4byte	1, 8

	mAnimCmd4 

anim_digits_variant_9:
	mGetPalette 0x2CE, 16, 0xA0
	mGetTiles 0x2AADE, 4
	.4byte	1, 9

	mAnimCmd4 


anim_digits:
	.4byte anim_digits_variant_0
	.4byte anim_digits_variant_1
	.4byte anim_digits_variant_2
	.4byte anim_digits_variant_3
	.4byte anim_digits_variant_4
	.4byte anim_digits_variant_5
	.4byte anim_digits_variant_6
	.4byte anim_digits_variant_7
	.4byte anim_digits_variant_8
	.4byte anim_digits_variant_9
