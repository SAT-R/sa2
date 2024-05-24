

anim_time_attack_zone_name_variant_0:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2857B, 36
	.4byte	1, 0

	mAnimCmd4 

anim_time_attack_zone_name_variant_1:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2859F, 34
	.4byte	1, 1

	mAnimCmd4 

anim_time_attack_zone_name_variant_2:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x285C1, 34
	.4byte	1, 2

	mAnimCmd4 

anim_time_attack_zone_name_variant_3:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x285E3, 36
	.4byte	1, 3

	mAnimCmd4 

anim_time_attack_zone_name_variant_4:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x28607, 34
	.4byte	1, 4

	mAnimCmd4 

anim_time_attack_zone_name_variant_5:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x28629, 36
	.4byte	1, 5

	mAnimCmd4 

anim_time_attack_zone_name_variant_6:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2864D, 32
	.4byte	1, 6

	mAnimCmd4 

anim_time_attack_zone_name_variant_7:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2866D, 10
	.4byte	1, 7

	mAnimCmd4 

anim_time_attack_zone_name_variant_8:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x28677, 38
	.4byte	1, 8

	mAnimCmd4 


anim_time_attack_zone_name:
	.4byte anim_time_attack_zone_name_variant_0
	.4byte anim_time_attack_zone_name_variant_1
	.4byte anim_time_attack_zone_name_variant_2
	.4byte anim_time_attack_zone_name_variant_3
	.4byte anim_time_attack_zone_name_variant_4
	.4byte anim_time_attack_zone_name_variant_5
	.4byte anim_time_attack_zone_name_variant_6
	.4byte anim_time_attack_zone_name_variant_7
	.4byte anim_time_attack_zone_name_variant_8
