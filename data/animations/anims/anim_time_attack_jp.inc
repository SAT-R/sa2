

anim_time_attack_jp_variant_0:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27913 108
	.4byte	1, 0

	mAnimCmd4 

anim_time_attack_jp_variant_1:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x2797F 12
	.4byte	1, 1

	mAnimCmd4 

anim_time_attack_jp_variant_2:
	mGetPalette 0x2CA 16 0x10
	mGetTiles 0x2798B 8
	.4byte	1, 2

	mAnimCmd4 

anim_time_attack_jp_variant_3:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27993 168
	.4byte	1, 3

	mAnimCmd4 

anim_time_attack_jp_variant_4:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27A3B 168
	.4byte	1, 4

	mAnimCmd4 

anim_time_attack_jp_variant_5:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27AE3 168
	.4byte	1, 5

	mAnimCmd4 


anim_time_attack_jp:
	.4byte anim_time_attack_jp_variant_0
	.4byte anim_time_attack_jp_variant_1
	.4byte anim_time_attack_jp_variant_2
	.4byte anim_time_attack_jp_variant_3
	.4byte anim_time_attack_jp_variant_4
	.4byte anim_time_attack_jp_variant_5
