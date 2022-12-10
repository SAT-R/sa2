

anim_data__0691_0:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CE7B 12
	mAnimCmd6 0x0 0x618FAE8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0691_1:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CE87 64
	.4byte	1, 1

	mAnimCmd4 

anim_data__0691_2:
	mGetPalette 0x97 16 0x80
	mGetTiles 0x1CE7B 12
	mAnimCmd6 0x0 0x618FAE8
	.4byte	2, 0

	mGetTiles 0x1CEC7 12
	.4byte	4, 2

	mJumpBack 0x10


anim_0691:
	.4byte anim_data__0691_0
	.4byte anim_data__0691_1
	.4byte anim_data__0691_2
