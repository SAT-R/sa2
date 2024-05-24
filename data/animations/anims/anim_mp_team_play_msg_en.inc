

anim_mp_team_play_msg_en_variant_0:
	mGetPalette 0x2D4, 16, 0x0
	mGetTiles 0x2995E, 38
	.4byte	1, 0

	mAnimCmd4 

anim_mp_team_play_msg_en_variant_1:
	mGetPalette 0x2D4, 16, 0x0
	mGetTiles 0x29984, 46
	.4byte	1, 1

	mAnimCmd4 

anim_mp_team_play_msg_en_variant_2:
	mGetPalette 0x2D5, 16, 0x10
	mGetTiles 0x299B2, 14
	.4byte	1, 2

	mAnimCmd4 

anim_mp_team_play_msg_en_variant_3:
	mGetPalette 0x2D4, 16, 0x0
	mGetTiles 0x299C0, 10
	.4byte	1, 3

	mAnimCmd4 


anim_mp_team_play_msg_en:
	.4byte anim_mp_team_play_msg_en_variant_0
	.4byte anim_mp_team_play_msg_en_variant_1
	.4byte anim_mp_team_play_msg_en_variant_2
	.4byte anim_mp_team_play_msg_en_variant_3
