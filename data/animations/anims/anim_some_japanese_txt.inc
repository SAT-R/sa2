

anim_some_japanese_txt_variant_0:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x234B8, 46
	.4byte	1, 0

	mAnimCmd4 

anim_some_japanese_txt_variant_1:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x234E6, 20
	.4byte	1, 1

	mAnimCmd4 

anim_some_japanese_txt_variant_2:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x234FA, 20
	.4byte	1, 2

	mAnimCmd4 

anim_some_japanese_txt_variant_3:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x2350E, 16
	.4byte	1, 3

	mAnimCmd4 

anim_some_japanese_txt_variant_4:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x2351E, 28
	.4byte	1, 4

	mAnimCmd4 

anim_some_japanese_txt_variant_5:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x2353A, 20
	.4byte	1, 5

	mJumpBack 0x8

anim_some_japanese_txt_variant_6:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x2354E, 20
	.4byte	1, 6

	mAnimCmd4 

anim_some_japanese_txt_variant_7:
	mGetPalette 0xE6, 16, 0x40
	mGetTiles 0x23562, 40
	.4byte	1, 7

	mAnimCmd4 


anim_some_japanese_txt:
	.4byte anim_some_japanese_txt_variant_0
	.4byte anim_some_japanese_txt_variant_1
	.4byte anim_some_japanese_txt_variant_2
	.4byte anim_some_japanese_txt_variant_3
	.4byte anim_some_japanese_txt_variant_4
	.4byte anim_some_japanese_txt_variant_5
	.4byte anim_some_japanese_txt_variant_6
	.4byte anim_some_japanese_txt_variant_7
