

anim_data__0500_0:
	mGetPalette 0x3B 16 0xC0
	mGetTiles 0x19E18 10
	mAnimCmd6 0x0 0x10F3F4
	.4byte	1, 0

	mAnimCmd4 

anim_data__0500_1:
	mGetPalette 0x3B 16 0xC0
	mGetTiles 0x19E22 12
	mAnimCmd6 0x0 0xDF2F2
	.4byte	3, 1

	mGetTiles 0x19E2E 12
	.4byte	3, 2

	mGetTiles 0x19E3A 12
	.4byte	3, 3

	mJumpBack 0x15

anim_data__0500_2:
	mGetPalette 0x3B 16 0xC0
	mGetTiles 0x19E46 8
	mAnimCmd6 0x0 0xCF2F5
	.4byte	10, 4

	mGetTiles 0x19E4E 8
	.4byte	10, 5

	mGetTiles 0x19E56 8
	.4byte	10, 6

	mGetTiles 0x19E5E 8
	mAnimCmd6 0x0 0xCF2F5
	.4byte	10, 7

	mAnimCmd4 


anim_0500:
	.4byte anim_data__0500_0
	.4byte anim_data__0500_1
	.4byte anim_data__0500_2
