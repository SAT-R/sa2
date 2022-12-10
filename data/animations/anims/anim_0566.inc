

anim_data__0566_0:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB94 18
	mAnimCmd6 0x0 0xF818F6E8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0566_1:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1ABA6 24
	mAnimCmd6 0x0 0x1018EFE8
	.4byte	1, 1

	mAnimCmd4 


anim_0566:
	.4byte anim_data__0566_0
	.4byte anim_data__0566_1
