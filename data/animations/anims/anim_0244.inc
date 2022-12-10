
.align 2, 0
	anim_data__0244_0:
		mGetPalette 0x11 16 0x0
		mGetTiles 0xD32D 24
		mAnimCmd6 0x0 0x180604FA
		.4byte	2, 0

		mGetTiles 0xD345 20
		mAnimCmd6 0x0 0x140604FA
		.4byte	2, 1

		mGetTiles 0xD359 24
		mAnimCmd6 0x0 0x100602FA
		.4byte	2, 2

		mGetTiles 0xD371 24
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	2, 3

		mGetTiles 0xD389 24
		mAnimCmd6 0x0 0x206F4FA
		.4byte	4, 4

		mGetTiles 0xD3A1 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	3, 5

		mGetTiles 0xD3B1 30
		mAnimCmd6 0x0 0x806F8FA
		.4byte	2, 6

		mGetTiles 0xD3CF 24
		mAnimCmd6 0x0 0x140604FA
		.4byte	2, 7

		mGetTiles 0xD32D 24
		mAnimCmd6 0x0 0x180604FA
		.4byte	4, 0

		mGetTiles 0xD345 20
		mAnimCmd6 0x0 0x140604FA
		.4byte	3, 1

		mGetTiles 0xD359 24
		mAnimCmd6 0x0 0x100602FA
		.4byte	2, 2

		mGetTiles 0xD371 24
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	2, 3

		mGetTiles 0xD389 24
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0244_1:
		mGetPalette 0x11 16 0x0
		mGetTiles 0xD3E7 24
		mAnimCmd6 0x0 0xFD06E9FA
		.4byte	2, 8

		mGetTiles 0xD3FF 20
		mAnimCmd6 0x0 0xFC06ECFA
		.4byte	2, 9

		mGetTiles 0xD413 24
		mAnimCmd6 0x0 0xFE06EEFA
		.4byte	2, 10

		mGetTiles 0xD42B 24
		mAnimCmd6 0x0 0x406F6FA
		.4byte	2, 11

		mGetTiles 0xD443 24
		mAnimCmd6 0x0 0xE06FCFA
		.4byte	4, 12

		mGetTiles 0xD45B 16
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	3, 13

		mGetTiles 0xD46B 30
		mAnimCmd6 0x0 0x606F8FA
		.4byte	2, 14

		mGetTiles 0xD489 24
		mAnimCmd6 0x0 0x6ECFA
		.4byte	2, 15

		mGetTiles 0xD3E7 24
		mAnimCmd6 0x0 0xFD06E9FA
		.4byte	4, 8

		mGetTiles 0xD3FF 20
		mAnimCmd6 0x0 0xFC06ECFA
		.4byte	3, 9

		mGetTiles 0xD413 24
		mAnimCmd6 0x0 0xFE06EEFA
		.4byte	2, 10

		mGetTiles 0xD42B 24
		mAnimCmd6 0x0 0x406F6FA
		.4byte	2, 11

		mGetTiles 0xD443 24
		mAnimCmd6 0x0 0xE06FCFA
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0244:
		.4byte anim_data__0244_0
		.4byte anim_data__0244_1
