

anim_data__0752_0:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F2FA 6
	.4byte	1, 0

	mGetTiles 0x1F300 6
	.4byte	1, 1

	mGetTiles 0x1F306 6
	.4byte	1, 2

	mGetTiles 0x1F30C 6
	.4byte	1, 3

	mGetTiles 0x1F312 6
	.4byte	1, 4

	mAnimCmd4 

anim_data__0752_1:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F312 6
	.4byte	1, 4

	mAnimCmd4 


anim_0752:
	.4byte anim_data__0752_0
	.4byte anim_data__0752_1
