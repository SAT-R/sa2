
.align 2, 0
	anim_data__0573_0:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE69 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0573_1:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE69 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 0

		mGetTiles 0x1AE75 12
		mAnimCmd6 0x0 0x512FB00
		.4byte	2, 1

		mGetTiles 0x1AE81 20
		mAnimCmd6 0x0 0x521FB00
		.4byte	1, 2

		mGetTiles 0x1AE95 16
		mAnimCmd6 0x0 0x51DFB00
		.4byte	5, 3

		mGetTiles 0x1AEA5 20
		mAnimCmd6 0x0 0x520FB00
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0573_2:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AEB9 16
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0573_3:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AEB9 16
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 5

		mGetTiles 0x1AEC9 9
		mAnimCmd6 0x0 0xFB10F106
		.4byte	2, 6

		mGetTiles 0x1AED2 25
		mAnimCmd6 0x0 0xF01BE611
		.4byte	1, 7

		mGetTiles 0x1AEEB 25
		mAnimCmd6 0x0 0xF417EA0D
		.4byte	5, 8

		mGetTiles 0x1AF04 25
		mAnimCmd6 0x0 0xF11AE710
		.4byte	3, 9

		mAnimCmd4 

	anim_data__0573_4:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AF1D 12
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0573_5:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AF1D 12
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 10

		mGetTiles 0x1AF29 6
		mAnimCmd6 0x0 0x10F906
		.4byte	2, 11

		mGetTiles 0x1AF2F 20
		mAnimCmd6 0x0 0xF81BEE11
		.4byte	1, 12

		mGetTiles 0x1AF43 20
		mAnimCmd6 0x0 0xFC17F20D
		.4byte	5, 13

		mGetTiles 0x1AF57 20
		mAnimCmd6 0x0 0xF91AEF10
		.4byte	3, 14

		mAnimCmd4 


.align 2, 0
	anim_0573:
		.4byte anim_data__0573_0
		.4byte anim_data__0573_1
		.4byte anim_data__0573_2
		.4byte anim_data__0573_3
		.4byte anim_data__0573_4
		.4byte anim_data__0573_5
