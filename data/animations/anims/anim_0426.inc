

anim_data__0426_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16CC1, 24
	mAnimCmd6 0x0, 0x1A0600FA
	.4byte	2, 0

	mGetTiles 0x16CD9, 20
	mAnimCmd6 0x0, 0x1206FEFA
	.4byte	2, 1

	mGetTiles 0x16CED, 16
	mAnimCmd6 0x0, 0xA06FEFA
	.4byte	2, 2

	mGetTiles 0x16CFD, 16
	mAnimCmd6 0x0, 0x406F7FA
	.4byte	2, 3

	mGetTiles 0x16D0D, 24
	mAnimCmd6 0x0, 0x6EAFA
	.4byte	4, 4

	mGetTiles 0x16D25, 20
	mAnimCmd6 0x0, 0x606F2FA
	.4byte	3, 5

	mGetTiles 0x16D39, 16
	mAnimCmd6 0x0, 0x806FAFA
	.4byte	2, 6

	mGetTiles 0x16D49, 20
	mAnimCmd6 0x0, 0x140600FA
	.4byte	2, 7

	mGetTiles 0x16CC1, 24
	mAnimCmd6 0x0, 0x1A0600FA
	.4byte	4, 0

	mGetTiles 0x16CD9, 20
	mAnimCmd6 0x0, 0x1206FEFA
	.4byte	3, 1

	mGetTiles 0x16CED, 16
	mAnimCmd6 0x0, 0xA06FEFA
	.4byte	2, 2

	mGetTiles 0x16CFD, 16
	mAnimCmd6 0x0, 0x406F7FA
	.4byte	2, 3

	mGetTiles 0x16D0D, 24
	mAnimCmd6 0x0, 0x6EAFA
	.4byte	2, 4

	mAnimCmd4 

anim_data__0426_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x16D5D, 24
	.4byte	2, 8

	mGetTiles 0x16D75, 20
	mAnimCmd6 0x0, 0x206EEFA
	.4byte	2, 9

	mGetTiles 0x16D89, 16
	mAnimCmd6 0x0, 0x106F2FA
	.4byte	2, 10

	mGetTiles 0x16D99, 16
	mAnimCmd6 0x0, 0xC06FCFA
	.4byte	2, 11

	mGetTiles 0x16DA9, 24
	mAnimCmd6 0x0, 0x160600FA
	.4byte	4, 12

	mGetTiles 0x16DC1, 20
	mAnimCmd6 0x0, 0xE06FAFA
	.4byte	3, 13

	mGetTiles 0x16DD5, 16
	mAnimCmd6 0x0, 0x606F6FA
	.4byte	2, 14

	mGetTiles 0x16DE5, 20
	mAnimCmd6 0x0, 0x106ECFA
	.4byte	2, 15

	mGetTiles 0x16D5D, 24
	mAnimCmd6 0x0, 0x6E8FA
	.4byte	4, 8

	mGetTiles 0x16D75, 20
	mAnimCmd6 0x0, 0x206EEFA
	.4byte	3, 9

	mGetTiles 0x16D89, 16
	mAnimCmd6 0x0, 0x106F2FA
	.4byte	2, 10

	mGetTiles 0x16D99, 16
	mAnimCmd6 0x0, 0xC06FCFA
	.4byte	2, 11

	mGetTiles 0x16DA9, 24
	mAnimCmd6 0x0, 0x160600FA
	.4byte	2, 12

	mAnimCmd4 


anim_0426:
	.4byte anim_data__0426_0
	.4byte anim_data__0426_1
