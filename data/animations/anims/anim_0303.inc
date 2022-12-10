

anim_data__0303_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x102AF 20
	.4byte	37, 0

	mGetTiles 0x102C3 20
	.4byte	6, 1

	mGetTiles 0x102D7 20
	.4byte	5, 2

	mGetTiles 0x102EB 20
	.4byte	3, 3

	mGetTiles 0x102FF 20
	.4byte	5, 4

	mGetTiles 0x102EB 20
	.4byte	3, 3

	mGetTiles 0x102D7 20
	.4byte	5, 2

	mGetTiles 0x102EB 20
	.4byte	3, 3

	mGetTiles 0x102FF 20
	.4byte	5, 4

	mGetTiles 0x102EB 20
	.4byte	3, 3

	mGetTiles 0x102D7 20
	.4byte	8, 2

	mGetTiles 0x10313 20
	.4byte	4, 5

	mGetTiles 0x10327 20
	.4byte	5, 6

	mGetTiles 0x1033B 20
	.4byte	3, 7

	mGetTiles 0x1034F 20
	.4byte	5, 8

	mGetTiles 0x1033B 20
	.4byte	3, 7

	mGetTiles 0x10327 20
	.4byte	10, 6

	mGetTiles 0x10363 20
	.4byte	5, 9

	mGetTiles 0x10377 25
	.4byte	4, 10

	mGetTiles 0x10390 20
	.4byte	2, 11

	mGetTiles 0x103A4 20
	.4byte	2, 12

	mGetTiles 0x103B8 20
	.4byte	2, 13

	mGetTiles 0x103CC 20
	.4byte	2, 14

	mGetTiles 0x103E0 20
	.4byte	2, 15

	mGetTiles 0x103F4 20
	.4byte	2, 16

	mGetTiles 0x10377 25
	.4byte	2, 10

	mGetTiles 0x10390 20
	.4byte	2, 11

	mGetTiles 0x103A4 20
	.4byte	2, 12

	mGetTiles 0x103B8 20
	.4byte	2, 13

	mGetTiles 0x103CC 20
	.4byte	2, 14

	mGetTiles 0x103E0 20
	.4byte	2, 15

	mGetTiles 0x103F4 20
	.4byte	2, 16

	mGetTiles 0x10377 25
	.4byte	12, 10

	mGetTiles 0x10363 20
	.4byte	6, 9

	mGetTiles 0x10408 20
	.4byte	4, 17

	mGetTiles 0x1041C 20
	.4byte	4, 18

	mGetTiles 0x10430 16
	.4byte	2, 19

	mAnimCmd4 

anim_data__0303_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x10430 16
	.4byte	1, 19

	mGetTiles 0x10440 20
	.4byte	6, 20

	mGetTiles 0x10454 20
	.4byte	60, 21

	mGetTiles 0x10468 30
	.4byte	4, 22

	mAnimCmd4 


anim_0303:
	.4byte anim_data__0303_0
	.4byte anim_data__0303_1
