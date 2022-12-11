

anim_mp_team_play_msg_de_variant_0:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x299CA 57
	.4byte	1, 0

	mAnimCmd4 

anim_mp_team_play_msg_de_variant_1:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x29A03 46
	.4byte	1, 1

	mAnimCmd4 

anim_mp_team_play_msg_de_variant_2:
	mGetPalette 0x2D5 16 0x10
	mGetTiles 0x29A31 10
	.4byte	1, 2

	mAnimCmd4 

anim_mp_team_play_msg_de_variant_3:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x29A3B 14
	.4byte	1, 3

	mAnimCmd4 


anim_mp_team_play_msg_de:
	.4byte anim_mp_team_play_msg_de_variant_0
	.4byte anim_mp_team_play_msg_de_variant_1
	.4byte anim_mp_team_play_msg_de_variant_2
	.4byte anim_mp_team_play_msg_de_variant_3
