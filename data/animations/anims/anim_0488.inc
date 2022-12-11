

anim_data__0488_0:
	mGetPalette 0x37 16 0xC0
	mGetTiles 0x1988F 16
	mAnimCmd6 0x0 0x807F7F8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0488_1:
	mGetPalette 0x37 16 0xC0
	mGetTiles 0x1989F 16
	mAnimCmd6 0x0 0x808F7F9
	.4byte	1, 1

	mAnimCmd4 


anim_0488:
	.4byte anim_data__0488_0
	.4byte anim_data__0488_1
