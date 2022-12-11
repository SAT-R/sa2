

anim_data__0835_0:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x22255 15
	.4byte	4, 0

	mGetTiles 0x22264 15
	.4byte	4, 1

	mAnimCmd4 

anim_data__0835_1:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x22273 20
	.4byte	4, 2

	mGetTiles 0x22287 20
	.4byte	4, 3

	mGetTiles 0x2229B 20
	.4byte	4, 4

	mGetTiles 0x222AF 20
	.4byte	4, 5

	mGetTiles 0x222C3 20
	.4byte	6, 6

	mGetTiles 0x222D7 20
	.4byte	2, 7

	mGetTiles 0x222EB 20
	.4byte	2, 8

	mGetTiles 0x222FF 20
	.4byte	6, 9

	mGetTiles 0x22313 20
	.4byte	4, 10

	mGetTiles 0x22327 20
	.4byte	4, 11

	mGetTiles 0x22264 15
	.4byte	4, 1

	mAnimCmd4 

anim_data__0835_2:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x22255 15
	.4byte	1, 0

	mAnimCmd4 

anim_data__0835_3:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x2233B 15
	.4byte	6, 12

	mGetTiles 0x2234A 15
	.4byte	40, 13

	mGetTiles 0x22359 20
	.4byte	6, 14

	mGetTiles 0x2236D 20
	.4byte	6, 15

	mGetTiles 0x22381 24
	.4byte	6, 16

	mGetTiles 0x22399 24
	.4byte	6, 17

	mGetTiles 0x223B1 24
	.4byte	2, 18

	mGetTiles 0x223C9 24
	.4byte	2, 19

	mGetTiles 0x223E1 20
	.4byte	2, 20

	mJumpBack 0xF

anim_data__0835_4:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x223B1 24
	.4byte	2, 18

	mGetTiles 0x223C9 24
	.4byte	2, 19

	mGetTiles 0x223E1 20
	.4byte	2, 20

	mAnimCmd4 

anim_data__0835_5:
	mGetPalette 0xDC 16 0x0
	mGetTiles 0x223B1 24
	.4byte	2, 18

	mGetTiles 0x223C9 24
	.4byte	2, 19

	mGetTiles 0x223E1 20
	.4byte	2, 20

	mGetPalette 0xDD 16 0x0
	mGetTiles 0x223F5 24
	.4byte	2, 21

	mGetTiles 0x2240D 24
	.4byte	2, 22

	mGetTiles 0x22425 20
	.4byte	2, 23

	mJumpBack 0x24


anim_0835:
	.4byte anim_data__0835_0
	.4byte anim_data__0835_1
	.4byte anim_data__0835_2
	.4byte anim_data__0835_3
	.4byte anim_data__0835_4
	.4byte anim_data__0835_5
