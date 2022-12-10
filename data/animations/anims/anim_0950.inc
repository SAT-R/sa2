

anim_data__0950_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24455 18
	.4byte	1, 0

	mAnimCmd4 

anim_data__0950_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24467 18
	.4byte	1, 1

	mAnimCmd4 

anim_data__0950_2:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x24479 18
	.4byte	1, 2

	mAnimCmd4 

anim_data__0950_3:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x2448B 51
	.4byte	1, 3

	mAnimCmd4 

anim_data__0950_4:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x244BE 12
	mAnimCmd6 0x0 0x68386737
	.4byte	1, 4

	mAnimCmd4 

anim_data__0950_5:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x244CA 12
	.4byte	1, 5

	mAnimCmd4 

anim_data__0950_6:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x244D6 12
	.4byte	1, 6

	mAnimCmd4 

anim_data__0950_7:
	mGetPalette 0x2B3 16 0x0
	mGetTiles 0x244E2 66
	.4byte	1, 7

	mAnimCmd4 

anim_data__0950_8:
	mGetPalette 0xA1 16 0xF0
	mGetTiles 0x24524 1
	.4byte	6, 8

	mGetTiles 0x24525 2
	.4byte	6, 9

	mGetTiles 0x24527 2
	.4byte	6, 10

	mGetTiles 0x24529 2
	.4byte	6, 11

	mJumpBack 0x17

anim_data__0950_9:
	mGetPalette 0xA1 16 0xF0
	mGetTiles 0x2452B 1
	.4byte	6, 12

	mGetTiles 0x2452C 2
	.4byte	6, 13

	mGetTiles 0x2452E 2
	.4byte	6, 14

	mGetTiles 0x24530 2
	.4byte	6, 15

	mJumpBack 0x17

anim_data__0950_10:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x24532 14
	.4byte	1, 16

	mAnimCmd4 


anim_0950:
	.4byte anim_data__0950_0
	.4byte anim_data__0950_1
	.4byte anim_data__0950_2
	.4byte anim_data__0950_3
	.4byte anim_data__0950_4
	.4byte anim_data__0950_5
	.4byte anim_data__0950_6
	.4byte anim_data__0950_7
	.4byte anim_data__0950_8
	.4byte anim_data__0950_9
	.4byte anim_data__0950_10
