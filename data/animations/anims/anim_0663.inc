

anim_data__0663_0:
	mGetPalette 0x4B 16 0xA0
	mGetTiles 0x1C9AD 20
	mAnimCmd6 0x0 0x808F2F8
	.4byte	5, 0

	mGetTiles 0x1C9C1 32
	mAnimCmd6 0x0 0x808D4F8
	.4byte	5, 1

	mGetTiles 0x1C9E1 32
	mAnimCmd6 0x0 0x808D0F8
	.4byte	5, 2

	mGetTiles 0x1CA01 32
	mAnimCmd6 0x0 0xEC08D7F8
	.4byte	5, 3

	mGetTiles 0x1CA21 32
	mAnimCmd6 0x0 0x47004700
	.4byte	5, 4

	mGetTiles 0x1CA41 28
	.4byte	4, 5

	mGetTiles 0x1CA5D 28
	.4byte	4, 6

	mAnimCmd4 


anim_0663:
	.4byte anim_data__0663_0
