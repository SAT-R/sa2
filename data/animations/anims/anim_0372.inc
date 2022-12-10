

anim_data__0372_0:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x136B2 16
	mAnimCmd6 0x0 0x1006F4FA
	.4byte	1, 0

	mGetTiles 0x136C2 20
	.4byte	1, 1

	mGetTiles 0x136D6 25
	.4byte	3, 2

	mGetTiles 0x136EF 25
	.4byte	3, 3

	mJumpBack 0xA

anim_data__0372_1:
	mGetPalette 0x1B 16 0x0
	mGetTiles 0x13708 20
	mAnimCmd6 0x0 0x1206F6FA
	.4byte	2, 4

	mGetTiles 0x1371C 12
	.4byte	1, 5

	mGetTiles 0x13728 12
	.4byte	1, 6

	mAnimCmd4 


anim_0372:
	.4byte anim_data__0372_0
	.4byte anim_data__0372_1
