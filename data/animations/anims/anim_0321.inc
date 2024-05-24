

anim_data__0321_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10D5F, 20
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	1, 0

	mGetTiles 0x10D73, 20
	.4byte	2, 1

	mGetTiles 0x10D5F, 20
	.4byte	1, 0

	mAnimCmd4 

anim_data__0321_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10D87, 30
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	4, 2

	mGetTiles 0x10DA5, 30
	.4byte	4, 3

	mGetTiles 0x10DC3, 32
	mAnimCmd6 0x0, 0xE06F0FA
	mAnimCmd6 0x1, 0xFE0EE4F2
	.4byte	8, 4

	mGetTiles 0x10DE3, 28
	.4byte	8, 5

	mGetTiles 0x10DFF, 25
	.4byte	8, 6

	mAnimCmd4 

anim_data__0321_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10E18, 30
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	7, 7

	mGetTiles 0x10E36, 30
	.4byte	6, 8

	mGetTiles 0x10E54, 30
	.4byte	3, 9

	mGetTiles 0x10E72, 30
	.4byte	3, 10

	mGetTiles 0x10E90, 30
	.4byte	3, 11

	mJumpBack 0xF

anim_data__0321_3:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x10EAE, 6
	.4byte	2, 12

	mGetTiles 0x10EB4, 12
	.4byte	2, 13

	mGetTiles 0x10EC0, 20
	.4byte	2, 14

	mGetTiles 0x10ED4, 20
	.4byte	2, 15

	mGetTiles 0x10EE8, 24
	.4byte	3, 16

	mGetTiles 0x10F00, 24
	.4byte	3, 17

	mGetTiles 0x10F18, 24
	.4byte	3, 18

	mGetTiles 0x10F30, 9
	.4byte	3, 19

	mAnimCmd4 


anim_0321:
	.4byte anim_data__0321_0
	.4byte anim_data__0321_1
	.4byte anim_data__0321_2
	.4byte anim_data__0321_3
