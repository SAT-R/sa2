

anim_data__0365_0:
	mGetPalette 0x1C 16 0x0
	mGetTiles 0x13271 16
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	3, 0

	mGetTiles 0x13281 16
	.4byte	5, 1

	mGetTiles 0x13291 16
	.4byte	5, 2

	mGetTiles 0x132A1 16
	.4byte	5, 3

	mGetTiles 0x132B1 20
	.4byte	5, 4

	mGetTiles 0x132C5 20
	.4byte	5, 5

	mGetTiles 0x132D9 15
	.4byte	5, 6

	mGetTiles 0x132E8 15
	.4byte	5, 7

	mGetTiles 0x132F7 25
	.4byte	5, 8

	mGetTiles 0x13310 25
	.4byte	5, 9

	mGetTiles 0x13329 25
	.4byte	5, 10

	mGetTiles 0x13342 25
	.4byte	5, 11

	mGetTiles 0x1335B 25
	.4byte	5, 12

	mGetTiles 0x13374 25
	.4byte	8, 13

	mGetTiles 0x1338D 30
	.4byte	5, 14

	mGetTiles 0x133AB 30
	.4byte	4, 15

	mGetTiles 0x133C9 25
	.4byte	12, 16

	mGetTiles 0x133E2 15
	.4byte	4, 17

	mGetTiles 0x133F1 20
	.4byte	12, 18

	mGetTiles 0x13405 15
	.4byte	5, 19

	mGetTiles 0x13414 15
	.4byte	5, 20

	mGetTiles 0x13423 15
	.4byte	5, 21

	mGetTiles 0x13432 15
	.4byte	10, 22

	mGetTiles 0x13441 15
	.4byte	4, 23

	mGetTiles 0x13450 20
	.4byte	4, 24

	mGetTiles 0x13464 15
	.4byte	4, 25

	mGetTiles 0x13473 16
	.4byte	6, 26

	mGetTiles 0x13483 20
	.4byte	4, 27

	mGetTiles 0x13497 20
	.4byte	4, 28

	mGetTiles 0x134AB 20
	.4byte	4, 29

	mGetTiles 0x134BF 15
	.4byte	4, 30

	mGetTiles 0x134CE 12
	.4byte	4, 31

	mGetTiles 0x134DA 15
	.4byte	4, 32

	mJumpBack 0x1E

anim_data__0365_1:
	mGetPalette 0x1C 16 0x0
	mGetTiles 0x134E9 12
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	4, 33

	mGetTiles 0x134F5 15
	.4byte	4, 34

	mGetTiles 0x13504 20
	.4byte	12, 35

	mGetTiles 0x13518 20
	.4byte	4, 36

	mAnimCmd4 


anim_0365:
	.4byte anim_data__0365_0
	.4byte anim_data__0365_1
