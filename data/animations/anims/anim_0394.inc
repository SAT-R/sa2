
.align 2, 0
	anim_data__0394_0:
		mGetPalette 0x20 16 0x0
		mGetTiles 0x151BD 15
		.4byte	1, 0

		mGetTiles 0x151CC 20
		.4byte	1, 1

		mGetTiles 0x151E0 20
		.4byte	2, 2

		mGetTiles 0x151F4 20
		.4byte	5, 3

		mGetTiles 0x15208 20
		.4byte	5, 4

		mGetTiles 0x1521C 20
		.4byte	5, 5

		mGetTiles 0x15230 20
		.4byte	5, 6

		mGetTiles 0x151F4 20
		.4byte	5, 3

		mGetTiles 0x15208 20
		.4byte	5, 4

		mGetTiles 0x1521C 20
		.4byte	5, 5

		mGetTiles 0x15230 20
		.4byte	5, 6

		mGetTiles 0x15244 20
		.4byte	5, 7

		mGetTiles 0x15258 20
		.4byte	3, 8

		mGetTiles 0x1526C 20
		.4byte	4, 9

		mGetTiles 0x15280 20
		.4byte	6, 10

		mGetTiles 0x15294 20
		.4byte	6, 11

		mGetTiles 0x152A8 20
		.4byte	6, 12

		mGetTiles 0x152BC 20
		.4byte	6, 13

		mGetTiles 0x152D0 20
		.4byte	6, 14

		mGetTiles 0x15294 20
		.4byte	6, 11

		mGetTiles 0x152A8 20
		.4byte	6, 12

		mGetTiles 0x152BC 20
		.4byte	6, 13

		mGetTiles 0x152D0 20
		.4byte	6, 14

		mGetTiles 0x152E4 20
		.4byte	4, 15

		mGetTiles 0x152F8 20
		.4byte	3, 16

		mGetTiles 0x1530C 20
		.4byte	3, 17

		mGetTiles 0x15320 20
		.4byte	7, 18

		mGetTiles 0x15334 20
		.4byte	4, 19

		mGetTiles 0x15348 20
		.4byte	4, 20

		mGetTiles 0x1535C 20
		.4byte	6, 21

		mGetTiles 0x15370 20
		.4byte	3, 22

		mGetTiles 0x15384 20
		.4byte	3, 23

		mGetTiles 0x15398 20
		.4byte	3, 24

		mGetTiles 0x153AC 15
		.4byte	12, 25

		mGetTiles 0x153BB 20
		.4byte	4, 26

		mGetTiles 0x153CF 16
		.4byte	6, 27

		mAnimCmd4 

	anim_data__0394_1:
		mGetPalette 0x20 16 0x0
		mGetTiles 0x153DF 16
		.4byte	1, 28

		mGetTiles 0x153EF 16
		.4byte	6, 29

		mGetTiles 0x153FF 20
		.4byte	60, 30

		mGetTiles 0x15413 20
		.4byte	4, 31

		mAnimCmd4 


.align 2, 0
	anim_0394:
		.4byte anim_data__0394_0
		.4byte anim_data__0394_1
