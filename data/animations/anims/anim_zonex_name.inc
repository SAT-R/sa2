

anim_zonex_name_variant_0:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F8D9, 36
	.4byte	1, 0

	mAnimCmd4 

anim_zonex_name_variant_1:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F8FD, 34
	.4byte	1, 1

	mAnimCmd4 

anim_zonex_name_variant_2:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F91F, 34
	.4byte	1, 2

	mAnimCmd4 

anim_zonex_name_variant_3:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F941, 36
	.4byte	1, 3

	mAnimCmd4 

anim_zonex_name_variant_4:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F965, 34
	.4byte	1, 4

	mAnimCmd4 

anim_zonex_name_variant_5:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F987, 36
	.4byte	1, 5

	mAnimCmd4 

anim_zonex_name_variant_6:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F9AB, 32
	.4byte	1, 6

	mAnimCmd4 

anim_zonex_name_variant_7:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F9CB, 10
	.4byte	1, 7

	mAnimCmd4 

anim_zonex_name_variant_8:
	mGetPalette 0xB5, 16, 0xA0
	mGetTiles 0x1F9D5, 38
	.4byte	1, 8

	mAnimCmd4 


anim_zonex_name:
	.4byte anim_zonex_name_variant_0
	.4byte anim_zonex_name_variant_1
	.4byte anim_zonex_name_variant_2
	.4byte anim_zonex_name_variant_3
	.4byte anim_zonex_name_variant_4
	.4byte anim_zonex_name_variant_5
	.4byte anim_zonex_name_variant_6
	.4byte anim_zonex_name_variant_7
	.4byte anim_zonex_name_variant_8
