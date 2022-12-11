

anim_mp_comm_msg_en_variant_0:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x28ECE 84
	.4byte	1, 0

	mAnimCmd4 

anim_mp_comm_msg_en_variant_1:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x28F22 75
	.4byte	1, 1

	mAnimCmd4 

anim_mp_comm_msg_en_variant_2:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x28F6D 48
	.4byte	1, 2

	mAnimCmd4 

anim_mp_comm_msg_en_variant_3:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x28F9D 68
	.4byte	1, 3

	mAnimCmd4 

anim_mp_comm_msg_en_variant_4:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x28FE1 68
	.4byte	1, 4

	mAnimCmd4 

anim_mp_comm_msg_en_variant_5:
	mGetPalette 0x2CD 16 0x70
	mGetTiles 0x29025 68
	.4byte	1, 5

	mAnimCmd4 

anim_mp_comm_msg_en_variant_6:
	mGetPalette 0x2D3 16 0x60
	mGetTiles 0x29069 10
	.4byte	1, 6

	mAnimCmd4 

anim_mp_comm_msg_en_variant_7:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x29073 10
	.4byte	1, 7

	mAnimCmd4 

anim_mp_comm_msg_en_variant_8:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x2907D 36
	.4byte	1, 8

	mAnimCmd4 

anim_mp_comm_msg_en_variant_9:
	mGetPalette 0x2D2 16 0x70
	mGetTiles 0x290A1 50
	.4byte	1, 9

	mAnimCmd4 


anim_mp_comm_msg_en:
	.4byte anim_mp_comm_msg_en_variant_0
	.4byte anim_mp_comm_msg_en_variant_1
	.4byte anim_mp_comm_msg_en_variant_2
	.4byte anim_mp_comm_msg_en_variant_3
	.4byte anim_mp_comm_msg_en_variant_4
	.4byte anim_mp_comm_msg_en_variant_5
	.4byte anim_mp_comm_msg_en_variant_6
	.4byte anim_mp_comm_msg_en_variant_7
	.4byte anim_mp_comm_msg_en_variant_8
	.4byte anim_mp_comm_msg_en_variant_9
