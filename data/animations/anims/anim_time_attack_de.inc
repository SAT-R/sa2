

anim_time_attack_de_variant_0:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27D9B, 168
	.4byte	1, 0

	mAnimCmd4 

anim_time_attack_de_variant_1:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27E43, 168
	.4byte	1, 1

	mAnimCmd4 

anim_time_attack_de_variant_2:
	mGetPalette 0x2CB, 16, 0x0
	mGetTiles 0x27EEB, 168
	.4byte	1, 2

	mAnimCmd4 


anim_time_attack_de:
	.4byte anim_time_attack_de_variant_0
	.4byte anim_time_attack_de_variant_1
	.4byte anim_time_attack_de_variant_2
