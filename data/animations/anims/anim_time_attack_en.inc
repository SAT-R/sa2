

anim_time_attack_en_variant_0:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27B8B, 168
	.4byte	1, 0

	mAnimCmd4 

anim_time_attack_en_variant_1:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27C33, 168
	.4byte	1, 1

	mAnimCmd4 

anim_time_attack_en_variant_2:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27CDB, 168
	.4byte	1, 2

	mAnimCmd4 

anim_time_attack_en_variant_3:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27D83, 12
	.4byte	1, 3

	mAnimCmd4 

anim_time_attack_en_variant_4:
	mGetPalette 0x2CC, 16, 0x10
	mGetTiles 0x27D8F, 12
	.4byte	1, 4

	mAnimCmd4 


anim_time_attack_en:
	.4byte anim_time_attack_en_variant_0
	.4byte anim_time_attack_en_variant_1
	.4byte anim_time_attack_en_variant_2
	.4byte anim_time_attack_en_variant_3
	.4byte anim_time_attack_en_variant_4
