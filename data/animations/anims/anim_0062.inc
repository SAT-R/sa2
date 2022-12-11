

anim_data__0062_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x35BB 28
	mAnimCmd6 0x0 0x1E0600FA
	.4byte	2, 0

	mGetTiles 0x35D7 24
	mAnimCmd6 0x0 0x180600FA
	.4byte	2, 1

	mGetTiles 0x35EF 16
	mAnimCmd6 0x0 0x100600FA
	.4byte	2, 2

	mGetTiles 0x35FF 20
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 3

	mGetTiles 0x3613 28
	mAnimCmd6 0x0 0xFE06E0FA
	.4byte	4, 4

	mGetTiles 0x362F 24
	mAnimCmd6 0x0 0xFE06E6FA
	.4byte	3, 5

	mGetTiles 0x3647 16
	mAnimCmd6 0x0 0x206F0FA
	.4byte	2, 6

	mGetTiles 0x3657 24
	mAnimCmd6 0x0 0x1A06FCFA
	.4byte	2, 7

	mGetTiles 0x35BB 28
	mAnimCmd6 0x0 0x1E0400F8
	.4byte	4, 0

	mGetTiles 0x35D7 24
	mAnimCmd6 0x0 0x180600FA
	.4byte	3, 1

	mGetTiles 0x35EF 16
	mAnimCmd6 0x0 0x100600FA
	.4byte	2, 2

	mGetTiles 0x35FF 20
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 3

	mGetTiles 0x3613 28
	mAnimCmd6 0x0 0xFE06E0FA
	.4byte	2, 4

	mAnimCmd4 

anim_data__0062_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x366F 28
	mAnimCmd6 0x0 0xFC06DEFA
	.4byte	2, 8

	mGetTiles 0x368B 24
	mAnimCmd6 0x0 0xFE06E4FA
	.4byte	2, 9

	mGetTiles 0x36A3 16
	mAnimCmd6 0x0 0x206F4FA
	.4byte	2, 10

	mGetTiles 0x36B3 20
	mAnimCmd6 0x0 0x160600FA
	.4byte	2, 11

	mGetTiles 0x36C7 28
	mAnimCmd6 0x0 0x200602FA
	.4byte	4, 12

	mGetTiles 0x36E3 24
	mAnimCmd6 0x0 0x180602FA
	.4byte	3, 13

	mGetTiles 0x36FB 16
	mAnimCmd6 0x0 0x100600FA
	.4byte	2, 14

	mGetTiles 0x370B 24
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 15

	mGetTiles 0x366F 28
	mAnimCmd6 0x0 0xFC06DEFA
	.4byte	4, 8

	mGetTiles 0x368B 24
	mAnimCmd6 0x0 0xFE06E4FA
	.4byte	3, 9

	mGetTiles 0x36A3 16
	mAnimCmd6 0x0 0x206F4FA
	.4byte	2, 10

	mGetTiles 0x36B3 20
	mAnimCmd6 0x0 0x160600FA
	.4byte	2, 11

	mGetTiles 0x36C7 28
	mAnimCmd6 0x0 0x200602FA
	.4byte	2, 12

	mAnimCmd4 


anim_0062:
	.4byte anim_data__0062_0
	.4byte anim_data__0062_1
