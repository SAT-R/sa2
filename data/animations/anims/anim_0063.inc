

anim_data__0063_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3723 16
	mAnimCmd6 0x0 0xA0EFCF6
	.4byte	2, 0

	mGetTiles 0x3733 25
	mAnimCmd6 0x0 0xEEEF6
	.4byte	2, 1

	mGetTiles 0x374C 35
	mAnimCmd6 0x0 0xFE0EE5F6
	.4byte	4, 2

	mGetTiles 0x376F 25
	mAnimCmd6 0x0 0xEEDF6
	.4byte	3, 3

	mGetTiles 0x3788 12
	mAnimCmd6 0x0 0x60EF6F6
	.4byte	2, 4

	mGetTiles 0x3794 20
	mAnimCmd6 0x0 0x180E00F6
	.4byte	2, 5

	mGetTiles 0x37A8 28
	mAnimCmd6 0x0 0x200E02F6
	.4byte	4, 6

	mGetTiles 0x37C4 20
	mAnimCmd6 0x0 0x140E00F6
	.4byte	3, 7

	mGetTiles 0x3723 16
	mAnimCmd6 0x0 0xA0EFCF6
	.4byte	2, 0

	mAnimCmd4 

anim_data__0063_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x37D8 16
	mAnimCmd6 0x0 0x80EF6F6
	.4byte	2, 8

	mGetTiles 0x37E8 25
	mAnimCmd6 0x0 0x160E00F6
	.4byte	2, 9

	mGetTiles 0x3801 35
	mAnimCmd6 0x0 0x220E02F6
	.4byte	4, 10

	mGetTiles 0x3824 25
	mAnimCmd6 0x0 0x160E00F6
	.4byte	3, 11

	mGetTiles 0x383D 12
	mAnimCmd6 0x0 0xA0EFAF6
	.4byte	2, 12

	mGetTiles 0x3849 20
	mAnimCmd6 0x0 0x20EEAF6
	.4byte	2, 13

	mGetTiles 0x385D 28
	mAnimCmd6 0x0 0x20EE4F6
	.4byte	4, 14

	mGetTiles 0x3879 20
	mAnimCmd6 0x0 0x20EEEF6
	.4byte	3, 15

	mGetTiles 0x37D8 16
	mAnimCmd6 0x0 0x80EF6F6
	.4byte	2, 8

	mAnimCmd4 


anim_0063:
	.4byte anim_data__0063_0
	.4byte anim_data__0063_1
