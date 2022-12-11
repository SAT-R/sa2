

anim_data__0532_0:
	mGetPalette 0x45 16 0x70
	mGetTiles 0x1A57C 4
	.4byte	5, 0

	mGetTiles 0x1A580 4
	.4byte	5, 1

	mGetTiles 0x1A584 2
	.4byte	5, 2

	mGetTiles 0x1A586 4
	.4byte	5, 3

	mGetTiles 0x1A58A 4
	.4byte	5, 4

	mGetTiles 0x1A58E 4
	.4byte	5, 5

	mGetTiles 0x1A592 2
	.4byte	5, 6

	mGetTiles 0x1A594 4
	.4byte	5, 7

	mJumpBack 0x2B

anim_data__0532_1:
	mGetPalette 0x45 16 0x70
	mGetTiles 0x1A594 4
	mAnimCmd6 0x0 0xC28F414
	.4byte	1, 7

	mAnimCmd4 


anim_0532:
	.4byte anim_data__0532_0
	.4byte anim_data__0532_1
