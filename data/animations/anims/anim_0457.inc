

anim_data__0457_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x17DD6 9
	.4byte	3, 0

	mGetTiles 0x17DDF 9
	.4byte	3, 1

	mGetTiles 0x17DE8 6
	.4byte	3, 2

	mGetTiles 0x17DEE 6
	.4byte	3, 3

	mGetTiles 0x17DF4 6
	.4byte	3, 4

	mGetTiles 0x17DFA 9
	.4byte	3, 5

	mGetTiles 0x17E03 6
	.4byte	3, 6

	mGetTiles 0x17E09 6
	.4byte	3, 7

	mAnimCmd4 

anim_data__0457_1:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x17E0F 9
	mAnimCmd6 0x1 0x80DEEF3
	.4byte	2, 8

	mGetTiles 0x17E18 9
	.4byte	2, 9

	mJumpBack 0x10


anim_0457:
	.4byte anim_data__0457_0
	.4byte anim_data__0457_1
