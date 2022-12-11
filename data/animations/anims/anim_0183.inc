

anim_data__0183_0:
	mGetPalette 0xA 16 0x0
	mGetTiles 0x970D 20
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	6, 0

	mGetTiles 0x9721 25
	.4byte	8, 1

	mGetTiles 0x973A 25
	.4byte	6, 2

	mGetTiles 0x9753 20
	.4byte	6, 3

	mGetTiles 0x9767 20
	.4byte	8, 4

	mGetTiles 0x977B 20
	.4byte	6, 5

	mGetTiles 0x978F 24
	.4byte	6, 6

	mGetTiles 0x97A7 24
	.4byte	6, 7

	mGetTiles 0x97BF 24
	.4byte	6, 8

	mGetTiles 0x97D7 20
	.4byte	18, 9

	mGetTiles 0x97EB 20
	.4byte	6, 10

	mGetTiles 0x97FF 25
	.4byte	6, 11

	mGetTiles 0x9818 25
	.4byte	6, 12

	mGetTiles 0x9831 20
	.4byte	6, 13

	mGetTiles 0x9845 20
	.4byte	6, 14

	mGetTiles 0x9859 20
	.4byte	6, 15

	mGetTiles 0x986D 20
	.4byte	6, 16

	mGetTiles 0x9881 24
	.4byte	10, 17

	mGetTiles 0x9899 28
	.4byte	10, 18

	mGetTiles 0x98B5 24
	.4byte	10, 19

	mGetTiles 0x98CD 28
	.4byte	10, 20

	mGetTiles 0x98E9 24
	.4byte	10, 21

	mGetTiles 0x9901 24
	.4byte	10, 22

	mGetTiles 0x9919 24
	.4byte	10, 23

	mGetTiles 0x9931 24
	.4byte	10, 24

	mJumpBack 0x28

anim_data__0183_1:
	mGetPalette 0xA 16 0x0
	mGetTiles 0x9949 24
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	8, 25

	mGetTiles 0x9961 24
	.4byte	8, 26

	mGetTiles 0x9979 20
	.4byte	4, 27

	mGetTiles 0x998D 20
	.4byte	4, 28

	mGetTiles 0x99A1 20
	.4byte	4, 29

	mAnimCmd4 


anim_0183:
	.4byte anim_data__0183_0
	.4byte anim_data__0183_1
