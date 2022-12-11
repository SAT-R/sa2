

anim_mp_comm_msg_it_variant_0:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x29773 45
	.4byte	1, 0

	mAnimCmd4 

anim_mp_comm_msg_it_variant_1:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x297A0 51
	.4byte	1, 1

	mAnimCmd4 

anim_mp_comm_msg_it_variant_2:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x297D3 69
	.4byte	1, 2

	mAnimCmd4 

anim_mp_comm_msg_it_variant_3:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x29818 60
	.4byte	1, 3

	mAnimCmd4 

anim_mp_comm_msg_it_variant_4:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x29854 64
	.4byte	1, 4

	mAnimCmd4 

anim_mp_comm_msg_it_variant_5:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x29894 64
	.4byte	1, 5

	mAnimCmd4 

anim_mp_comm_msg_it_variant_6:
	mGetPalette 0x2D3 16 0x60
	mGetTiles 0x298D4 9
	.4byte	1, 6

	mAnimCmd4 

anim_mp_comm_msg_it_variant_7:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x298DD 15
	.4byte	1, 7

	mAnimCmd4 

anim_mp_comm_msg_it_variant_8:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x298EC 63
	.4byte	1, 8

	mAnimCmd4 

anim_mp_comm_msg_it_variant_9:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x2992B 51
	.4byte	1, 9

	mAnimCmd4 


anim_mp_comm_msg_it:
	.4byte anim_mp_comm_msg_it_variant_0
	.4byte anim_mp_comm_msg_it_variant_1
	.4byte anim_mp_comm_msg_it_variant_2
	.4byte anim_mp_comm_msg_it_variant_3
	.4byte anim_mp_comm_msg_it_variant_4
	.4byte anim_mp_comm_msg_it_variant_5
	.4byte anim_mp_comm_msg_it_variant_6
	.4byte anim_mp_comm_msg_it_variant_7
	.4byte anim_mp_comm_msg_it_variant_8
	.4byte anim_mp_comm_msg_it_variant_9
