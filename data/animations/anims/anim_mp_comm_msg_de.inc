

anim_mp_comm_msg_de_variant_0:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x290D3, 90
	.4byte	1, 0

	mAnimCmd4 

anim_mp_comm_msg_de_variant_1:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x2912D, 75
	.4byte	1, 1

	mAnimCmd4 

anim_mp_comm_msg_de_variant_2:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x29178, 69
	.4byte	1, 2

	mAnimCmd4 

anim_mp_comm_msg_de_variant_3:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x291BD, 88
	.4byte	1, 3

	mAnimCmd4 

anim_mp_comm_msg_de_variant_4:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x29215, 88
	.4byte	1, 4

	mAnimCmd4 

anim_mp_comm_msg_de_variant_5:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x2926D, 88
	.4byte	1, 5

	mAnimCmd4 

anim_mp_comm_msg_de_variant_6:
	mGetPalette 0x2D3, 16, 0x60
	mGetTiles 0x292C5, 15
	.4byte	1, 6

	mAnimCmd4 

anim_mp_comm_msg_de_variant_7:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x292D4, 21
	.4byte	1, 7

	mAnimCmd4 

anim_mp_comm_msg_de_variant_8:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x292E9, 42
	.4byte	1, 8

	mAnimCmd4 

anim_mp_comm_msg_de_variant_9:
	mGetPalette 0x2D2, 16, 0x70
	mGetTiles 0x29313, 51
	.4byte	1, 9

	mAnimCmd4 


anim_mp_comm_msg_de:
	.4byte anim_mp_comm_msg_de_variant_0
	.4byte anim_mp_comm_msg_de_variant_1
	.4byte anim_mp_comm_msg_de_variant_2
	.4byte anim_mp_comm_msg_de_variant_3
	.4byte anim_mp_comm_msg_de_variant_4
	.4byte anim_mp_comm_msg_de_variant_5
	.4byte anim_mp_comm_msg_de_variant_6
	.4byte anim_mp_comm_msg_de_variant_7
	.4byte anim_mp_comm_msg_de_variant_8
	.4byte anim_mp_comm_msg_de_variant_9
