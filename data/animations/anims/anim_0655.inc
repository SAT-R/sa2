

anim_data__0655_0:
	mGetPalette 0x8B 16 0x80
	mGetTiles 0x1C706 30
	mAnimCmd6 0x0 0x720F8E1
	mAnimCmd6 0x1 0xDFFFDE
	mAnimCmd6 0x2 0x23FF22
	.4byte	4, 0

	mGetTiles 0x1C724 30
	.4byte	4, 1

	mGetTiles 0x1C742 30
	.4byte	4, 2

	mGetTiles 0x1C760 30
	.4byte	4, 3

	mJumpBack 0x20


anim_0655:
	.4byte anim_data__0655_0
