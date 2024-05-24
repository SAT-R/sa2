

anim_mp_msg_variant_0:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28B03, 90
	.4byte	1, 0

	mAnimCmd4 

anim_mp_msg_variant_1:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28B5D, 51
	.4byte	1, 1

	mAnimCmd4 

anim_mp_msg_variant_2:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28B90, 57
	.4byte	1, 2

	mAnimCmd4 

anim_mp_msg_variant_3:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28BC9, 66
	.4byte	1, 3

	mAnimCmd4 

anim_mp_msg_variant_4:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28C0B, 66
	.4byte	1, 4

	mAnimCmd4 

anim_mp_msg_variant_5:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28C4D, 66
	.4byte	1, 5

	mAnimCmd4 

anim_mp_msg_variant_6:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28C8F, 15
	.4byte	1, 6

	mJumpBack 0x8

anim_mp_msg_variant_7:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28C9E, 30
	.4byte	1, 7

	mJumpBack 0x8

anim_mp_msg_variant_8:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28CBC, 4
	.4byte	1, 8

	mJumpBack 0x8

anim_mp_msg_variant_9:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28CC0, 4
	.4byte	1, 9

	mJumpBack 0x8

anim_mp_msg_variant_10:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28CC4, 4
	.4byte	1, 10

	mJumpBack 0x8

anim_mp_msg_variant_11:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28CC8, 30
	.4byte	1, 11

	mAnimCmd4 

anim_mp_msg_variant_12:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28CE6, 66
	.4byte	1, 12

	mAnimCmd4 

anim_mp_msg_variant_13:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28D28, 6
	.4byte	1, 13

	mJumpBack 0x8

anim_mp_msg_variant_14:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28D2E, 8
	.4byte	1, 14

	mJumpBack 0x8

anim_mp_msg_variant_15:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28D36, 8
	.4byte	1, 15

	mJumpBack 0x8

anim_mp_msg_variant_16:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28D3E, 8
	.4byte	1, 16

	mJumpBack 0x8

anim_mp_msg_variant_17:
	mGetPalette 0x2CF, 16, 0x60
	mGetTiles 0x28D46, 12
	.4byte	1, 17

	mAnimCmd4 

anim_mp_msg_variant_18:
	mGetPalette 0x2CD, 16, 0x70
	mGetTiles 0x28D52, 18
	.4byte	1, 18

	mAnimCmd4 


anim_mp_msg:
	.4byte anim_mp_msg_variant_0
	.4byte anim_mp_msg_variant_1
	.4byte anim_mp_msg_variant_2
	.4byte anim_mp_msg_variant_3
	.4byte anim_mp_msg_variant_4
	.4byte anim_mp_msg_variant_5
	.4byte anim_mp_msg_variant_6
	.4byte anim_mp_msg_variant_7
	.4byte anim_mp_msg_variant_8
	.4byte anim_mp_msg_variant_9
	.4byte anim_mp_msg_variant_10
	.4byte anim_mp_msg_variant_11
	.4byte anim_mp_msg_variant_12
	.4byte anim_mp_msg_variant_13
	.4byte anim_mp_msg_variant_14
	.4byte anim_mp_msg_variant_15
	.4byte anim_mp_msg_variant_16
	.4byte anim_mp_msg_variant_17
	.4byte anim_mp_msg_variant_18
