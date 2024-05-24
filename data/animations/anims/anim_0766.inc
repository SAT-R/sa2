

anim_data__0766_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x1FAB3, 24
	.4byte	3, 0

	mGetTiles 0x1FACB, 24
	.4byte	3, 1

	mGetTiles 0x1FAE3, 24
	.4byte	3, 2

	mJumpBack 0x12

anim_data__0766_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x1FAFB, 12
	.4byte	1, 3

	mGetTiles 0x1FB07, 16
	.4byte	1, 4

	mGetTiles 0x1FB17, 16
	.4byte	12, 5

	mGetTiles 0x1FB27, 16
	.4byte	2, 6

	mGetTiles 0x1FB37, 12
	.4byte	2, 7

	mAnimCmd4 


anim_0766:
	.4byte anim_data__0766_0
	.4byte anim_data__0766_1
