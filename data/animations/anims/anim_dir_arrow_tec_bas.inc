

anim_dir_arrow_tec_bas_variant_0:
	mGetPalette 0x7C 16 0xB0
	mGetTiles 0x1B8D3 8
	mAnimCmd6 0x0 0x8F2F0
	.4byte	5, 0

	mGetTiles 0x1B8DB 8
	.4byte	5, 1

	mGetTiles 0x1B8E3 8
	.4byte	5, 2

	mJumpBack 0x15

anim_dir_arrow_tec_bas_variant_1:
	mGetPalette 0x7C 16 0xB0
	mGetTiles 0x1B8EB 12
	mAnimCmd6 0x0 0x209F3F0
	.4byte	5, 3

	mGetTiles 0x1B8F7 12
	.4byte	5, 4

	mGetTiles 0x1B903 12
	.4byte	5, 5

	mJumpBack 0x15

anim_dir_arrow_tec_bas_variant_2:
	mGetPalette 0x7C 16 0xB0
	mGetTiles 0x1B90F 12
	mAnimCmd6 0x0 0x209F4F0
	.4byte	5, 6

	mGetTiles 0x1B91B 12
	.4byte	5, 7

	mGetTiles 0x1B927 12
	.4byte	5, 8

	mJumpBack 0x15

anim_dir_arrow_tec_bas_variant_3:
	mGetPalette 0x7D 16 0xB0
	mGetTiles 0x1B933 16
	mAnimCmd6 0x0 0x709EEF0
	.4byte	5, 9

	mGetTiles 0x1B943 16
	.4byte	5, 10

	mGetTiles 0x1B953 16
	.4byte	5, 11

	mJumpBack 0x15

anim_dir_arrow_tec_bas_variant_4:
	mGetPalette 0x7D 16 0xB0
	mGetTiles 0x1B963 16
	mAnimCmd6 0x0 0x607F2F0
	.4byte	5, 12

	mGetTiles 0x1B973 16
	.4byte	5, 13

	mGetTiles 0x1B983 16
	.4byte	5, 14

	mJumpBack 0x15

anim_dir_arrow_tec_bas_variant_5:
	mGetPalette 0x7C 16 0xB0
	mGetTiles 0x1B993 8
	mAnimCmd6 0x0 0x1000F8F2
	.4byte	5, 15

	mGetTiles 0x1B99B 8
	.4byte	5, 16

	mGetTiles 0x1B9A3 8
	.4byte	5, 17

	mJumpBack 0x15


anim_dir_arrow_tec_bas:
	.4byte anim_dir_arrow_tec_bas_variant_0
	.4byte anim_dir_arrow_tec_bas_variant_1
	.4byte anim_dir_arrow_tec_bas_variant_2
	.4byte anim_dir_arrow_tec_bas_variant_3
	.4byte anim_dir_arrow_tec_bas_variant_4
	.4byte anim_dir_arrow_tec_bas_variant_5
