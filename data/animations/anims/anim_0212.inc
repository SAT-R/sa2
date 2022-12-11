

anim_data__0212_0:
	mGetPalette 0xA 16 0x0
	mGetTiles 0xB553 16
	.4byte	6, 0

	mGetTiles 0xB563 20
	.4byte	4, 1

	mGetTiles 0xB577 20
	.4byte	4, 2

	mGetTiles 0xB58B 20
	.4byte	4, 3

	mGetTiles 0xB59F 20
	.4byte	6, 4

	mGetTiles 0xB5B3 20
	.4byte	4, 5

	mGetTiles 0xB5C7 20
	.4byte	4, 6

	mGetTiles 0xB563 20
	.4byte	4, 1

	mGetTiles 0xB553 16
	.4byte	6, 0

	mGetTiles 0xB563 20
	.4byte	4, 1

	mGetTiles 0xB577 20
	.4byte	4, 2

	mGetTiles 0xB58B 20
	.4byte	4, 3

	mGetTiles 0xB59F 20
	.4byte	6, 4

	mGetTiles 0xB5B3 20
	.4byte	4, 5

	mGetPalette 0xA 16 0x0
	mGetTiles 0xB5DB 20
	.4byte	6, 7

	mGetTiles 0xB5EF 20
	.4byte	4, 8

	mGetTiles 0xB603 25
	.4byte	4, 9

	mGetTiles 0xB61C 20
	.4byte	8, 10

	mGetTiles 0xB630 20
	.4byte	6, 11

	mGetTiles 0xB644 20
	.4byte	6, 12

	mGetTiles 0xB630 20
	.4byte	6, 11

	mGetTiles 0xB61C 20
	.4byte	8, 10

	mGetTiles 0xB658 16
	.4byte	4, 13

	mGetTiles 0xB668 25
	.4byte	4, 14

	mGetTiles 0xB681 20
	.4byte	4, 15

	mGetTiles 0xB695 20
	.4byte	6, 16

	mGetTiles 0xB6A9 20
	.4byte	4, 17

	mGetTiles 0xB6BD 20
	.4byte	16, 18

	mGetTiles 0xB6D1 20
	.4byte	2, 19

	mGetTiles 0xB6E5 20
	.4byte	4, 20

	mGetTiles 0xB6F9 20
	.4byte	4, 21

	mGetTiles 0xB70D 20
	.4byte	4, 22

	mGetTiles 0xB721 20
	.4byte	4, 23

	mGetTiles 0xB735 20
	.4byte	4, 24

	mGetTiles 0xB6F9 20
	.4byte	4, 21

	mGetTiles 0xB749 20
	.4byte	6, 25

	mGetTiles 0xB75D 24
	.4byte	2, 26

	mJumpBack 0xBF

anim_data__0212_1:
	mGetPalette 0xA 16 0x0
	mGetTiles 0xB775 20
	.4byte	1, 27

	mGetTiles 0xB789 20
	.4byte	6, 28

	mGetTiles 0xB79D 24
	.4byte	60, 29

	mGetTiles 0xB7B5 24
	.4byte	4, 30

	mAnimCmd4 


anim_0212:
	.4byte anim_data__0212_0
	.4byte anim_data__0212_1
