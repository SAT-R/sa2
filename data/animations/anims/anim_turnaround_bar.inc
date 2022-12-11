

anim_turnaround_bar_variant_0:
	mGetPalette 0x43 16 0x70
	mGetTiles 0x1ABBE 8
	.4byte	1, 0

	mAnimCmd4 

anim_turnaround_bar_variant_1:
	mGetPalette 0x43 16 0x70
	mGetTiles 0x1ABBE 8
	.4byte	2, 0

	mGetTiles 0x1ABC6 8
	.4byte	2, 1

	mGetTiles 0x1ABCE 12
	.4byte	4, 2

	mGetTiles 0x1ABC6 8
	.4byte	3, 1

	mGetTiles 0x1ABBE 8
	.4byte	2, 0

	mGetTiles 0x1ABDA 8
	.4byte	2, 3

	mGetTiles 0x1ABE2 8
	.4byte	4, 4

	mGetTiles 0x1ABDA 8
	.4byte	3, 3

	mGetTiles 0x1ABBE 8
	.4byte	2, 0

	mGetTiles 0x1ABC6 8
	.4byte	2, 1

	mGetTiles 0x1ABCE 12
	.4byte	4, 2

	mGetTiles 0x1ABC6 8
	.4byte	3, 1

	mGetTiles 0x1ABBE 8
	.4byte	2, 0

	mAnimCmd4 

anim_turnaround_bar_variant_2:
	mGetPalette 0x43 16 0x70
	mGetTiles 0x1ABE2 8
	.4byte	1, 4

	mGetTiles 0x1ABCE 12
	.4byte	1, 2

	mGetTiles 0x1ABC6 8
	.4byte	1, 1

	mGetTiles 0x1ABBE 8
	.4byte	1, 0

	mGetTiles 0x1ABDA 8
	.4byte	1, 3

	mGetTiles 0x1ABBE 8
	.4byte	1, 0

	mGetTiles 0x1ABC6 8
	.4byte	1, 1

	mGetTiles 0x1ABBE 8
	.4byte	1, 0

	mAnimCmd4 


anim_turnaround_bar:
	.4byte anim_turnaround_bar_variant_0
	.4byte anim_turnaround_bar_variant_1
	.4byte anim_turnaround_bar_variant_2
