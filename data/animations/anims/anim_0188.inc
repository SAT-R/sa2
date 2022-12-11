

anim_data__0188_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x9C53 24
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0x9C6B 20
	.4byte	2, 1

	mGetTiles 0x9C7F 20
	.4byte	2, 2

	mGetTiles 0x9C93 16
	.4byte	2, 3

	mAnimCmd4 


anim_0188:
	.4byte anim_data__0188_0
