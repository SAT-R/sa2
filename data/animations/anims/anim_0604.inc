

anim_data__0604_0:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B760 12
	mAnimCmd6 0x0 0x5ECFB
	.4byte	1, 0

	mAnimCmd4 

anim_data__0604_1:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B760 12
	mAnimCmd6 0x0 0x5ECFB
	.4byte	1, 0

	mGetTiles 0x1B76C 12
	mAnimCmd6 0x0 0x5EEFB
	.4byte	2, 1

	mGetTiles 0x1B778 20
	mAnimCmd6 0x0 0x5DFFB
	.4byte	1, 2

	mGetTiles 0x1B78C 16
	mAnimCmd6 0x0 0x5DFFB
	.4byte	5, 3

	mGetTiles 0x1B79C 20
	mAnimCmd6 0x0 0x5E0FB
	.4byte	3, 4

	mAnimCmd4 

anim_data__0604_2:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B7B0 12
	mAnimCmd6 0x0 0x514FB00
	.4byte	1, 5

	mAnimCmd4 

anim_data__0604_3:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B7B0 12
	mAnimCmd6 0x0 0x514FB00
	.4byte	1, 5

	mGetTiles 0x1B7BC 12
	mAnimCmd6 0x0 0x512FB00
	.4byte	2, 6

	mGetTiles 0x1B7C8 20
	mAnimCmd6 0x0 0x521FB00
	.4byte	1, 7

	mGetTiles 0x1B7DC 16
	mAnimCmd6 0x0 0x51DFB00
	.4byte	5, 8

	mGetTiles 0x1B7EC 20
	mAnimCmd6 0x0 0x520FB00
	.4byte	3, 9

	mAnimCmd4 

anim_data__0604_4:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B800 9
	mAnimCmd6 0x0 0xF814EE0A
	.4byte	1, 10

	mAnimCmd4 

anim_data__0604_5:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B800 9
	mAnimCmd6 0x0 0xF814EE0A
	.4byte	1, 10

	mGetTiles 0x1B809 9
	mAnimCmd6 0x0 0xFB10F106
	.4byte	2, 11

	mGetTiles 0x1B812 16
	mAnimCmd6 0x0 0xF01BE611
	.4byte	1, 12

	mGetTiles 0x1B822 16
	mAnimCmd6 0x0 0xF417EA0D
	.4byte	5, 13

	mGetTiles 0x1B832 16
	mAnimCmd6 0x0 0xF11AE710
	.4byte	3, 14

	mAnimCmd4 

anim_data__0604_6:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B842 6
	mAnimCmd6 0x0 0x14F60A
	.4byte	1, 15

	mAnimCmd4 

anim_data__0604_7:
	mGetPalette 0x78 16 0xB0
	mGetTiles 0x1B842 6
	mAnimCmd6 0x0 0x14F60A
	.4byte	1, 15

	mGetTiles 0x1B848 6
	mAnimCmd6 0x0 0x10F906
	.4byte	2, 16

	mGetTiles 0x1B84E 12
	mAnimCmd6 0x0 0xF81BEE11
	.4byte	1, 17

	mGetTiles 0x1B85A 12
	mAnimCmd6 0x0 0xFC17F20D
	.4byte	5, 18

	mGetTiles 0x1B866 12
	mAnimCmd6 0x0 0xF91AEF10
	.4byte	3, 19

	mAnimCmd4 


anim_0604:
	.4byte anim_data__0604_0
	.4byte anim_data__0604_1
	.4byte anim_data__0604_2
	.4byte anim_data__0604_3
	.4byte anim_data__0604_4
	.4byte anim_data__0604_5
	.4byte anim_data__0604_6
	.4byte anim_data__0604_7
