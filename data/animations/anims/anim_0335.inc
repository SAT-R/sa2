

anim_data__0335_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x11D61 28
	mAnimCmd6 0x0 0x1E0600FA
	.4byte	2, 0

	mGetTiles 0x11D7D 24
	mAnimCmd6 0x0 0x180600FA
	.4byte	2, 1

	mGetTiles 0x11D95 16
	mAnimCmd6 0x0 0x100600FA
	.4byte	2, 2

	mGetTiles 0x11DA5 20
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 3

	mGetTiles 0x11DB9 24
	mAnimCmd6 0x0 0xFE06E0FA
	.4byte	4, 4

	mGetTiles 0x11DD1 20
	mAnimCmd6 0x0 0xFE06E6FA
	.4byte	3, 5

	mGetTiles 0x11DE5 16
	mAnimCmd6 0x0 0x206F0FA
	.4byte	2, 6

	mGetTiles 0x11DF5 18
	mAnimCmd6 0x0 0x1A06FCFA
	.4byte	2, 7

	mGetTiles 0x11D61 28
	mAnimCmd6 0x0 0x1E0400F8
	.4byte	4, 0

	mGetTiles 0x11D7D 24
	mAnimCmd6 0x0 0x180600FA
	.4byte	3, 1

	mGetTiles 0x11D95 16
	mAnimCmd6 0x0 0x100600FA
	.4byte	2, 2

	mGetTiles 0x11DA5 20
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 3

	mGetTiles 0x11DB9 24
	mAnimCmd6 0x0 0xFE06E0FA
	.4byte	2, 4

	mAnimCmd4 

anim_data__0335_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x11E07 28
	mAnimCmd6 0x0 0xFC06DEFA
	.4byte	2, 8

	mGetTiles 0x11E23 24
	mAnimCmd6 0x0 0xFE06E4FA
	.4byte	2, 9

	mGetTiles 0x11E3B 16
	mAnimCmd6 0x0 0x206F4FA
	.4byte	2, 10

	mGetTiles 0x11E4B 20
	mAnimCmd6 0x0 0x160600FA
	.4byte	2, 11

	mGetTiles 0x11E5F 24
	mAnimCmd6 0x0 0x160600FA
	.4byte	4, 12

	mGetTiles 0x11E77 20
	mAnimCmd6 0x0 0x200602FA
	.4byte	3, 13

	mGetTiles 0x11E8B 16
	mAnimCmd6 0x0 0x180602FA
	.4byte	2, 14

	mGetTiles 0x11E9B 18
	mAnimCmd6 0x0 0x406ECFA
	.4byte	2, 15

	mGetTiles 0x11E07 28
	mAnimCmd6 0x0 0xFC06DEFA
	.4byte	4, 8

	mGetTiles 0x11E23 24
	mAnimCmd6 0x0 0xFE06E4FA
	.4byte	3, 9

	mGetTiles 0x11E3B 16
	mAnimCmd6 0x0 0x206F4FA
	.4byte	2, 10

	mGetTiles 0x11E4B 20
	mAnimCmd6 0x0 0x160600FA
	.4byte	2, 11

	mGetTiles 0x11E5F 24
	mAnimCmd6 0x0 0x200602FA
	.4byte	2, 12

	mAnimCmd4 


anim_0335:
	.4byte anim_data__0335_0
	.4byte anim_data__0335_1
