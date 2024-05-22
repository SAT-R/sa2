

anim_spring_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A614, 12
	mAnimCmd6 0x0, 0x5ECFB
	.4byte	1, 0

	mAnimCmd4 

anim_spring_variant_1:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A614, 12
	mAnimCmd6 0x0, 0x5ECFB
	.4byte	1, 0

	mGetTiles 0x1A620, 12
	mAnimCmd6 0x0, 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1A62C, 20
	mAnimCmd6 0x0, 0x5DFFB
	.4byte	1, 2

	mGetTiles 0x1A640, 16
	mAnimCmd6 0x0, 0x5E3FB
	.4byte	5, 3

	mGetTiles 0x1A650, 20
	mAnimCmd6 0x0, 0x5E0FB
	.4byte	3, 4

	mAnimCmd4 

anim_spring_variant_2:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A664, 12
	mAnimCmd6 0x0, 0x514FB00
	.4byte	1, 5

	mAnimCmd4 

anim_spring_variant_3:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A664, 12
	mAnimCmd6 0x0, 0x514FB00
	.4byte	1, 5

	mGetTiles 0x1A670, 12
	mAnimCmd6 0x0, 0x512FB00
	.4byte	2, 6

	mGetTiles 0x1A67C, 20
	mAnimCmd6 0x0, 0x521FB00
	.4byte	1, 7

	mGetTiles 0x1A690, 16
	mAnimCmd6 0x0, 0x51DFB00
	.4byte	5, 8

	mGetTiles 0x1A6A0, 20
	mAnimCmd6 0x0, 0x520FB00
	.4byte	3, 9

	mAnimCmd4 

anim_spring_variant_4:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A6B4, 12
	mAnimCmd6 0x0, 0xF814EE0A
	.4byte	1, 10

	mAnimCmd4 

anim_spring_variant_5:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A6B4, 12
	mAnimCmd6 0x0, 0xF814EE0A
	.4byte	1, 10

	mGetTiles 0x1A6C0, 9
	mAnimCmd6 0x0, 0xFB10F106
	.4byte	2, 11

	mGetTiles 0x1A6C9, 20
	mAnimCmd6 0x0, 0xF01BE611
	.4byte	1, 12

	mGetTiles 0x1A6DD, 16
	mAnimCmd6 0x0, 0xF417EA0D
	.4byte	5, 13

	mGetTiles 0x1A6ED, 16
	mAnimCmd6 0x0, 0xF11AE710
	.4byte	3, 14

	mAnimCmd4 

anim_spring_variant_6:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A6FD, 8
	mAnimCmd6 0x0, 0x14F60A
	.4byte	1, 15

	mAnimCmd4 

anim_spring_variant_7:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1A6FD, 8
	mAnimCmd6 0x0, 0x14F60A
	.4byte	1, 15

	mGetTiles 0x1A705, 6
	mAnimCmd6 0x0, 0x10F906
	.4byte	2, 16

	mGetTiles 0x1A70B, 15
	mAnimCmd6 0x0, 0xF81BEE11
	.4byte	1, 17

	mGetTiles 0x1A71A, 12
	mAnimCmd6 0x0, 0xFC17F20D
	.4byte	5, 18

	mGetTiles 0x1A726, 12
	mAnimCmd6 0x0, 0xF91AEF10
	.4byte	3, 19

	mAnimCmd4 


anim_spring:
	.4byte anim_spring_variant_0
	.4byte anim_spring_variant_1
	.4byte anim_spring_variant_2
	.4byte anim_spring_variant_3
	.4byte anim_spring_variant_4
	.4byte anim_spring_variant_5
	.4byte anim_spring_variant_6
	.4byte anim_spring_variant_7
