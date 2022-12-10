

anim_data__1115_0:
	mGetPalette 0x2DC 16 0xF0
	mGetTiles 0x2ADED 36
	.4byte	1, 0

	mAnimCmd4 

anim_data__1115_1:
	mGetPalette 0x2DC 16 0xF0
	mGetTiles 0x2ADED 36
	.4byte	1, 0

	mGetTiles 0x2AE11 36
	.4byte	1, 1

	mGetTiles 0x2AE35 36
	.4byte	1, 2

	mGetTiles 0x2AE59 36
	.4byte	1, 3

	mGetTiles 0x2AE7D 36
	.4byte	1, 4

	mGetTiles 0x2AEA1 36
	.4byte	1, 5

	mGetTiles 0x2AEC5 36
	.4byte	1, 6

	mGetTiles 0x2AEE9 30
	.4byte	1, 7

	mGetTiles 0x2AF07 30
	.4byte	1, 8

	mGetTiles 0x2AF25 30
	.4byte	1, 9

	mGetTiles 0x2AF43 30
	.4byte	1, 10

	mGetTiles 0x2AF61 30
	.4byte	1, 11

	mGetTiles 0x2AF7F 25
	.4byte	1, 12

	mGetTiles 0x2AF98 25
	.4byte	1, 13

	mGetTiles 0x2AFB1 25
	.4byte	1, 14

	mGetTiles 0x2AFCA 25
	.4byte	1, 15

	mGetTiles 0x2AFE3 25
	.4byte	1, 16

	mGetTiles 0x2AFFC 20
	.4byte	1, 17

	mGetTiles 0x2B010 20
	.4byte	1, 18

	mGetTiles 0x2B024 20
	.4byte	1, 19

	mGetTiles 0x2B038 20
	.4byte	1, 20

	mGetTiles 0x2B04C 20
	.4byte	1, 21

	mGetTiles 0x2B060 25
	.4byte	1, 22

	mGetTiles 0x2B079 25
	.4byte	1, 23

	mGetTiles 0x2B092 25
	.4byte	1, 24

	mGetTiles 0x2B0AB 25
	.4byte	1, 25

	mGetTiles 0x2B0C4 25
	.4byte	1, 26

	mGetTiles 0x2B0DD 30
	.4byte	1, 27

	mGetTiles 0x2B0FB 30
	.4byte	1, 28

	mGetTiles 0x2B119 30
	.4byte	1, 29

	mGetTiles 0x2B137 30
	.4byte	1, 30

	mGetTiles 0x2B155 30
	.4byte	1, 31

	mGetTiles 0x2B173 36
	.4byte	1, 32

	mGetTiles 0x2B197 36
	.4byte	1, 33

	mGetTiles 0x2B1BB 36
	.4byte	1, 34

	mGetTiles 0x2B1DF 36
	.4byte	1, 35

	mGetTiles 0x2B203 36
	.4byte	1, 36

	mGetTiles 0x2B227 36
	.4byte	1, 37

	mJumpBack 0xC1


anim_1115:
	.4byte anim_data__1115_0
	.4byte anim_data__1115_1
