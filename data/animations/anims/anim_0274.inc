

anim_data__0274_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xE8CB, 20
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	6, 0

	mGetTiles 0xE8DF, 20
	.4byte	5, 1

	mGetTiles 0xE8F3, 20
	.4byte	3, 2

	mGetTiles 0xE907, 20
	.4byte	5, 3

	mGetTiles 0xE8F3, 20
	.4byte	3, 2

	mGetTiles 0xE8DF, 20
	.4byte	5, 1

	mGetTiles 0xE8F3, 20
	.4byte	3, 2

	mGetTiles 0xE907, 20
	.4byte	5, 3

	mGetTiles 0xE8F3, 20
	.4byte	3, 2

	mGetTiles 0xE8DF, 20
	.4byte	6, 1

	mGetTiles 0xE91B, 20
	.4byte	4, 4

	mGetTiles 0xE92F, 20
	.4byte	5, 5

	mGetTiles 0xE943, 20
	.4byte	3, 6

	mGetTiles 0xE957, 20
	.4byte	5, 7

	mGetTiles 0xE943, 20
	.4byte	3, 6

	mGetTiles 0xE92F, 20
	.4byte	5, 5

	mGetTiles 0xE943, 20
	.4byte	3, 6

	mGetTiles 0xE957, 20
	.4byte	5, 7

	mGetTiles 0xE943, 20
	.4byte	3, 6

	mGetTiles 0xE92F, 20
	.4byte	6, 5

	mGetTiles 0xE8CB, 20
	.4byte	4, 0

	mGetTiles 0xE96B, 20
	.4byte	3, 8

	mGetTiles 0xE97F, 20
	.4byte	3, 9

	mGetTiles 0xE993, 20
	.4byte	2, 10

	mGetTiles 0xE9A7, 20
	.4byte	2, 11

	mGetTiles 0xE9BB, 20
	.4byte	4, 12

	mGetTiles 0xE96B, 20
	.4byte	3, 8

	mGetTiles 0xE97F, 20
	.4byte	3, 9

	mGetTiles 0xE993, 20
	.4byte	2, 10

	mGetTiles 0xE9A7, 20
	.4byte	2, 11

	mGetTiles 0xE9BB, 20
	.4byte	8, 12

	mGetTiles 0xE9CF, 20
	.4byte	2, 13

	mGetTiles 0xE9E3, 20
	.4byte	2, 14

	mGetTiles 0xE9F7, 25
	.4byte	2, 15

	mGetTiles 0xEA10, 30
	mAnimCmd6 0x1, 0x10FEEFE9
	mPlaySoundEffect 126
	.4byte	2, 16

	mGetTiles 0xEA2E, 25
	.4byte	4, 17

	mGetTiles 0xEA47, 25
	.4byte	2, 18

	mGetTiles 0xEA60, 20
	.4byte	2, 19

	mGetTiles 0xEA10, 30
	mAnimCmd6 0x1, 0x10FEEFE9
	mPlaySoundEffect 126
	.4byte	2, 16

	mGetTiles 0xEA2E, 25
	.4byte	4, 17

	mGetTiles 0xEA47, 25
	.4byte	2, 18

	mGetTiles 0xE9E3, 20
	.4byte	2, 14

	mGetTiles 0xEA74, 20
	.4byte	2, 20

	mGetTiles 0xEA88, 20
	.4byte	2, 21

	mGetTiles 0xEA9C, 20
	.4byte	2, 22

	mGetTiles 0xEAB0, 30
	mAnimCmd6 0x1, 0x10FEF0E7
	mPlaySoundEffect 126
	.4byte	2, 23

	mGetTiles 0xEACE, 30
	.4byte	4, 24

	mGetTiles 0xEA9C, 20
	.4byte	2, 22

	mGetTiles 0xEA88, 20
	.4byte	2, 21

	mGetTiles 0xE9CF, 20
	.4byte	2, 13

	mJumpBack 0x6E

anim_data__0274_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xE9CF, 20
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	1, 13

	mAnimCmd4 


anim_0274:
	.4byte anim_data__0274_0
	.4byte anim_data__0274_1
