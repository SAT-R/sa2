

anim_main_menu_variant_0:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x239B4, 38
	.4byte	1, 0

	mAnimCmd4 

anim_main_menu_variant_1:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x239DA, 30
	.4byte	1, 1

	mAnimCmd4 

anim_main_menu_variant_2:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x239F8, 32
	.4byte	1, 2

	mAnimCmd4 

anim_main_menu_variant_3:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x23A18, 22
	.4byte	1, 3

	mAnimCmd4 

anim_main_menu_variant_4:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x23A2E, 44
	.4byte	1, 4

	mAnimCmd4 

anim_main_menu_variant_5:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x23A5A, 34
	.4byte	1, 5

	mAnimCmd4 

anim_main_menu_variant_6:
	mGetPalette 0xE5, 16, 0x30
	mGetTiles 0x23A7C, 32
	.4byte	1, 6

	mAnimCmd4 


anim_main_menu:
	.4byte anim_main_menu_variant_0
	.4byte anim_main_menu_variant_1
	.4byte anim_main_menu_variant_2
	.4byte anim_main_menu_variant_3
	.4byte anim_main_menu_variant_4
	.4byte anim_main_menu_variant_5
	.4byte anim_main_menu_variant_6
