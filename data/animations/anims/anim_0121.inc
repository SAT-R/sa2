

anim_data__0121_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x6C2F 20
	.4byte	6, 0

	mGetTiles 0x6C43 20
	.4byte	6, 1

	mGetTiles 0x6C2F 20
	.4byte	6, 0

	mGetTiles 0x6C57 20
	.4byte	6, 2

	mGetTiles 0x6C2F 20
	.4byte	6, 0

	mGetTiles 0x6C43 20
	.4byte	6, 1

	mGetTiles 0x6C2F 20
	.4byte	26, 0

	mGetTiles 0x6C6B 16
	.4byte	4, 3

	mGetTiles 0x6C7B 20
	.4byte	4, 4

	mGetTiles 0x6C8F 16
	.4byte	4, 5

	mGetTiles 0x6C9F 16
	.4byte	4, 6

	mGetTiles 0x6CAF 16
	.4byte	6, 7

	mGetTiles 0x6CBF 20
	.4byte	3, 8

	mGetTiles 0x6CD3 16
	.4byte	3, 9

	mGetTiles 0x6CE3 20
	.4byte	3, 10

	mGetTiles 0x6CBF 20
	.4byte	3, 8

	mGetTiles 0x6CD3 16
	.4byte	3, 9

	mGetTiles 0x6CE3 20
	.4byte	3, 10

	mGetTiles 0x6CBF 20
	.4byte	3, 8

	mGetTiles 0x6CD3 16
	.4byte	3, 9

	mGetTiles 0x6CE3 20
	.4byte	3, 10

	mGetTiles 0x6CF7 16
	.4byte	6, 11

	mGetTiles 0x6D07 16
	.4byte	4, 12

	mGetTiles 0x6D17 16
	.4byte	4, 13

	mGetTiles 0x6D27 16
	.4byte	8, 14

	mGetTiles 0x6D37 16
	.4byte	2, 15

	mGetTiles 0x6D47 20
	.4byte	2, 16

	mGetTiles 0x6D5B 20
	.4byte	5, 17

	mGetTiles 0x6D6F 25
	.4byte	3, 18

	mGetTiles 0x6D88 16
	.4byte	3, 19

	mGetTiles 0x6D98 20
	.4byte	14, 20

	mGetTiles 0x6DAC 20
	.4byte	3, 21

	mGetTiles 0x6DC0 20
	.4byte	3, 22

	mGetTiles 0x6DD4 15
	.4byte	4, 23

	mGetTiles 0x6DE3 12
	.4byte	2, 24

	mGetTiles 0x6DEF 16
	.4byte	2, 25

	mAnimCmd4 

anim_data__0121_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x6DFF 16
	.4byte	1, 26

	mGetTiles 0x6E0F 16
	.4byte	6, 27

	mGetTiles 0x6E1F 16
	.4byte	60, 28

	mGetTiles 0x6E2F 20
	.4byte	4, 29

	mAnimCmd4 


anim_0121:
	.4byte anim_data__0121_0
	.4byte anim_data__0121_1
